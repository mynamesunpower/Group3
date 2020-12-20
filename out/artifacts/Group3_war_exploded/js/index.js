$(document).ready(function(){
   $('.sidenav').sidenav();
   $('.collapsible').collapsible();

   $('a').click(function () {
      console.log($(this).attr('href'));
      $.ajax({
         type : 'GET',
         url : $(this).attr('href'),
         dataType : 'text',
         success : function (data) {
            $('#content').text(data);
         },
         error : function (err) {
            console.log(err);
         }
      });
      /*if($(this).attr('href').trim() !== "") {

      }*/
   });

});