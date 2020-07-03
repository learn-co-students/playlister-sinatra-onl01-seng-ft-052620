class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :song_genre
    has_many :genres, through: :song_genre
end