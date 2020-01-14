class User < ActiveRecord::Base 
    validates :username, :password, presence: true, message: 'Username and password cannot be blank'
    validates_uniqueness_of :username
    has_many :routines
end