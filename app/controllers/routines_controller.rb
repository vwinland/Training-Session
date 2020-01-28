require 'pry'
class RoutinesController < ApplicationController

    before do 
        require_login
    end

    # CREATE 
        # New <= to render the form

        get '/routines/new' do 
            @exercises = Exercise.all
            erb :'/routines/new'
        end

        # Create
        # make a post request to '/routines'

        post '/routines' do
            filtered_params = params
            filtered_params[:routine] = params[:routine].reject{|key, value| key == "image" && value.empty?}
            routine = current_user.routines.build(filtered_params[:routine])
            if exercise = Exercise.find_by(name: filtered_params[:exercise][:name])
                routine.exercises << exercise
            else
                routine.exercises.build(filtered_params[:exercise])
            end
            routine.image = nil if routine.image.empty?
            if routine.save
                redirect '/routines' #take the use to the recipes index page
            else
                @error = "Data invalid. Please try again."
                @exercises = Exercise.all
               erb :'/routines/new' #rerender the form
            end
        end

    #READ 

        # Index 
        
        get '/routines' do 
                @routines = Routine.all.reverse
                erb :'routines/index'
        end

        # Show 
        # make a get request to '/routines/:id' <= dynamic route

        get '/routines/:id' do 
                @routine = Routine.find_by(id: params[:id])
                if @routine
                    erb :'/routines/show'
                else
                    redirect '/routines'
                end
        end

    #UPDATE

        # Edit 
        # make a get request to '/routines/:id/edit'
        
        get '/routines/:id/edit' do 
            @routine = Routine.find(params[:id])
                if current_user == @routine.user
                
                    erb :'/routines/edit'
                else 
                redirect '/routines'
            end
        end

        # Update
        # make a patch request to '/routines/:id'
       
        patch '/routines/:id' do 

            @routine = Routine.find(params[:id])
            if current_user == @routine.user
                if !params[:routine][:title].empty? && !params[:routine][:method].empty?
                @routine.update(params[:routine])
                redirect "/routines/#{params[:id]}"
                else
                    @error = "Data invalid. Please try again."
                    erb :'/routines/edit'
                end
            else
                redirect '/routines'
            end
        end 

    #DESTROY
        
        # make a delete request to '/routines/:id'
        delete '/routines/:id' do
            @routine = Routine.find(params[:id])
            if current_user == @routine.user
                routine.destroy
                redirect '/routines'
            else
                redirect '/routines'
            end
        end
end