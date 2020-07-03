require_relative '../../lib/slug'

class Artist < ActiveRecord::Base 
    extend Slug

    has_many :songs
    has_many :genres, through: :songs

    def self.find_by_slug(slug)
        self.all
    end
end