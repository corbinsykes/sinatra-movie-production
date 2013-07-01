require 'sinatra'
require 'sinatra/reloader' if development
require 'pg'

helpers do
  def run_sql(sql)
    db = PG.connect(:dbname => 'production', :host => 'localhost')
    result = db.exec(sql)
    db.close
    result
  end
end

get '/movies' do
erb :movies
end

get '/people' do
erb :people
end

get '/todos' do
erb :todos
end

get '/movies/:id' do
erb :movie
end

get '/people/:id' do
erb :person
end

get '/todos/:id' do
erb :todo
end