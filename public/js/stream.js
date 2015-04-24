$(document).ready(function(){
	function streamUpdate(){
			console.log("Time!");
			$.ajax({
				url: "/render_tweets.json/"+gon.this_var,
				dataType: 'json',
				success:function(response){
					console.log(response);
					$tweet = response.text;
					$username = response.user.screen_name;
					// $("table").append("<tr><td>["+$username+"]</td><td>"+$tweet+"</td></tr>");
					var row = "<tr><td>["+$username+"]</td><td>"+$tweet+"</td></tr>"
					$(row).hide().appendTo("table").fadeIn(700);
				}
			});
	}
	var tid = setInterval(streamUpdate,6000);
	$("#btn-stop").click(function(){
		abortStream();
		alert("Stream stopped!");
	});
	function abortStream(){
		clearInterval(tid);
	}
});