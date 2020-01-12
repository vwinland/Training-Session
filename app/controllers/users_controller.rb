class UsersController < ApplicationController

    # users can sign up 
    get '/signup' do 
        erb :'users/signup.erb'
    end
    # users can sign up 

end
