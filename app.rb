#encoding: cp866
require 'rubygems'
require 'sinatra'
require 'sinatra/activerecord'
require 'sqlite3'

set :database,'sqlite3:food.db'

class Food < ActiveRecord::Base
end

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/something' do
  erb:something
end

get '/shop' do
   @foods = Food.all
   erb:shoping
end

get '/:id' do
  id = params[:id]
  
  erb:food
end