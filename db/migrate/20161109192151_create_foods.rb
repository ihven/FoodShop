class CreateFoods < ActiveRecord::Migration[5.0]
  def change
     create_table :foods do |food|
	        food.string  :title
			food.text    :description
			food.decimal :price 
			food.text    :country
            food.datetime:arrival
            food.string  :path_to_image			
			
			food.timestamps	        
	 end
  end
end
