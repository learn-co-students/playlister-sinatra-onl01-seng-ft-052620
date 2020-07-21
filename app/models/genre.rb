require_relative './concerns/slugifiable.rb'
class Genre < ActiveRecord::Base
    extend Slugifiable::ClassMethods 
    include Slugifiable::InstanceMethods
    has_many :songs
    has_many :artists, through: :songs
end 