<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<head>
   <meta charset="UTF-8">
   <title>글보기</title>
   <script  src="http://code.jquery.com/jquery-latest.min.js"></script> 
   <script type="text/javascript" >
     function backToList(obj){
       obj.action="${contextPath}/board/listArticles.do";
       obj.submit();
     }
 
    function fn_enable(obj){
       document.getElementById("i_title").disabled=false;
       document.getElementById("i_content").disabled=false;
       document.getElementById("i_imageFileName").disabled=false;
       document.getElementById("tr_btn_modify").style.display="block";
       document.getElementById("tr_btn").style.display="none";
    }
    
    function fn_modify_article(obj){
       obj.action="${contextPath}/board/modArticle.do";
       obj.submit();
    }
    
    function fn_remove_article(url,articleNO){
       var form = document.createElement("form");
       form.setAttribute("method", "post");
       form.setAttribute("action", url);
        var articleNOInput = document.createElement("input");
        articleNOInput.setAttribute("type","hidden");
        articleNOInput.setAttribute("name","articleNO");
        articleNOInput.setAttribute("value", articleNO);
       
        form.appendChild(articleNOInput);
        document.body.appendChild(form);
        form.submit();
    
    }
    
    function fn_reply_form(url, parentNO){
       var form = document.createElement("form");
       form.setAttribute("method", "post");
       form.setAttribute("action", url);
        var parentNOInput = document.createElement("input");
        parentNOInput.setAttribute("type","hidden");
        parentNOInput.setAttribute("name","parentNO");
        parentNOInput.setAttribute("value", parentNO);
       
        form.appendChild(parentNOInput);
        document.body.appendChild(form);
       form.submit();
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
  #tr_btn_modify {
    display: none;
  }
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
    width: 100%;
  }
  .btn,
  .btn_red {
    display: inline-block;
    cursor: pointer;
    border: 1px solid #fff;
    border-radius: 5px;
    padding: 1rem;
    margin: 5% 4% 5% 4%;
    width: 15%;
    text-align: center;
    color: #fff;
    transition: .5s;
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
</head>
<body class="bg">
  <h1>글보기</h1>
  <form class="form_bg" name="frmArticle" method="post"  action="${contextPath}"  enctype="multipart/form-data">
  <table class="table">
    <tr>
      <td width=150 class="title">
          글번호
      </td>
      <td >
        <input type="text"  value="${article.articleNO }"  disabled />
        <input type="hidden" name="articleNO" value="${article.articleNO}"  />
      </td>
    </tr>
    <tr>
      <td width="150" class="title">
        작성자 아이디
      </td>
      <td >
        <input type=text value="${article.userID }" name="writer"  disabled />
      </td>
    </tr>
    <tr>
      <td width="150" class="title">
        제목 
    </td>
    <td>
      <input type=text value="${article.title }"  name="title"  id="i_title" disabled />
    </td>   
    </tr>
    <tr>
      <td width="150" class="title">
        내용
       </td>
       <td>
        <textarea rows="20" cols="60"  name="content"  id="i_content"  disabled />${article.content }</textarea>
      </td>  
    </tr>
 
<c:if test="${not empty article.imageFileName && article.imageFileName!='null' }">  
<tr>
    <td width="150" class="title"  rowspan="2">
      이미지
   </td>
   <td>
     <input  type= "hidden"   name="originalFileName" value="${article.imageFileName }" />
    <img src="${contextPath}/download.do?articleNO=${article.articleNO}&imageFileName=${article.imageFileName}" id="preview"  /><br>
       
   </td>   
  </tr>  
  <tr>
    <td>
       <input  type="file"  name="imageFileName " id="i_imageFileName"   disabled   onchange="readURL(this);"   />
    </td>
  </tr>
 </c:if>
  <tr>
      <td width="150" class="title">
         등록일자
      </td>
      <td>
       <input text-aling="left" type=text value="<fmt:formatDate value="${article.writeDate}" />" disabled />
      </td>   
  </tr>
  <tr   id="tr_btn_modify"  >
      <td width="100%" colspan="2" >
          <input class="btn" type=button value="수정반영하기"   onClick="fn_modify_article(frmArticle)"  >
          <input class="btn_red" type=button value="취소"  onClick="backToList(frmArticle)">
      </td>   
  </tr>
    
  <tr  id="tr_btn">
   <td colspan="2">
       <input class="btn" type=button value="수정하기" onClick="fn_enable(this.form)">
       <input class="btn" type=button value="답글쓰기"  onClick="fn_reply_form('${contextPath}/board/replyForm.do', ${article.articleNO})">
       <input class="btn_red" type=button value="삭제하기" onClick="fn_remove_article('${contextPath}/board/removeArticle.do', ${article.articleNO})">
       <input class="btn" type=button value="목록으로"  onClick="backToList(this.form)">
   </td>
  </tr>
 </table>
 </form>
</body>
</html>