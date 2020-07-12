class SongsController < ApplicationController

    require 'rack-flash'

    get '/songs' do
        @songs = Song.all
        erb :'songs/index'
    end

    post '/songs' do 
        song = Song.create(params[:song])
        song.artist = Artist.find_or_create_by(params[:artist])
        song.save

        session[:notice] = "Successfully created song."

        redirect "/songs/#{song.slug}"
    end

    get '/songs/new' do
        erb :'songs/new'
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/show'
    end

    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:name])
        @genres = Genre.all.sort_by {|x|x.name}

        erb :'songs/edit'
    end

    patch '/songs/:slug' do
        song = Song.find_by_slug(params[:name])
        song.update(params[:song])

        if song.artist.name != params[:artist][:name]
            song.update(artist: Artist.find_or_create_by(params[:artist]))
        end

        session[:notice] = "Successfully updated song."

        redirect "/songs/#{song.slug}"
    end

end
