class PlaylistsController < ApplicationController
    before '/playlists/*' do
        authentication_required
    end

    get '/playlists' do
        # show someone all of their playlists
        # where will always return an array
        #@playlists = Playlist.where(:user => current_user)
        @playlists = current_user.playlists
        erb :"playlists/index.html"
    end

    get '/playlists/new' do
        erb :"playlists/new.html"
    end

    post '/playlists' do
        @playlist = Playlist.new
        @playlist.name = params[:name]
        @playlist.user = current_user # using active record objects to make the
        ## association

        if @playlist.save
            redirect '/playlists'
        else
            erb :"playlists/new.html"
        end
    end
end
# to get '/playlists/new' to work the other thing that I have to remember to do
# (in sinatra) once I create a new controller you HAVE to remember to go to
# config.ru and mount that controller

# #before - the before method takes in a url pattern
## for which to apply the following rule
