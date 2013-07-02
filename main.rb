require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'

helpers do
  def run_sql(sql)
    db = PG.connect(:dbname => 'production', :host => 'localhost')
    result = db.exec(sql)
    db.close
    result
  end
end

get '/' do
  erb :index
end

get '/movies/new' do
  erb :new_movie
end

post '/movies/new' do
  id = params[:id]
  name = params[:name]
  rating = params[:rating]
  release_date = params[:release_date]
  sql = "INSERT INTO movies (name, rating, release_date) VALUES ('#{name}', '#{rating}', '#{release_date}')"
  run_sql(sql)

redirect to '/movies'
end

get '/people/new' do
  erb :new_person
end

post '/people/new' do
  id = params[:id]
  name = params[:name]
  age = params[:age]
  title = params[:title]
  sql = "INSERT INTO people (name, age, title) VALUES ('#{name}', #{age}, '#{title}')"
  run_sql(sql)

redirect to '/people'
end

get '/todos/new' do
  erb :new_todo
end

post 'todos/new' do
  id = params[:id]
  task = params[:task]
  location = params[:location]
  description = params[:description]
  sql = "INSERT INTO todo (task, location, description) VALUES ('#{task}', '#{location}', #{description})"
  run_sql(sql)

redirect to '/todos'
end

post '/movies/edit/:id' do
  id = params[:id]
  name = params[:name]
  rating = params[:rating]
  release_date = params[:release_date]
  sql = "UPDATE movies SET (name, rating, release_date) = ('#{name}', '#{rating}', '#{release_date}') WHERE id = #{id}"
  run_sql(sql)

redirect to '/movies'
end


get '/movies' do
  sql = "SELECT * FROM movies"
  @movies = run_sql(sql)
erb :movies
end

get '/people' do
  sql = "SELECT * FROM people"
  @people = run_sql(sql)
erb :people
end

get '/todos' do
  sql = "SELECT * FROM todo"
  @todos = run_sql(sql)
erb :todos
end

get '/movies/:id' do
  id = params[:id]
  sql = "SELECT * FROM movies WHERE id = #{id}"
  @movie = run_sql(sql).first
erb :movie
end

get '/people/:id' do
  id = params[:id]
  sql = "SELECT * FROM people WHERE id = #{id}"
  @person = run_sql(sql).first
erb :person
end

get '/todos/:id' do
  id = params[:id]
  sql = "SELECT * FROM todo WHERE id = #{id}"
  @todo = run_sql(sql).first
erb :todo
end
