class Routine < ActiveRecord::Base
    belongs_to :user #metaprogramming from ActiveRecord::Base
    has_and_belongs_to_many :exercises
    validates_presence_of :title, :method
end