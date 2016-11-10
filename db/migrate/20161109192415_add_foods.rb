class AddFoods < ActiveRecord::Migration[5.0]
 def change
      Food.create(title:"pickled cucumbers", description:"pickled cucumbers in a jar", price:40.5, country:"Ukraine", arrival:DateTime.current, path_to_image:"/images/cucumbers.jpg")
      Food.create(title:"sausage", description:"smoked", price:145.9, country:"Ukraine", arrival:DateTime.current, path_to_image:"/images/sausage.jpg")
      Food.create(title:"sausage moskovska", description:"smoked", price:130.9, country:"Ukraine", arrival:DateTime.current, path_to_image:"/images/kovbasy-moskovska-syrokop_b.jpg")  
	  Food.create(title:"vodka champion", description:"vodka champion lvivska", price:150.0, country:"Ukraine", arrival:DateTime.current, path_to_image:"/images/h_champion.jpg") 
      Food.create(title:"vodka slava", description:"vodka slava premium", price:165.0, country:"Ukraine", arrival:DateTime.current, path_to_image:"/images/h_slava_premium.jpg")
      Food.create(title:"mushrooms", description:"mushrooms pickled in a jar", price:55.5, country:"Ukraine", arrival:DateTime.current, path_to_image:"/images/mushrooms.jpg") 	  
  end
 
end
