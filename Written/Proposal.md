# DataBase Project 1 Proposal

 ### 2. Proposal Demo


#### 2.1 High-level Description Of The Application

For project 1, we plan to build a music recommender database based on the data on [Spotify](https://developer.spotify.com/web-api/) and [Rovi](http://developer.rovicorp.com/docs) API. To achieve this goal, we will include entities like users, artists, albums, tracks, playlists, and metadata like moods or genres. The relationship sets will also be built accordingly. 

A web application will be implemented in part 3 to incorporate the following functionalities:
1. Once the user has signed up and login, we will show some hot artists or tracks for them to choose for the cold start part, thus we could build the user profile and store them. 
2. Based on the user records, we could recommend tracks, artists, playlists to the user once logged in.
3. we offer different playlists for the user according to moods or environments  as they wish.

##### Challenges:
1. To construct suitable databse structure to describe the relationships between entities
2. To implement and optimize recommendation algorithm based on user profile (like/ dislike of artists, genre or mood)
3. To design a easy to use, esthetically pleasing web application interface.

##### Contingency Plan
Should there be any unexpected condition regarding the team formation and contribution effort down-sizing, the recommendation application can be down-graded to an multi-criteria music search application.

#### 2.2 Entities Sets, Relationship Sets With Attributes And Constraints

The demo of the ER Map:

![enter image description here](ER_v2.png)

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


