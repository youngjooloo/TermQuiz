/**
 * 
 */

$(function(){
	$('.removeAdmin').click(function(){
		location.href="removeadmin?nickname="+this.id;	
	});
	
	$('.addAdmin').click(function(){
		location.href="addadmin?nickname="+this.id;	
	});
	
});