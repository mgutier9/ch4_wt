# This file is app/controllers/movies_controller.rb
class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end
  
def show
  id = params[:id] # retrieve movie ID from URI route
  @movie = Movie.find(id) # look up movie by unique ID
  # will render app/views/movies/show.html.haml by default
end

# in controller action:
def show
  @movie = Movie.where(:id => params[:id]) # what if this movie not in DB?
  # BUG: we should check @movie for validity here!
end

-# ...later, in the Haml view:

%h1= @movie.title
-# will give "undefined method 'title' for nil:NilClass" if @movie is nil

end