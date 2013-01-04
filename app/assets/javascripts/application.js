// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery-1.7.2
//= require nested_form
//= require_tree
//= require_self
//= require bootstrap

$(document).ready(function(){
	$("#header_search").bind("keyup", function() {
	    if($("#header_search").val() != ''){
	        $.get("/search", {phrase: $("#header_search").val()}, function(data) {
	        	$("#header_search_results").html('');
	        	if(data.accounts.length > 0)
    			{
    				$("#header_search_results").append('<div class="search-row-title">People</div');
    			}
	        	$(data.accounts).each(function(key, value){
	        		var a = "<a href='/users/" + value["id"] + "'>" + value["first_name"] + " " + value["last_name"] + "</a>";
	        		$("#header_search_results").append(a);
	        		$("#header_search_results").css("visibility", "visible")
	        	});
	        	if(data.activities.length > 0)
    			{
	        		$("#header_search_results").append('<div class="search-row-title">Activities</div');
    			}
	        	$(data.activities).each(function(key, value){
	        		var act = "<a href='/activities/" + value["id"] + "'>" + value["name"] + "</a>";
	        		$("#header_search_results").append(act);
	        		$("#header_search_resu2ts").css("visibility", "visible")
	        	});
	        });
	    }else{
	        $("#header_search_results").html('');
	        $("#header_search_results").css("visibility", "hidden")
	    }
	});

	//$("#header_search").blur(function(){
	//	$("#header_search_results").css("visibility", "hidden")
	//});
	//$("#header_search").focus(function(){
	//	$("#header_search_results").css("visibility", "visible")
	//});
 });








