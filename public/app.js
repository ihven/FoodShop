function add_to_cart(id) 
{
	var key = "product_"+id;
	
	var x = window.localStorage.getItem(key);
	
	var q = +document.quantity.numb.value;
	
	x = x*1 + q;
	
	window.localStorage.setItem(key,x);
	
	for (var key in localStorage){
     console.log(key);
	 console.log(localStorage.getItem(key));
    }
	
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
	$('#ordersid').val(cart_orders);
	$('#sendid').val('ENTER THIS->');
	return cart_orders;
}

function clear_cart () {
	window.localStorage.clear();
	cart_get_orders();
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