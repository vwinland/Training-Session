class SessionsController < ApplicationController

    #user can log in 
    get '/login' do 
        erb :'users/login'
    end

    post '/login' do         
        if params[:username].empty? || params[:password].empty?
            @error = "Username or password can't be blank"
            erb :'users/login'
        else
            if user = User.find_by(username: params[:username]) && user.authenticate(params[:password])
                session[:user_id] = user.id
                redirect '/routines'
            else
                @error = "Account not found"
                erb :'/users/login'
            end
        end
    end

    #user can log out 
    get '/logout' do 
        session.clear
        redirect '/'
    end

end