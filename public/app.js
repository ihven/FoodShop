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