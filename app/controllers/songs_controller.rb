class SongsController < ApplicationController

    get '/songs' do
        @songs = Song.all.sort_by{|x|x.name}

        erb :'songs/index'
    end

    get '/songs/new' do
        @genres = Genre.all.sort_by{|x| x.name}
        
        erb :'songs/new'
    end

    post '/songs' do
        song = Song.create(params[:song])
        song.artist = Artist.find_or_create_by(params[:artist])
        song.save

        session[:notice] = "Successfully created song."

        redirect "/songs/#{song.slug}"
    end

    get '/songs/:name' do
        @song = Song.find_by_slug(params[:name])

        erb :'songs/show'
    end

    get '/songs/:name/edit' do
        @song = Song.find_by_slug(params[:name])
        @genres = Genre.all.sort_by {|x|x.name}

        erb :'songs/edit'
    end

    patch '/songs/:name' do
        song = Song.find_by_slug(params[:name])
        song.update(params[:song])

        if song.artist.name != params[:artist][:name]
            song.update(artist: Artist.find_or_create_by(params[:artist]))
        end

        session[:notice] = "Successfully updated song."

        redirect "/songs/#{song.slug}"
    end


end