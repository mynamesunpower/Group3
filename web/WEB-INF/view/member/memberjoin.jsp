<%--
  Created by IntelliJ IDEA.
  User: park
  Date: 2020-12-21
  Time: 오전 11:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%request.setCharacterEncoding("utf-8"); // post방식 한글깨짐 처리%>
<html>
<head>
    <title>회원가입페이지</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.2/dist/jquery.validate.min.js"></script>
<%--<script src="../../js/memberjoin.js"></script>--%>

<%--sweetalert css 경고창--%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<body>
<form action="userok.ing" name="userinput" id="userinput">
    <div class="row">
        <div class="col s8 offset-s2">
            <div class="col s3">
                <div class="row">
                </div>
                <h5>기본 정보 입력</h5>
            </div>
            <div class="col s9 left-align">
                <div class="row">
                    <div class="input-field col s8">
                        아이디: <input type="text" name="id" id="id"><span class="valiText" id="idCheckResult"></span>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        비밀번호: <input type="password" name="password" id="pass">
                        <span class="valiText" id="valiPass"></span>
                    </div>
                    <div class="input-field col s6">
                        비밀번호 확인: <input type="password" name="pass2" id="pass2">
                        <span class="valiText" id="valiPassEquals"></span>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        전화번호: <input type="text" name="tel" id="tel" placeholder="-는 빼고 입력해주세요">
                        <span class="valiText" id="telCheckResult"></span>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        이름: <input type="text" name="name" id="name">
                        <span class="valiText" id="valiName"></span>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        주민등록번호: <input type="text" name="jumin1" id="jumin1">
                        <span class="valiText" id="valiJumin"></span>
                    </div>
                    <div class="input-field col s6">
                        뒤 번호는 수집하지 않습니다.<input type="text" name="jumin2" id="jumin2" placeholder="">
                    </div>
                </div>
                <div class="row">
                    <div class="col s4">
                        이메일: <input type="text" name="email" id="email" value="">
                        <span class="valiText" id="valiEmail"></span>
                    </div>
                    <div class="col s4">
                        @부터 입력해주세요. <input type="text"  id="domain" name="domain" class="box" value="">
                    </div>
                    <div class="col s4">
                        <label>도메인</label>
                        <select class="browser-default" id="emailSelection" name="emailSelection">
                            <option value="1" selected>직접입력</option>
                            <option value="@gmail.com">@gmail.com</option>
                            <option value="@naver.com">@naver.com</option>
                            <option value="@nate.net">@nate.com</option>
                            <option value="@hanmail.net">@hanmail.net</option>
                            <option value="@daum.net">@daum.net</option>
                        </select>
                        <%--<select id="emailSelection" name="emailSelection">
                            <option value="1" selected="selected">직접입력</option>
                            <option value="@gmail.com">@gmail.com</option>
                            <option value="@naver.com">@naver.com</option>
                            <option value="@nate.net">@nate.com</option>
                            <option value="@hanmail.net">@hanmail.net</option>
                            <option value="@daum.net">@daum.net</option>
                        </select>--%>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <hr>
    <div class="row">
        <div class="col s8 offset-s2">
            <div class="col s3">
                <div class="row">
                </div>
                <h5>부가 정보 입력</h5>
            </div>
            <div class="col s9 left-align">
                <h6>주소</h6>
                <div class="form-group">
                    <input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="addr1" id="addr1" type="text" readonly="readonly" >
                    <button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>
                </div>
                <div class="form-group">
                    <input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="addr2" id="addr2" type="text" readonly="readonly" />
                </div>
                <div class="form-group">
                    <input class="form-control" placeholder="상세주소" name="addr3" id="addr3" type="text"  />
                </div>
            </div>
        </div>
    </div>
    <span class="valiText" id="formCheckResult"></span>
    <br/>
    <input class="btn" type="button" name="submit" id="memberSubmit" value="등 록">
    <input class="btn" type="reset" name="reset" id="reset" value="취 소">


</form>

</body>
</html>