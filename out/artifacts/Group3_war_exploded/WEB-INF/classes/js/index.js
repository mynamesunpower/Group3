    $(document).ready(function(){

        $('.sidenav').sidenav();
        $('.collapsible').collapsible();
        $('.tooltipped').tooltip();
        $('select').formSelect();
        $('#dropdownbox').dropdown();
        $('#dropdownbox2').dropdown();


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


        $('#searchAnchor').click(function (event) {
            //$('#searchForm').submit();
            event.preventDefault();
            event.stopPropagation();
            let content = $("#content");
            let queryString = $('#searchForm').serialize();
            //alert(queryString);
            $.ajax({
                url : "./searchBook.ing",
                type : 'get',
                data : queryString,
                success : function (data) {
                    console.log(data);
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
                url: "member/memberjoin.ing",
                success : function (data) {
                    $('#content').children().remove();
                    $('#content').html(data);
                },
                error : function (err) {
                    console.log("memjoin err: " + err);
                }
            });
        })

        /*$(document).on('click', '#memberModify', function (evt) {
           evt.stopPropagation();
           $.ajax({
              method: "post",
              url: "/modifyok.ing",
              data: $('#userinput').serialize(),
              success : function (data) {
                 $('#content').children().remove();
                 $('#content').html(data);
              },
              error : function (err) {
                 console.log("회원정보수정 err: " + err);
              }
           });
        })*/

        $(document).on('click', '#memberDelete', function (evt) {
            evt.stopPropagation();
            $.ajax({
                method: "post",
                url: "member/memberDelete.ing",
                success : function (data) {
                    $('#content').children().remove();
                    $('#content').html(data);
                },
                error : function (err) {
                    console.log("회원정보수정 err: " + err);
                }
            });
        })

        $(document).on('keydown', '#icon_prefix', function (key) {
            if(key.keyCode == 13) {

                let content = $("#content");
                let queryString = $('#searchForm').serialize();
                //alert(queryString);
                $.ajax({
                    url : "./searchBook.ing",
                    type : 'get',
                    data : queryString,
                    success : function (data) {
                        console.log(data);
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
            }
        })

        /*
        *
        *  #memlogin 로그인 버튼 누를 때의 동작
        *  로그인 처리.
        * */
        $(document).on('click', '#memlogin', function (evt) {
            // 기본 이벤트 막기
            evt.preventDefault();
            evt.stopPropagation();

            let id = $('#id').val();
            let pass= $('#pass').val();
            if (id == "" || pass == "") {
                alert("아이디나 비밀번호를 입력하지 않았습니다.");
                return;
            }

            let queryString = $('#memberlogin').serialize();

            $.ajax({
                method: 'post',
                url: "member/memberlogin.ing",
                data: queryString,
                success : function (data) {
                    console.log(data);
                    if (data.includes("성공")) {
                        location.replace('/start.ing');
                    }
                    else {
                        alert("아이디나 비밀번호가 올바르지 않습니다.");
                        $('#id').val("");
                        $('#pass').val("");
                    }
                },
                error : function (err) {
                    console.log("login 시도 에러 : " + err);
                }
            });
        })


        $(document).on('click', '#customerSearch', function (evt) {
            evt.stopPropagation();
            evt.preventDefault();

            let content = $("#content");
            let query = $('#customerSearchForm').serialize();
            alert(query);
            if (!$("label[for='title']").hasClass("active")) {
                alert("검색어를 먼저 입력하세요.");
                return;
            }
            $.ajax({
                type : 'post',
                url : 'customerBoard/customerBoardSearch.ing',
                data : query,
                success : function (data) {
                    content.children().remove();
                    content.html(data);
                },
                error : function (err) {
                    console.log("목록 불러오기 실패"+err);
                }
            })
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
