class UsersController < ApplicationController

    # users can sign up 
    get '/signup' do 
        erb :'users/signup'
    end

    post '/signup' do 
        user = User.new(params)
        if user.save
            session[:user_id] = user.id
            redirect '/routines'
        else
            @error = "Invalid credentials"
            erb :'/users/signup'
        end
    end

    # actions vthat let useres view their routines and exercises

    get '/yourworkouts' do
        @routines = current_user.routines
        erb :'/routines/index'
    end
end
