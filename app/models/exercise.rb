class Exercise < ActiveRecord::Base 
    has_many :routines, through :routines_exercises
end
