$(document).ready(function(){
	
	function streamUpdate(){
			console.log("Time!");
			$.ajax({
				url: "/render_tweets.json",
				dataType: 'json',
				success:function(response){
					console.log(response);
					$tweet = response.text;
					$username = response.user.screen_name;
					$("table").append("<tr><td>"+$username+"</td><td>"+$tweet+"</td></tr>");
				}
			});
	}
	var tid = setInterval(streamUpdate,9000);

	function abortStream(){
		clearInterval(tid);
	}
});