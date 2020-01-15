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
            @current_user = User.find_by(username: params[:username])
            if @current_user && @current_user.authenticate(params[:password])
                session[:user_id] = @current_user.id
                redirect '/routines'
            else
                @error = "Username and password do not match"
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