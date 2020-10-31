Sprint 1:
User Functionality
    /register
    /login
    /logout

Sprint 2: Basic playlist
    New
    Create
    Index
    Show

Sprint 3: Adding Songs
    Create the song model
    wire up associations
    add an add song form (new song) to playlist show


-------------------
    User
    authentication
    email / password
    unitue emails
    many playlists



1. Plan application

User
    authentication
    email / password
    unique emails
    many playlists

playlist
    has_many songs

playlists
id name user_id
1 bite the dust 1

songs
    playlist_id url
    1           bitethedust.mp3


/playlists/ => shows you your playlists
/playlists/new
/playlists/1 # Show
preview of the playlist we plan on deploying - only the user to be able to see this so its not shareable via our application

/playlists/1/songs #=> songs resource
add songs
edits songs

/register
/login
/logout

----
It would be nice to have a nice UI/Theme

/playlists/deploy => which generates and deploys the static site to surge
