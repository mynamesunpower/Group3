<%--
  Created by IntelliJ IDEA.
  User: park
  Date: 2020-12-22
  Time: 오후 3:02
  To change this template use File | Settings | File Templates.

 input태그 'readonly' 는 form 전송이 가능하지만,
'disabled' 는 form 전송시 값이 전달되지 않는다.

--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원정보수정</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="../../js/memberupdate.js"></script>
<body>

<form action="updateok.ing" name="userinput" id="userinput">
      <div class="row">
          <div class="col s8 offset-s2">
              <div class="col s3">
                  <div class="row">
                  </div>
                  <h5>회원 정보 수정</h5>
              </div>
              <div class="col s9 left-align">
                  <div class="row">
                      <div class="input-field col s8">
                          아이디: <input disabled type="text" value="${sessionScope.memberId}" readonly>
                          <input type="hidden" name="id" id="id" value="${sessionScope.memberId}"/>
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
                          전화번호: <input type="text" name="tel" id="tel" placeholder="-는 빼고 입력해주세요" value="${sessionScope.memberTel}">
                          <span class="valiText" id="telCheckResult"></span>
                      </div>
                  </div>
                  <div class="row">
                      <div class="input-field col s6">
                          이름: <input disabled type="text" value="${sessionScope.memberName}" readonly>
                          <input type="hidden" name="name" id="name" value="${sessionScope.memberName}"/>
                      </div>
                  </div>
                  <div class="row">
                      <div class="input-field col s6">
                          등급: <input disabled type="text" name="grade" id="grade" value="${sessionScope.memberGrade}" readonly><br/><br/>
                          포인트: <input disabled type="text" name="point" id="point" value="${sessionScope.memberPoint}" readonly><br/><br/>
                      </div>
                  </div>
                  <div class="row">
                      <div class="col s4">
                          이메일: <input type="text" name="email" id="email" value="${sessionScope.memberEmail}">
                          <span class="valiText" id="valiEmail"></span>
                      </div>
                      <div class="col s4">
                          @부터 입력해주세요. <input type="text"  id="domain" name="domain" class="box" value="${sessionScope.memberDomain}">
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
                  <h5>주소 수정</h5>
              </div>
              <div class="col s9 left-align">
                  <h6>주소</h6>
                  <div class="form-group">
                      <input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="addr1" id="addr1" type="text" readonly="readonly" value="${sessionScope.memberAddr1}" >
                      <button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>
                  </div>
                  <div class="form-group">
                      <input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="addr2" id="addr2" type="text" readonly="readonly" value="${sessionScope.memberAddr2}" />
                  </div>
                  <div class="form-group">
                      <input class="form-control" placeholder="상세주소" name="addr3" id="addr3" type="text" value="${sessionScope.memberAddr3}"/>
                  </div>
              </div>
          </div>
      </div>
  <span class="valiText" id="formCheckResult"></span>
  <br/>
  <input class="btn" type="button" name="memberModify" id="memberModify" value="수정">

<form action="/memberDelete.ing" name="userDelete" id="userDelete"/>
   <input type="hidden" name="password" value="${sessionScope.memberPassword}"/>
   <input class="btn" type="button" id="memberDelete" name="memberDelete" value="회원탈퇴">
</form>
</body>
</html>
