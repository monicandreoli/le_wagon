require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

get "/" do
  @restaurants = Restaurant.all
  erb :index # => render views/index.erb
end

get "/restaurants/:id" do
  id = params[:id] # => ex: 3
  @restaurant = Restaurant.find(id)
  erb :show # => render views/show.erb
end

post "/restaurants" do
  name = params[:name] # => ex: "Noma"
  city = params[:city] # => ex: "Copenhaguen"
  Restaurant.create(name: name, city: city)
  redirect "/" # => redirect to the root path
end
