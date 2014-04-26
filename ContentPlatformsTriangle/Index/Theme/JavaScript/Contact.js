$(document).ready(function() {
	document.getElementById('ContactFormID').onsubmit = function() {
		
		if($('#name').val() == '') {
			console.log('Name field is missing');
		}
	}
});