require 'rack-flash'
class SongsController < ApplicationController
    use Rack::Flash

    get '/songs' do 
        @songs = Song.all
        erb :'songs/index'
      end 

    get '/songs/new' do 
        @artists = Artist.all
        @genres = Genre.all
        erb :'songs/new'
    end 

    get '/songs/:slug' do 
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/show'
    end 

    post '/songs' do 
        @artist = Artist.find_or_create_by(name: params[:artist_name])
        @song = Song.create(name: params[:song_name])
        @song.genre_ids = params[:genres]
        @artist.songs << @song
        @song.save
        flash[:message] = "Successfully created song."
        redirect to "/songs/#{@song.slug}"
    end 

    get '/songs/:slug/edit' do 
        @genres = Genre.all
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/edit'
    end 

    patch '/songs/:slug' do 
        if !params.keys.include?("genres")
            params["genres"] = []
        end

        @song = Song.find_by_slug(params[:slug]) 
        @artist = Artist.find_or_create_by(name: params[:artist_name])
        @song.update(artist: @artist)
        @song.genres = []
        @genres = Genre.find_by(name: params[:genres])
        @song.genres << @genres
        @song.save
        
        flash[:message] = "Successfully updated song."
        redirect to "/songs/#{@song.slug}"
    end 

end