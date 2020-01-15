class Routine < ActiveRecord::Base
    belongs_to :user #metaprogramming from ActiveRecord::Base
    has_many :exercises, through :routines_exercises
    validates_presence_of :title, :method
end