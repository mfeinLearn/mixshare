class Playlist < ActiveRecord::Base
    belongs_to :user
    has_many :songs
    # all playlist belong to users through the fouregn key of user id
end
# we have the foreigh key what we are missing is the association
