$(document).ready(function() {

	$('.write textarea').keyup(function(){
	  var content = $(this).val();
	  $('.write .count span').html(content.length);
	  if (content.length > 1000){
		alert("최대 1000자까지 입력 가능합니다.");
	    $(this).val(content.substring(0, 1000));
	    $('.write .count span').html(1000);
	  }
	});

	var sendUserNo = getParameterByName("send_user_no") + " 님"
	$(".nickname").text(sendUserNo)

});

function getParameterByName(name) {
  name = name.replace(/[\[\]]/g, "\\$&")
  var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)")
  var results = regex.exec(window.location.href)
  if (!results) return null
  if (!results[2]) return ''
  return decodeURIComponent(results[2].replace(/\+/g, " "))
}