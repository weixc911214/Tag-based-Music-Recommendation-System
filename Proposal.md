# DataBase Project 1 Proposal


### 1. What you need to do for Part 1

**Find a team-mate.** 
There's no need to notify us of this; you will simply indicate who your team-mate is when you submit Part 1.
If you will do the project on Unix machines, get a CS account if neither you nor your team-mate has one.
Prepare your proposal. Decide on an application for your project and:
 
**Write a relatively informal, one-paragraph description of the application, not to exceed 20 lines or so, highlighting interesting and challenging parts.**  The more concrete your written description, the more efficient and useful the meeting with the class staff will be (see below). This paragraph should include:

* A high-level description of the general domain of the application. 


* An idea of what entities and relationship sets you will have, including attributes and constraints. 

*  Data: An idea of what data you will use to populate your database later on.
  
* Write a short description (a few lines) of your contingency plan (see above).
 

Meet with a TA **during the week of Monday Feb 2 through Friday Feb 6** to discuss your design and make sure that it is appropriate (i.e., challenging enough, but not unrealistically so).  
This meeting is required and should last about five minutes. Your grade for Part 1 will be decreased substantially if you don't meet with any of the class staff. We will have expanded office hours during that week that you will be able to see on the class website. Please show up early in the week to minimize delays. We will not be taking appointments, so please show up directly during office hours. Both team members should attend the meeting, at the same time. For this meeting, bring the written materials described in the previous point (i.e., in item (3)). **The TA's approval should be indicated with an "Approved By TA's name" box at the top of your proposal.** 
 
After a TA has approved your general application, your plans for Part 3, and your contingency plan, modify your description based on the feedback that you were given, and write an E/R diagram (following the syntax that we saw in class) of your database, specifying as many of the real-world constraints for your application as possible. 
 
Submit: 
1. your one-paragraph description of the application (which you should have revised based on the feedback from your meeting with one of the class staff), 
2.  your E/R diagram
3.  your resulting SQL schema
4.  your one-paragraph description of your expansion plans for Part 3, if you are following the Expanded-Design Option (which you should have revised based on the feedback from your meeting with one of the class staff)
5.   your contingency plan (again, revised as appropriate based on your meeting with one of the class staff), 
6.  a copy of the proposal you discussed with one of the class staff that includes an "Approved By <TA name>" box indicating who approved your project. 

You should submit all these materials electronically by **Monday Feb 9, 5pm.**
 

### 2. Proposal Demo


#### 2.1 High-level Description Of The Application

For project 1, we plan to build a music recommender system based on the data on [Spotify](https://developer.spotify.com/web-api/) and [Rovi](http://developer.rovicorp.com/docs). To achieve this goal, we will include entities like users, artists, albums, tracks, playlists, and metadata like moods or genres. The relationship sets will also be built accordingly. 

1. Once the user has signed up and login, we will show some hot artists or tracks for them to choose for the cold start part, thus we could build the user profile and store them. 
2. Based on the user records, we could recommend tracks, artists, playlists to the user once logged in.
3. we offer different playlists for the user according to moods or environments  as they wish.

#### 2.2 Entities Sets, Relationship Sets With Attributes And Constraints

The demo of the ER Map:

![enter image description here](ER.png)

#### 2.3 The Resources of data

For the dataset part, we want to make use the practical data in the real world instead of just generating random and worthless ones. We use the API from [Spotify](https://developer.spotify.com/web-api/) and [Rovi](http://developer.rovicorp.com/docs) to get the informations about artists, albums, tracks and metadata like moods and tags.

For now, parts of the data has been downloaded and stored in JSON format locally. We will import them into database after designing the structure and schema of the whole DB.


Here is a sample of the JSON-format data:

```
{
  "genres": [
    "teen pop"
  ],
  "name": "Miley Cyrus",
  "external_urls": {
    "spotify": "https://open.spotify.com/artist/5YGY8feqx7naU7z4HrwZM6"
  },
  "popularity": 86,
  "uri": "spotify:artist:5YGY8feqx7naU7z4HrwZM6",
  "href": "https://api.spotify.com/v1/artists/5YGY8feqx7naU7z4HrwZM6",
  "followers": {
    "total": 1159797,
    "href": null
  },
  "images": [
    {
      "url": "https://i.scdn.co/image/a43b45e1a4fb11d428a3e0018122d94829c821bd",
      "width": 1000,
      "height": 1254
    },
    {
      "url": "https://i.scdn.co/image/f942c1a103d2706643906c412bc5122a557f35ee",
      "width": 640,
      "height": 802
    },
    {
      "url": "https://i.scdn.co/image/94bcf3604205309e20adccf09a5534457992fc0c",
      "width": 200,
      "height": 251
    },
    {
      "url": "https://i.scdn.co/image/835259e06462618f2b7d3825d917db0a71cbef66",
      "width": 64,
      "height": 80
    }
  ],
  "type": "artist",
  "id": "5YGY8feqx7naU7z4HrwZM6"
}
```
#### 2.4 Contingency Plan


