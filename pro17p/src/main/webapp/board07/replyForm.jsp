<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

  function backToList(obj){
    obj.action="${contextPath}/board/listArticles.do";
    obj.submit();
  }
 
  function readURL(input) {
      if (input.files && input.files[0]) {
          var reader = new FileReader();
          reader.onload = function (e) {
              $('#preview').attr('src', e.target.result);
          }
          reader.readAsDataURL(input.files[0]);
      }
  }  
</script> 
<style>
  .bg {
    background-color: rgb(243, 243, 243);
    width: 80%;
    margin: 0 auto;
    margin-top: 3rem;
  }
  .form_bg {
    width: 90%;
    margin: 0 auto;
  }
  a {
    text-decoration: none;
    color: inherit;
  }
  textarea { resize: none;}
  h1 {
    text-align: center;
    padding: 3rem 0 0 0;
    color: gray;
  }
  .form_bg .table {
    margin: 0 auto;
    text-align: center;
    background-color: rgb(233, 233, 233);
    line-height: 4;
    font-size: 1.2rem;
    padding: 0 5%;
  }
  input, textarea {
    width: 100%
  }
  .btn,
  .btn_red {
    display: inline-block;
    cursor: pointer;
    border: 1px solid #fff;
    border-radius: 5px;
    padding: 1rem;
    margin: 3% 4% 10% 4%;
    width: 10%;
    text-align: center;
    color: #fff;
    transition: .5s;
    width: 40%;
    overflow: hidden;
  }
  .btn {
    background-color: #337ab7;
  }
  .btn_red {
    background-color: #b73333;
  }

  .btn:hover {
    background-color: #1f6dff;
    border-radius: 20px;
  }
  .btn_red:hover {
    background-color: #ff1f1f;
    border-radius: 20px;
  }
</style>
<title>답글쓰기 페이지</title>
</head>
<body>
  <div class="bg">
    <h1>답글쓰기</h1>
    <form class="form_bg" name="frmReply" method="post"  action="${contextPath}/board/addReply.do"   enctype="multipart/form-data">
      <table class="table">
        <tr>
          <td width="150"> 글쓴이</td>
          <td><input type="text" size="5" value="lee" disabled /> </td>
        </tr>
        <tr>
          <td width="150">글제목</td>
          <td colspan="2"><input type="text" size="67"  maxlength="100" name="title" /></td>
        </tr>
        <tr>
          <td width="150" valign="top"><br>글내용</td>
          <td colspan="2"><textarea name="content" rows="10" cols="65" maxlength="4000"> </textarea> </td>
        </tr>
        <tr>
          <td width="150">이미지파일 첨부</td>
          <td> <input type="file" name="imageFileName"  onchange="readURL(this);" /></td>
          <td><img  id="preview" src="../images/image_icon.jpg"   width=200 height=200/></td>
        </tr>
        <tr>
          <td> </td>
          <td c>
              <input class="btn" type=submit value="답글 등록" />
              <input class="btn_red" type=button value="취소" onClick="backToList(this.form)" />
              
          </td>
        </tr>
      </table>
    </form>
  </div>
</body>
</html>