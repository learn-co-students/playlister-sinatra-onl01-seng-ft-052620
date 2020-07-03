class Song < ActiveRecord::Base
    extend Slug::ClassMethods
    include Slug::InstanceMethods

    belongs_to :artist
    has_many :song_genre
    has_many :genres, through: :song_genre
end