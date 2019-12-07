# Provided, don't edit
require 'directors_database'
require 'pp'
require 'pry'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point

def movies_with_director_key(name, movies_collection)
  new_collection = []
  i = 0
  while i < movies_collection.length do
    movie_info = movies_collection[i]
    new_collection << movie_with_director_name(name, movie_info)
    i += 1 
  end
  return new_collection # {director => [array of movies]}
end


def gross_per_studio(collection)
  gross_hash = {}
  k = 0 
  while k < collection.length do 
    movie = collection[k]
    studio_name = collection[k][:studio]
    studio_gross = collection[k][:worldwide_gross]
    if !gross_hash[movie[:studio]] 
        gross_hash[movie[:studio]] = movie[:worldwide_gross]
    else
      gross_hash[movie[:studio]] += studio_gross
    end
    k += 1 
  end
  return gross_hash #{:studio => worldwide_gross
end

def movies_with_directors_set(source)
 new_array = []
  j = 0 
  while j < source.length do 
  name_key = source[j][:name]
  movies_key = source[j][:movies]
  new_array << movies_with_director_key(name_key, movies_key)
  j += 1
  end
  return new_array #[AoA of movies with a director key]
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
