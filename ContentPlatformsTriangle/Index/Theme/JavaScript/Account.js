var A = '';

$(document).ready(function() {

	$( "#BirthDateField" ).datepicker({
		changeMonth: true,
		changeYear: true,
		minDate: new Date(1900, 1 - 1, 1),
		maxDate: 0,
		yearRange: "-100:+0",
		dateFormat: "d M yy"
	});
	
	$('#avatarInput').on('change', function() 
	{
		if(isAvatarValid()) {
			A = $("#AvatarImage").attr("src");

			$("#avatarUploadForm").ajaxForm({target: '#AvatarImage', beforeSubmit:function(){
				$("#AvatarImage").attr("src","http://web.concernedjoe.com/Theme/Images/Account/AvatarLoading.gif");
			}, 
			success:function(){}, 
			error:function(){
				$("#AvatarImage").attr("src", A);
			} }).submit();
		} else {

			$( ".ErrorText" ).slideUp( 100, function() {
					
				$('#ErrorTextList').html('');

				$('#ErrorTextList').append('<li>Invalid Avatar</li>');

				$('.ErrorText').slideDown(100);
			});

			$("html, body").animate({ scrollTop: 0 }, 200);
		}

	});

	$('#UploadAvatarButton').click(function(){
		$('#avatarInput').click();
	});

	$('#changeemail').click(function(){
		document.getElementById('MyTest').innerHTML = '<input type="text" id="EmailField" name="EmailField" value="' + document.getElementById('MyTest').attributes.item(1).nodeValue + '" />';
		var div = document.getElementById('changeemail');
		div.parentNode.removeChild(div);
	});
	
	$('#changepassword').click(function(){
		document.getElementById('PassFields').innerHTML = '<br><input type="password" id="OldPasswordField" name="OldPasswordField" placeholder="Old Password" /><br/><br/><input type="password" id="NewPasswordField" name="NewPasswordField" placeholder="New Password" /><br>	<input type="password" id="ConfirmPasswordField" name="ConfirmPasswordField" placeholder="Confirm Password" />';
		var div = document.getElementById('changepassword');
		div.parentNode.removeChild(div);
	});

	document.getElementById('AccountForm').onsubmit = function() {

		var errors = Array();

		if($('#NewPasswordField').val() != '' && $('#OldPasswordField').val() == '') {
			errors.push('Old password field is missing');
		}

		if($('#EmailField').val() != '') {
			if(!isValidEmailAddress($('#EmailField').val()) && document.getElementById('EmailField')) { errors.push('E-mail format is invalid'); }
		}

		if(errors.length <= 0) {
			document.getElementById('AccountForm').submit();
		} else {

			$( ".ErrorText" ).slideUp( 100, function() {
					
				$('#ErrorTextList').html('');

				errors.forEach(function(entry) {
					$('#ErrorTextList').append('<li>' + entry + '</li>');
				});

				$('.ErrorText').slideDown(100);
			});

			$("html, body").animate({ scrollTop: 0 }, 200);
		}

		return false;
		
	}

});

function isValidEmailAddress(emailAddress) {
	var pattern = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
	return pattern.test(emailAddress);
};

function isAvatarValid() {

	var input, file;

	// (Can't use `typeof FileReader === "function"` because apparently
	// it comes back as "object" on some browsers. So just see if it's there
	// at all.)
	if (!window.FileReader) {
		return true;
	}

	input = document.getElementById('avatarInput');
	if (!input) {
		return true;
	}
	else if (!input.files) {
		return true;
	}
	else if (!input.files[0]) {
		return true;
	}
	else {

		file = input.files[0];

		if(file.size <= 204800 && file.type.match(/image.*/)) {
			return true;
		}

		return false;
	}

	return true;
}