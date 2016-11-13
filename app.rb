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

before do
   @cart_all = Cart.all
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
      
get '/cart/ordercart' do
  erb:ordercart
end

get '/cart/list' do
    erb:list
end

post '/cart/ordercart' do
            orders = params[:orders_id]       
	 
	   		arr = orders.split(",")
			hh = from_arr(arr)
			
			find_food =""		    
			@total_sum = 0			
			@link = ""
			@str = ""
					
			hh.each_with_index do |val, id|
				find_food = Food.find(val[0])
				total = val[1] * find_food.price
				@total_sum += total;
				@str = @str + "commodity: #{find_food.title} " +"quantity:    #{val[1]}    " + "  total: #{total} UAH" + "\n"
			end
			if(@total_sum > 0)
			   		
			   @link = '<form action = "/cart" method = "POST" role = "form">
				<div class="form-group">
				<label  style="color:darkblue; font-weight:700; font-size:100%">Enter your full name:</lavel><br/>
				<input name = "cart[name]"  placeholder = "Enter your full name" style="border-color:white; width:300px" required><br/> 
				</div><br/> 
				<div class="form-group">
				<label style="color:darkblue; font-weight:700; font-size:100%">Enter your full adress:</lavel><br/>
				<input name = "cart[adress]"  placeholder = "Enter your full adress" style="border-color:white; width:300px" required><br/> 
				</div><br/> 
				<div class="form-group">
				<label  style="color:darkblue; font-weight:700; font-size:100%">Enter your phone:</lavel><br/>
				<input name = "cart[phone]" placeholder = "Enter your phone" style="border-color:white; width:300px" required><br/> 
				</div> 
				<button type ="submit" class = "btn btn-primary" onclick = "clear_cart()">SAVE TO DATABASE</button>
	
				</form>'
	          end
			  
            erb:cart
end	

post '/cart' do
      cart = Cart.new(params[:cart])
	  cart.day_time = DateTime.current
	  
	  
	  if(cart.save)
	    @message = "Dear, #{cart.name}!  Thank you, your order has been placed."
		erb '<p align="left" style="color:maroon; font-weight:700; font-size:125%"><%=@message%></p>'
	  else
	    redirect to '/'
	  end	
	  
end  


    def from_arr arr
	   hh = {}
	   arr.each_with_index do |value, index|
	      i = value[8].to_i
		  hh[i] = value.split("=")[1].to_i 
	   end
	   return hh
    end	
	
