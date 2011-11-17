$(document).ready(function() {

    $('input').change(function() {
		$(this).parents('form').submit()
	})

})