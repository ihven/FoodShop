#encoding: cp866
require 'rubygems'
require 'sinatra'
require 'sinatra/activerecord'
require 'sqlite3'

set :database,'sqlite3:food.db'

class Food < ActiveRecord::Base
end

class Cart < ActiveRecord::Base
end


get '/' do
	erb '<p align="left" style="color:darkblue; font-weight:700; font-size:150%">Hello! Welcome to foodshop.</p>'		
end

get '/cart' do
    erb:cart
end

get '/shop' do
   @foods = Food.all
   erb:shoping
end

get '/:id' do
  id = params[:id]
  @choice = Food.find(params[:id])
  erb:food
end

get '/cart/order_cart' do
     erb:ordercart
end

post '/cart' do	    
		orders = params[:orders_id]       
	 
	   		arr = orders.split(",")
			hh = from_arr(arr)
			
			find_food =""		    
			total_sum = 0			
			@link = ""
			@str = ""
			@str_total = ""	
			
			hh.each_with_index do |val, id|
				find_food = Food.find(val[0])
				total = val[1] * find_food.price
				total_sum += total;
				@str = @str + "commodity: #{find_food.title} " +"quantity:    #{val[1]}    " + "  total: #{total} UAH" + "<br/>"
			end
             
    	  
			
	    	if(total_sum > 0)
			   @str_total = "The final cost of your purchase: #{total_sum} UAH"
               @link = "<a href = '/cart/order_cart' style='color:red; font-weight:700; font-size:150%'>Next step for write</a>"
	           @val_sum = total_sum		
			end
		    
			@cart = Cart.new(:purchased => @str, :total_price => total_sum, :day_time => DateTime.current)
			@cart.save
			
            erb:cart
 end


    def from_arr arr
	   hh = {}
	   arr.each_with_index do |value, index|
	      i = value[8].to_i
		  hh[i] = value.split("=")[1].to_i 
	   end
	   return hh
    end	
	
post '/cart/order_cart' do
     @carts = Cart.find_by name: nil
	 @carts.name = params[:name]
	 @carts.adress = params[:adress]
	 @carts.phone = params[:phone]
	 @carts.save
     redirect to "/shop"

end	