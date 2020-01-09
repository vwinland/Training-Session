class RoutinesController < ApplicationController
    # CREATE 

        # New <= to render the form
        # make a get request to '/routines/new'

        # Create
        # make a post request to '/routines'


    #READ 

        # Index 
        #make a get request to '/routines' <=static route
        
        get '/routines' do 

            @routines = Routine.all
            erb :'routines/index'
        end

        # Show 
        # make a get request to '/routines/:id' <= dynamic route

        get '/routines/:id' do 
            
            @routine = Routine.find
            erb :'routines/show'
        end

    #UPDATE

        # Edit 
        # make a get request to '/routines/:id/edit'
        # Update
        # make a patch request to '/routines/:id'

    #DESTROY
        
        # make a delete request to '/routines/:id'

end