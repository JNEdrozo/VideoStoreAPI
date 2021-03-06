class MoviesController < ApplicationController
  def index
    movies = Movie.all

    render(
      json: movies, each_serializer: AllMovieSerializer, status: :ok
    )
  end

  def show
    movie = Movie.find_by(id: params[:id])

    if movie
      render(
        json: movie, each_serializer: MovieSerializer, status: :ok
      )
    else
      render(
        json: { ok: false },
        status: :not_found
      )
    end
  end

  def create
    movie = Movie.create(movie_params)

    if movie.valid?
      render(
        json: movie, each_serializer: MovieSerializer, status: :ok
      )
    else
      render(
        json: { errors: movie.errors.messages },
        status: :bad_request
      )
    end

  end

  private
    def movie_params
      params.permit(:title, :release_date, :overview, :inventory, :available_inventory)
    end
end
