When I first start the server the first file that is going to get run is config.ru

Which is going to load up the env file

1. first check to see if the models work
2. routes


instance variables and flash - instance variables gets forgotten after a redirect occurs and the controller makes a new insteance

All of the instance variables of the old request are gone

for every request we get a whole new set of instance variables

instance variables can not pass from one request to another



To get around that to allow us to send data or send messages from one
request to another we have something called the flash which uses sessions and cookies just like logging in.

How flash3 work -> it will remember this data ("You must be logged in.") for the subsequent request and no other
```ruby
flash[:notice] = "You must be logged in."
```

-----

helpers
     can be used in a controller or view


* is a wild card so can be anything
