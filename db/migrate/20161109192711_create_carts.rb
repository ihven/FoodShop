class CreateCarts < ActiveRecord::Migration[5.0]
   def change 
           create_table :carts do |t|
            t.string:purchased
			t.decimal:total_price 
			t.text:name
			t.string:adress
			t.string:phone
                       
            t.datetime:day_time			
			t.timestamps
			
		
			
	end        
  end
end
