class SongsController < ApplicationController
    
    get '/songs' do 
        @songs = Song.all
        erb :'songs/index'
    end

    get '/songs/new' do
        @genres = Genre.all
        erb :'songs/new'
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        @success_message = session[:success_message]
        session[:success_message] = nil
        erb :'songs/show'
    end

    post '/songs' do 
        @song = Song.create(name: params[:name])
        @song.artist = Artist.find_or_create_by(name: params[:artist])
        params[:genres].each do |genre|
            @song.genres << Genre.find_by_name(genre)
        end
        @song.save
        session[:success_message] = "Successfully created song."
        redirect "/songs/#{@song.slug}"
    end

    get '/songs/:slug/edit' do 
        @song = Song.find_by_slug(params[:slug])
        @genres = Genre.all
        erb :'songs/edit'
    end

    patch '/songs/:slug' do 
        @song = Song.find_by_slug(params[:slug])
        @song.artist = Artist.find_or_create_by(name: params[:artist])
        @song.genres.clear
        params[:genres].each do |genre|
            @song.genres << Genre.find_by_name(genre)
        end
        @song.save
        session[:success_message] = "Successfully updated song."
        redirect "/songs/#{@song.slug}"
    end
end