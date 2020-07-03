class Genre < ActiveRecord::Base
    extend Slug::ClassMethods
    include Slug::InstanceMethods

    has_many :song_genre
    has_many :songs, through: :song_genre
    has_many :artists, through: :songs
end