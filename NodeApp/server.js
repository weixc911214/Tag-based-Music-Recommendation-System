//Setup web server and socket
var express = require('express'),
    mysql = require('mysql'),
    bodyParser = require('body-parser'),
    app = express(),
    http = require('http'),
    server = http.createServer(app);

app.set('view engine', 'ejs');

var musicdb = new mysql.createConnection({
  host     : 'cs4111.cnjryr7wwjlv.us-west-2.rds.amazonaws.com',
  user     : 'xw2355xw2353',
  password : 'musicrecommendation',
  database : 'cs4111'
});

//connect to specified database
musicdb.connect(function(err){
  if(!err) {
      console.log("Database is connected ...");  
  } else {
      console.log("Error connecting database ...");  
  }
});

//Use the default port (for beanstalk) or default to 8081 locally
server.listen(process.env.PORT || 8081);

//Setup rotuing for app
//app.use(express.static(__dirname + '/public'));
app.use(express.static(__dirname + '/public/html'));
app.use(bodyParser());

//global variables for individual user session
var login_username = "";
var login_userid = -1;

//app routing methods
app.get('/',function(req,res){
  res.sendFile('index.html');
  //It will find and locate index.html from View or Scripts
});

app.get('/tosignup', function (req, res){
	res.sendfile('signup.html', {root: './public/html/'});
})

app.post('/login', function (req, res){
  //check passwords
  var name = req.body.username;
  var pwd = req.body.password;
  var user_col = ['user_id','user_name', 'user_pwd'];
	    var query = musicdb.query('select ?? from ?? where user_name = ?', [user_col, 'users', name], 
	      function (err, rows, fields){
	        if(err)
	          console.log(err);
	        else if(!rows.length){
	          console.log("User does not exist");
	          res.sendfile('index.html', {root: './public/html/'});
	        }
	        else if(rows[0].user_pwd !== pwd){
	          console.log("Wrong password");
	          res.sendfile('index.html', {root: './public/html/'});
	        }
	        else{ 
	          // authenticated user
	          console.log("Login Success");
            login_username = name;
            login_userid = rows[0].user_id;
            res.redirect('/homepage');
          }
	    });
});

// sign up new accounts
// then direct to login page for login
app.post('/signup', function (req, res){
  var name = req.body.username;
  var pwd = req.body.password;
  var conf = req.body.confirm;
  var query = musicdb.query('select ?? from ?? where user_name = ?', ['user_name', 'users', name], 
      function (err, rows, fields){
        if(err)
          console.log(err);
        else if(rows.length){
          console.log("The username is taken");
          res.sendFile('signup.html', {root: './public/html/'});
        }
        else if(pwd !== conf){
        		console.log("The username is taken");
          	res.sendFile('signup.html', {root: './public/html/'});
        }
        else{
          // if the name does not exist, write to database
          musicdb.query('select max(user_id) as mIndex from users', function (err, rows, fields){
            if(err)
              console.log(err);
            else if(!rows.length){
              console.log("Unexpected error in database");
              res.sendFile('signup.html', {root: './public/html/'});
            }
            else{
              var user_details = {"user_id": rows[0].mIndex+1, "user_name": name, "user_pwd": pwd};
              musicdb.query('INSERT INTO users SET ?', user_details,
                function (err, result){
                  if(err)
                    console.log(err);
              });
              res.sendFile('index.html', {root: './public/html/'});
            }
          });
        }
    });
    console.log(query.sql);
});

// homepage, return to the homepage of the application
// set global json for individual user session
app.get('/homepage', function (req, res){
  if(!login_username.length) {
    res.redirect("/index.html");
  }
	musicdb.query('select * from playlists where user_id = ?',[login_userid], function (err, user_list, fields) {
    if(err) console.log(err);
    else{
      //console.log(user_list);
      musicdb.query('select track_id from prefered_songs where user_id = ?', [login_userid], 
      function (err, user_liked, fields){
        if(err) console.log(err);
        else{
          musicdb.query('select * from songs where track_id < 100', function (err, songs, fields) {
              if(err)
                console.log(err);
              else{
                  musicdb.query('select * from albums where album_id < 110', function (err, albums, fields){
                    if(err)
                      console.log(err);
                    else{
                      var data = {songs: songs, albums: albums, playlists: user_list, likes: user_liked, username: login_username};
                      res.render('pages/home', data);
                    }
                  });// end of album recommendation
              }
          });// end of song recommendation
        }
      });// end of user_liked query
    }
  });// end of user_list query 
});//end of get homepage

// logout, redirect to the origin index page
app.get('/logout', function (req, res){
  res.redirect("/index.html");
});


// Question: how to display playlist details according to its name? -- SOLVED
app.get('/playlists', function (req, res){
  if(!login_username.length) {
    res.redirect("/index.html");
  }

  var list;
  // get the playlists of login_user
  var query = musicdb.query('select * from playlists where user_id = ?',[login_userid],
    function (err, rows, fields) {
      if(err)
        console.log(err);
      else
      {
        list = rows
          // console.log(login_username);
          // console.log(list)
          res.render('pages/playlists', {list : list, username : login_username});
        // console.log(rows[0].list_id);
      }


    });

});

app.post('/search', function (req, res) {
  var search_query = req.body.query;
  // console.log(query)

  var query = musicdb.query('select * from songs where songs.name like ?',['%'+search_query+'%'],
    function (err, list, fields) {
      if(err)
        console.log(err);
      else
      {
        musicdb.query('select * from playlists where user_id = ?',[login_userid], function (err, playlists, fields) {
          if(err)
            console.log(err);
          else {
            res.render('pages/search', {list : list, playlists:playlists});
          }
            
        });
      }
    }); 
});

app.get('/playlist/*', function (req, res) {
  var url = req.originalUrl.split("/");
  // get the list id
  var playlist_id = url[url.length - 1];

  var query = musicdb.query('select songs.name as track_name, songs.track_id as track_id from songs, listed_songs where songs.track_id = listed_songs.track_id and list_id = ?',[playlist_id],
    function (err, rows, fields) {
      if(err)
        console.log(err);
      else
      {
        list = rows
          // console.log(login_username);
          console.log(list)
          res.render('pages/list', {list : list, username : "Amy"});
        // console.log(rows[0].list_id);
      }


    });

});

// add new playlist
app.post('/newlist', function (req, res) {
  var list_name = req.body.query;

  musicdb.query('INSERT INTO playlists(user_id, list_name) values (?, ?)', [login_userid, list_name],
    function (err, result){
      if(err)
        console.log(err);

      res.redirect('/playlists');
  
  });
});

// remove a playlist
app.get('/removelist/*', function (req, res) {
  var url = req.originalUrl.split("/");
  var playlist_id = url[url.length - 1];

  musicdb.query('DELETE FROM playlists WHERE list_id = ?', playlist_id,
    function (err, result){
      if(err)
        console.log(err);

      res.redirect('/playlists')
  
  });
});


app.get('/removetrack/*', function (req, res) {
  var url = req.originalUrl.split("/");
  var track_id = url[url.length - 1];
  var redirect_url = req.headers.referer;

  musicdb.query('DELETE FROM listed_songs WHERE track_id = ?', track_id,
    function (err, result){
      if(err)
        console.log(err);
      res.redirect(redirect_url);
  
  });
});

app.get('/addtolist/*', function (req, res) {
  var url = req.originalUrl.split("/");
  var track_id = url[url.length - 1];
  var list_id = url[url.length - 2];
  var redirect_url = req.headers.referer;
  musicdb.query('INSERT INTO listed_songs(track_id, list_id) VALUES(?, ?)', [track_id, list_id],
    function (err, result){
      if(err)
        console.log(err);
      else
        res.redirect(redirect_url);
  
  });
});

app.get('/like/*', function (req, res) {
  var url = req.originalUrl.split("/");
  var ctrack_id = url[url.length - 1];
  var redirect_url = req.headers.referer;
  var likes = [];
  musicdb.query('select * from prefered_songs where user_id = ?', [login_userid], function (err, rows, fields){
    if(err) console.log(err);
    else{
      likes = rows;
      console.log(likes);
      var count = 0;
      for(var i = 0; i<likes.length; i++)
        if(ctrack_id == likes[i].track_id) 
          ++count;
      if(count>0)
      {musicdb.query('delete from prefered_songs where track_id = ? and user_id = ?', [ctrack_id, login_userid], 
                  function (err, rows){
                    if(err)   console.log(err);
                    //res.redirect(redirect_url);
                    console.log("reach deletion");
                });}
      else
      {musicdb.query('insert into prefered_songs set ?', {user_id: login_userid, track_id: ctrack_id}, 
              function (err, rows){
                if(err) console.log(err);
                //res.redirect(redirect_url);
                console.log("reach insertion");
              });}
    }
  }); // end of query likes
});
