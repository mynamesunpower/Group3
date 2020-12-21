$(document).ready(function(){

   //$(document).on('click', '#insertPublisher', asyncMovePage("publisher/insertPublisher.ing"));
   $(document).on("click", '.loadAjax', function(event) {
      event.preventDefault();
      let url = $(this).attr("href");
      let content = $("#content");

      $.ajax({
         url : url,
         type : 'get',
         success : function (data) {
            console.log(data);
            content.children().remove();
            content.html(data);
         },
         error : function (err) {
            console.log(err);
         }
      });
   });

   $('#searchAnchor').click(function () {
      $('#searchForm').submit();
   });
   
   $('#search').click(function (evt) {
      evt.stopPropagation();
      $('#searchBox').show();
      $('#searchBox').animate({
         top: '-10vh'
      });
   });

   $('#searchBox_close').on('click', function (evt) {
      evt.stopPropagation();
      $('#searchBox').hide();
   });

   $('.sidenav').sidenav();
   $('.collapsible').collapsible();
   $('.dropdown-trigger').dropdown();
   $('.tooltipped').tooltip();
   $('select').formSelect();

});

/*
function asyncMovePage(url) {
   $.ajax({
      url: url,
      async: false,
      type: "POST",
      dataType: "html",
      cache: false,
      success: function (data) {
         console.log(data);
         $('#content').children().remove();
         $('#content').html(data);
      },
      error: function (error) {
         console.log(error);
      }
   });
}*/
