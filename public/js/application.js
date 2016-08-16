$(document).ready(function() {

	// Sticky Header
	$(window).scroll(function() {

	    if ($(window).scrollTop() > 30) {
	        $('.main_h').addClass('sticky');
	    } else {
	        $('.main_h').removeClass('sticky');
	    }
	});

	// Mobile Navigation
	$('.mobile-toggle').click(function() {
	    if ($('.main_h').hasClass('open-nav')) {
	        $('.main_h').removeClass('open-nav');
	    } else {
	        $('.main_h').addClass('open-nav');
	    }
	});

	$('.main_h li a').click(function() {
	    if ($('.main_h').hasClass('open-nav')) {
	        $('.navigation').removeClass('open-nav');
	        $('.main_h').removeClass('open-nav');
	    }
	});

	// navigation scroll
	$('nav a').click(function(event) {
	    var id = $(this).attr("href");
	    var offset = 70;
	    var target = $(id).offset().top - offset;
	    $('html, body').animate({
	        scrollTop: target
	    }, 500);
	    event.preventDefault();
	});

	// Creating new list
	$('.comment_form').hide();

	$('#create_list').on("click", function(event) {
		event.preventDefault();
		$('.comment_form').toggle();
	});

	$('#new_list').on("submit", function(event) {
		event.preventDefault();
		var data = $(this).serialize();
		$.ajax ({
			method: "post",
			url: "/lists",
			data: data
		}).done(function(response) {
			$('.create_list').append(response);
			$("#new_list").find("input[type=text], input[type=hidden]").val("");
			$('.comment_form').hide();
		})
	});

	// Creating a new task for a list
	$('#task_form').hide();

	$('#create_task').on("click", function(event) {
		event.preventDefault();
		$('#task_form').toggle();
	});

	$('#new_task').on("submit", function(event) {
	event.preventDefault();
	var data = $(this).serialize();
	var list_id = $(this).serializeArray()[1].value;
	$.ajax ({
		method: "post",
		url: "/lists/"+list_id+"/tasks",
		// url: $(this).attr('action'),
		data: data
	}).done(function(response) {
		$('.create_tasks').append(response);
		$("#new_task").find("input[type=text], input[type=hidden]").val("");
		$('#task_form').hide();
		});
	});
});

