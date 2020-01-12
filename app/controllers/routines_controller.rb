class RoutinesController < ApplicationController
    # CREATE 

        # New <= to render the form
        # make a get request to '/routines/new'

        get '/routines/new' do 
            erb :'/routines/new'
        end


        # Create
        # make a post request to '/routines'

        post '/routines' do 
            routine = Routine.new(params)
            if !routine.title.empty? && !routine.method.empty? 
                routine.save
                redirect '/routines' #take the use to the recipes index page
            else
                @error = "Data invalid. Please try again."
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
            
            @routine = Routine.find(params["id"])
            erb :'routines/show'
        end

    #UPDATE

        # Edit 
        # make a get request to '/routines/:id/edit'
        get '/routines/:id/edit' do 
            @routine = Routine.find(params[:id])
            erb :'/routines/edit'
        end

        # Update
        # make a patch request to '/routines/:id'
        patch '/routines/:id' do 
            @routine = Routine.find(params[:id])
            if !params[:routine][:title].empty? && !params[:routine][:method].empty?
                @routine.update(params[:routine])
                redirect "/routines/#{params[:id]}"
            else
                @error = "Data invalid. Please try again."
                erb :'/routines/edit'
            end
        end 

    #DESTROY
        
        # make a delete request to '/routines/:id'
        delete '/routines/:id' do
            routine = Routine.find(params[:id])
            routine.destroy
            redirect '/routines'
        end
end