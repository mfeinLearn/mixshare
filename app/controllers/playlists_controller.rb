class PlaylistsController < ApplicationController
    ## The order of these routes matter!!! sanatra is going to pick the first route that matches the condition of the url pattern

    ### NOTE: put your more pasific routes first/ at the beginning
    before '/playlists/*' do
        authentication_required
    end

# <% %> - logic embeded ruby tag
# <%= %> - the write embeded ruby tag
# <% @playlists.each do |playlist|%> -
### iterate over all of those playlists objects yeald them as an argumet playlist

    get '/playlists' do
        # -> We use the user's has many playlists association in order to get all of the playlists that belong to the person to the person that is currently logged in
        # show someone all of their playlists
        # where will always return an array
        #@playlists = Playlist.where(:user => current_user)
        @playlists = current_user.playlists
        erb :"playlists/index.html"
    end

    get '/playlists/new' do
        erb :"playlists/new.html"
    end

    get '/playlists/:id' do # :id - is a route variable -> we intend for what ever data comes in as an :id (to this part of the url )
        ## to be availible in params under this approperly named key(:id)
        @playlist = current_user.playlists.find(params[:id])

        erb :"playlists/show.html"

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
