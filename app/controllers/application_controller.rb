class ApplicationController < Sinatra::Base
register Sinatra::ActiveRecordExtension
use Rack::Flash

  configure do
    enable :sessions
    set :session_secret, "mixshareapp-1234"

    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

      helpers do
          def logged_in?
              !!current_user
          end
          # !! - is a way of converting truthy and falsey values to honest to god true or false
          #=> nil !nil => true => !true => false
          #=> #=> #<User> !#<User> => false !false => true
          # true if this method was able to populate this instance variable (@user)
          # false if what ever reason it was not

          def current_user
              # if their is a value in session user id try to find the user whos id is equal to that session user_id
              ## and assign that user to the instance variable @user
              # -----------------
              # Because @user was not populated ||= (this or equals) would trigger the right side
              # which would ask is their a session user id if so find that user and assign it to the instance
              # variable
              # this will return nil if their is not user id in the session
              # or it will return what ever user was found
              @current_user ||= User.find(session[:user_id]) if session[:user_id]
          end

          def authentication_required
              if !logged_in?
                  @error_msg = "You Must Be Logged in"
                  # flash[:notice] = "You must be logged in."
                  redirect '/'
              end
          end
      end
end

## All of the methods defined inside of the block of helpers
# are accessable to the views and to the controllers of your application.
# - consolidates some common functionality
