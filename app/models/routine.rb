class Routine < ActiveRecord::Base
    belongs_to :user #metaprogramming from ActiveRecord::Base
    validates_presence_of :title, :method
end