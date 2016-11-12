function add_to_cart(id) 
{
	var key = "product_"+id;
	
	var x = window.localStorage.getItem(key);
	
	var q = +document.quantity.numb.value;
	
	x = x*1 + q;
	
	window.localStorage.setItem(key,x);
	
}	

function cart_get_orders()
{
	var cart_orders = "";
	for (var i = 0; i < localStorage.length ; i++){
		
		var key = localStorage.key(i);
		var value = localStorage.getItem(key);
	    var str = key + "=" + value ;
	
    	if((i > 0)&&(value.length > 0)) {
			
			str = "," +str ;
	     }	     
        cart_orders += str;		 
	}
    	
	
	if(cart_orders.length > 0){
	  $('#ordersid').val(cart_orders);
	 }
	return cart_orders;
}

function clear_cart(){
	window.localStorage.clear();
}

function get_from_cart(id)
{
	for(var key in localStorage){
		if (key == id){
			var quantity = localStorage.getItem(key);
			return quantity;			
		}
	}
}