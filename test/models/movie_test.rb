require "test_helper"

describe Movie do

  it "a movie must have a title" do
    start_count = Movie.count

    movie1 = Movie.new
    movie1.save
    movie1.valid?.must_equal false
    movie1.errors.messages.must_include :title

    Movie.count.must_equal start_count
  end

  it "a movie must have a title" do
    start_count = Movie.count

    movie = Movie.new(title: "Sleeping B")
    movie.save
    movie.valid?.must_equal true

    Movie.count.must_equal start_count + 1
  end


end