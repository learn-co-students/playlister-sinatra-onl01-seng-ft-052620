Artist.create(name: "Taylor Swift")
Artist.create(name: "Kanye West")
Artist.create(name: "Rich Brian")

Genre.create(name: "Hip-hop")
Genre.create(name: "Pop")
Genre.create(name: "Indie")

Song.create(name: "22",artist_id:1,genre_ids:[2])
Song.create(name: "Our Song",artist_id:1,genre_ids:[2])
Song.create(name: "POWER",artist_id:2,genre_ids:[1,2])
Song.create(name: "Heartless",artist_id:2,genre_ids:[1,2])
Song.create(name: "100 Degrees",artist_id:3,genre_ids:[1,3])
Song.create(name: "Sailor",artist_id:3,genre_ids:[1,3])