function something() 
{
	var a = window.localStorage.getItem('abc');
	a = a*1 + 1;
	window.localStorage.setItem('abc', a);
	
	alert(a);
	
}