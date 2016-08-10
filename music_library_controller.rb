require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/album') 
require_relative('./models/artist')

# NB the resource - which here is pizza - should always be plural

# INDEX
get '/albums' do
  @albums = Album.all()
  erb ( :'albums/index' )
end

# CREATE 
post '/albums' do 
  @album = Album.new( params )
  @album.save() 
  erb( :'albums/create' )
end

# NEW - SENDS HTML FORM
get '/albums/new' do 
  @artists = Artist.all()
  erb( :'albums/new' )
end
# SHOW - SHOWS A SINGLE ALBUM
get '/albums/:id' do
  @album = Album.find( params[:id] ) 
  erb( :'albums/show' )
end

# EDIT - SENDS HTML FORM
get '/albums/:id/edit' do
  @album = Album.find( params[:id] )
  erb( :'albums/edit' )
end

# UODATE
post '/albums/:id' do
  Album.update(params)
  redirect(to("/albums/#{params[:id]}"))
end

# DESTROY
post '/albums/:id/delete' do
  Album.destroy(params[:id])
  redirect(to('/albums'))
end

# INDEX
get '/artists' do
  @artists = Artist.all()
  erb ( :'artists/index' )
end

# CREATE 
post '/artists' do 
  @artist = Artist.new( params )
  @artist.save() 
  erb( :'artists/create' )
end


# NEW - SENDS HTML FORM
get '/artists/new' do 
  erb( :'artists/new' )
end
# SHOW - SHOWS A SINGLE ALBUM
get '/artists/:id' do
  @artist = Artist.find( params[:id] ) 
  erb( :'artists/show' )
end

# EDIT - SENDS HTML FORM
get '/artists/:id/edit' do
  @artist = Artist.find( params[:id] )
  erb( :'artists/edit' )
end

# UODATE
post '/artists/:id' do
  Artist.update(params)
  # puts params
  redirect(to("/artists/#{params[:id]}"))
end



# DESTROY
post '/artists/:id/delete' do
  Artist.destroy(params[:id])
  redirect(to('/artists'))
end

