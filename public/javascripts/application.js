$(document).ready(function(){
	
	$("#work-nav a.work").mouseenter(function () {
		if ($("div#videos").is(":hidden")) {
			$("#work-nav a.work").html("Sean Meehan");
		}
		return false
	});
	
	$("#work-nav a.work.work").mouseleave(function () {
		if ($("div#videos").is(":hidden")) {
			$("#work-nav a.work").html("Work");
		}
		return false
	});
	
	$("#work-nav a.work").click(function () {
		if ($("div#videos").is(":hidden")) {
			if ($("div#contact").is(":visible")) {
				$("div#contact").slideUp();
			}
			$("div#videos").slideDown();
			$("#work-nav a.work").html("Sean Meehan's Work");
			$("#work-nav a.work").addClass("border-bottom");
			
		} else {
			$("div#videos").slideUp();
			$("#work-nav a.work").html("Work");
			$("#work-nav a.work").removeClass("border-bottom");
		}
		return false
	});
	
	$("#contact-nav a").click(function () {
		if ($("div#contact").is(":hidden")) {
			if ($("div#videos").is(":visible")) {
				$("div#videos").slideUp();
				$("#work-nav a.work").html("Work");
				$("#work-nav a.work").removeClass("border-bottom");
			}	
			$("div#contact").slideDown();
		} else {
			$("div#contact").slideUp();
		}
		return false
	});

});

