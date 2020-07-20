$(document).ready(function() {
    
  $('[data-toggle=offcanvas]').click(function() {
    $('.row-offcanvas').toggleClass('active');
  });
  
});


// =====================================
// Get Date
// =====================================
var date = new Date(),
    year = date.getFullYear(),
    month = date.getMonth(),
    day = date.getDate(),
    months = [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"];

document.getElementById('daymonthyear').innerHTML = year + "년 " + months[month] + " " + day + "일 "  ;

// =====================================
// Get Time
// =====================================

function addZero(i) {
// This checks to see if the number is below 10 and then prepends a '0' - clever shit :P
    if (i < 10) {
        i = "0" + i;
    }
    return i;
}

function newTime() {
    var d = new Date();
    var h = addZero(d.getHours());
    var m = addZero(d.getMinutes());
    var s = addZero(d.getSeconds());
    var x = document.getElementById("hourminutesecond");

    x.innerHTML = h + " : " + m + " : " + s;
}

newTime();
setInterval(newTime, 1000);



//----------------------------------------------------------------
$(document).ready(function() {
	const $app = $('.app');
	const $img = $('.app__img');
	let animation = true;
	let curSlide = 1;
	let scrolledUp, nextSlide;
	
	let pagination = function(slide, target) {
		animation = true;
		if (target === undefined) {
			nextSlide = scrolledUp ? slide - 1 : slide + 1;
		} else {
			nextSlide = target;
		}
	}
	
	let navigateDown = function() {
		if (curSlide > 1) return;
		scrolledUp = false;
		pagination(curSlide);
		curSlide++;
	}

	setTimeout(function() {
		$app.addClass('initial');
	}, 1000);

	setTimeout(function() {
		animation = false;
	}, 4500);

});
 






$(".to-signin").on("click", function () {
  $(this)
    .addClass("top-active-button")
    .siblings()
    .removeClass("top-active-button");
  $(".form-signup").slideUp(500);
  $(".form-signin").slideDown(500);
});

$(".to-signup").on("click", function () {
  $(this)
    .addClass("top-active-button")
    .siblings()
    .removeClass("top-active-button");
  $(".form-signin").slideUp(500);
  $(".form-signup").slideDown(500);
});


