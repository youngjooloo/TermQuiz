
$(function(){
   $('.board_list').click(function(e){
      location.href=`boarddetail?${this.id}`;
         });
});

