<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/admingoods/admin_goods_write.jsp</h1>

    <h1>강의 등록 페이지</h1>
    
    <form action="./InstructorAddAction.in" method="post" 
          enctype="multipart/form-data">
    
      <table border="1">
        <!-- <tr>
          <td>카테고리</td>
          <td>
             <select name="category">
               <option value="outwear" >외투</option>
               <option value="fulldress">정장/신사복</option>
               <option value="Tshirts">티셔츠</option>
               <option value="shirts">와이셔츠</option>
               <option value="pants">바지</option>
               <option value="shoes">신발</option>   
             </select>          
          </td>
        </tr> -->
        <tr>
          <td>강사 이름</td>
          <td>
             <input type="text" name="l_m_name">
          </td>
        </tr>
        <tr>
          <td>강사 아이디</td>
          <td>
            <input type="text" name="l_m_id">
		  </td>
        </tr>
        <tr>
          <td>강의 제목</td>
          <td><input type="text" name="l_title"></td>
        </tr>
        <tr>
          <td>강의 내용</td>
          <td><input type="text" name="l_content"></td>
        </tr>
        <tr>
          <td>강의 분류</td>
          <td><input type="text" name="l_type"></td>
        </tr>
        <tr>
          <td>강의 분류2</td>
          <td><input type="text" name="l_type2"></td>
        </tr>
        <tr>
          <td>강의 분류3</td>
          <td><input type="text" name="l_type3"></td>
        </tr>
        <tr>
          <td>강의 가격</td>
          <td><input type="number" name="l_price"></td>
        </tr>
        <tr>
          <td>할인율</td>
          <td><input type="number" name="l_pct"></td>
        </tr>
        <tr>
          <td>강의 태그</td>
          <td><input type="text" name="l_tag"></td>
        </tr>
        <tr>
          <td>강의 좋아요</td>
          <td><input type="number" name="l_goods"></td>
        </tr>
		<tr>
          <td>결제횟수</td>
          <td><input type="number" name="paynum"></td>
        </tr>

<!-- 이미지 -->    
        <tr>
          <td>메인 강의이미지</td>
          <td><input type="file" name="file1"></td>
        </tr>
        <tr>
          <td>제품이미지1</td>
          <td><input type="file" name="file2"></td>
        </tr>
        <tr>
          <td>제품이미지2</td>
          <td><input type="file" name="file3"></td>
        </tr>
        <tr>
          <td>제품이미지3</td>
          <td><input type="file" name="file4"></td>
        </tr>
        
        <tr>
           <td colspan="2">
             <input type="submit" value="상품등록">
             <input type="reset" value="다시 등록">
           </td>
        </tr>
        
      </table>
    </form>





</body>
</html>