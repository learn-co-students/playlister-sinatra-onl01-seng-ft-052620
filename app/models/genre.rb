require_relative './concerns/slugifiable.rb'
require 'pry'
class Genre < ActiveRecord::Base
    extend Slugifiable::ClassMethods 
    include Slugifiable::InstanceMethods
    #has_many :artists, through: :songs
    #has_many :songs
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs

end 