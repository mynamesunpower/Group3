$(document).ready(function(){

   $('.sidenav').sidenav();
   $('.collapsible').collapsible();
   //$('.dropdown-trigger').dropdown();
   //$('#dropdown1').dropdown();
   $('.tooltipped').tooltip();
   $('select').formSelect();
   $('#dropdownbox').dropdown();
   $('#dropdownbox2').dropdown();

   //$('.carousel').carousel();

   //$(document).on('click', '#insertPublisher', asyncMovePage("publisher/insertPublisher.ing"));
   $(document).on("click", '.loadAjax', function(event) {
      event.preventDefault();
      let url = $(this).attr("href");
      let content = $("#content");

      $.ajax({
         url : url,
         type : 'get',
         success : function (data) {
            content.children().remove();
            content.html(data);
         },
         error : function (err) {
            console.log(err);
         }
      });
   });

   $('#searchAnchor').click(function () {
      //$('#searchForm').submit();
      let content = $("#content");
      let queryString = $('#searchForm').serialize();
      alert(queryString);
      $.ajax({
         url : "./searchBook.ing",
         type : 'get',
         data : queryString,
         success : function (data) {
            content.children().remove();
            content.html(data);
            $('#header').show();
            $('#searchBox').hide();
         },
         error : function (err, evt) {
            console.log(err);
            $('#searchBox').hide();
         }
      });
   });

   let searchBox = $('#searchBox');
   $('#search').click(function (evt) {
      evt.stopPropagation();
      $('#header').hide();
      searchBox.show();
      searchBox.animate({
         top: '0vh'
      }, 100, 'linear');
   });

   $('#searchBox_close').on('click', function (evt) {
      evt.stopPropagation();
      $('#header').show();
      searchBox.hide();
      searchBox.css('top', '-10vh');
   });

   $(document).on('click', '#memjoin', function (evt) {
      evt.stopPropagation();
      $.ajax({
         method: "post",
         url: "/memberjoin.ing",
         success : function (data) {
            $('#content').children().remove();
            $('#content').html(data);
         },
         error : function (err) {
            console.log("memjoin err: " + err);
         }
      });
   })

   $(document).on('click', '#memlogin', function (evt) {
      evt.stopPropagation();
      evt.preventDefault();
      alert("login");
      let queryString = $('#memberlogin').serialize();

      $.ajax({
         method: 'post',
         url: "/memberlogin.ing",
         data: queryString,
         success : function (data) {
            location.replace('/hello.ing');
         },
         error : function (err) {
            console.log(err);
         }
      });
   })

   /*$(document).on('click', '#memberSubmit', function (evt) {
      evt.stopPropagation();

      let queryString = $('#userinput').serialize();

      $.ajax({
         method: 'post',
         url: "/userok.ing",
         data: queryString,
         success : function (data) {
            $('#content').children().remove();
            $('#content').html(data);
         },
         error : function (err) {
            console.log(err);
         }
      });
   })*/

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
