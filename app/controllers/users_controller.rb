class UsersController < ApplicationController

    get '/register' do
        erb :'users/new.html'
    end

    post '/users' do
        # raise params.inspect
        @user = User.new
        @user.email = params[:email]
        @user.password = params[:password]

        if @user.save
            redirect "/login"
        else
            erb :'users/new.html'
        end
    end

    get '/login' do
        erb :'users/login.html'
    end

    post '/login' do
        binding.pry
        # this does not actually log them in this actually confirms that they entered in the correct info for their login
        @user = User.find_by(:email => params[:email])
        if @user && @user.authenticate(params[:password])# provided by has_secure_password encript password and takes care of
            ## the encription of their password agenst their plan text
            # assuming they logged in correctly
            session["user_id"] = @user.id
            redirect "/"
        else
            erb :'users/login.html'
        end
    end

    get '/logout' do
        session.clear # this will erase the users user_id
        redirect '/'
    end
end
# Do this later!! VV
# to log them in we have to put something in there session or cokiees to remember that they are logged in
