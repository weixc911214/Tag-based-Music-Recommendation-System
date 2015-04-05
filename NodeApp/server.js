//Setup web server and socket
var express = require('express'),
    mysql = require('mysql'),
    bodyParser = require('body-parser'),
    app = express(),
    http = require('http'),
    server = http.createServer(app);

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
	        else 
	          // if everything is OK, return null as the error
	          // and the authenticated user
	          console.log("Login Success")
            login_username = name
            login_userid = rows[0].user_id
            console.log(login_userid)
	          res.sendfile('homepage.html', {root: './public/html/'});
	    });

	    console.log(query.sql);

});

// sign up new accounts
// 
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
              res.sendFile('homepage.html', {root: './public/html/'});
            }
          });
        }
    });
    console.log(query.sql);
});

// homepage, return to the homepage of the application
app.get('/homepage', function (req, res){
	res.sendFile('homepage.html', {root: './public/html/'});
});

// logout, redirect to the origin index page
app.get('/logout', function (req, res){
  res.redirect("/index.html");
});

app.get('/playlists', function (req, res){
  res.sendFile('homepage.html', {root: './public/html/'})

});

