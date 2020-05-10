<%@page import="com.lecture.db.LectureDTO"%>
<%@page import="com.basket.db.BasketDTO"%>
<%@page import="com.member.db.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>



</head>
<link rel="stylesheet" href="../css/viewmodal.css">
<style>

body {margin: 0; width: 100%;}
.image {width: 130px; height: auto;}
h3 {border-bottom:2px solid pink; padding-bottom: 10px; width: 650px;
    margin-bottom: 10px;
}

#alll{
margin: 5% auto 30% auto; 
width: 1000px; height: auto;}

.boxx{float:left; 
border-bottom:1px solid pink; 
width: 650px; height: auto;  
padding: 10px 10px 20px 0;

}

.boxx2{display: inline-block;
width:320px; height:auto; 
margin-left: 30px;

}

a {text-decoration: none;}

.amount {text-align: center; width: 100px; float: left; 
 padding-top: 10px; }
 
 .menu {margin-left: 10px; padding-top: 5px;}
 
.column {float: left;  }
.content {width:400px; padding: 5px 20px 5px 30px; 
word-wrap: break-word;}

.boxh3 {float: left; padding-left: 10px;}

/* 주문금액합계 */

.boxh32{width:100%; padding-left: 10px;}
.si_columns {
  float: left;
  width: 100%;

}

.price {
  list-style-type: none;
  border-bottom: 1px solid #eee;
  margin: 0;
  padding: 0;
  -webkit-transition: 0.3s;
  transition: 0.3s;
  width: 100%;
}

/* .price:hover {
  box-shadow: 0 8px 12px 0 rgba(0,0,0,0.2)
}
 */
.price .header {
  color: black;
  font-size: 18px;
}

.price>li {
  padding: 15px 15px 0 15px;
  text-align: center;
}

.price .grey {
  background-color: #eee;
  font-size: 20px;
}

@media only screen and (max-width: 600px) {
  .si_columns {
    width: 100%;
    
  }
}
.si_btn {
  background-color: #F25E5E;
  border: none;
  color: white;
  width: 100%;
  text-align: center;
  text-decoration: none;
  font-size: 15px;
  border-bottom: 1px solid #eee;
  padding: 10px;
  text-align: center;
  cursor: pointer;
  opacity: 1;
  transition: 0.3s;
  
  }

.si_btn:hover {opacity: 0.6} 

/* 위시리스트 */
 .d_btn {
  background-color: #F28379;
  border: none;
  color: #262523;
  padding: 5px 10px;
  text-align: center;
  font-size: 12px;
  margin: 4px 2px;
  opacity: 0.6;
  transition: 0.3s;
  display: inline-block;
  text-decoration: none;
  cursor: pointer;}
  
.d_btn:hover {opacity: 1}
 .d_btn:HOVER>.fa-heart {color: red !important;} 
		



/* 툴팁 */
.tooltip {
  position: relative;
  display: inline-block;
}

.tooltip .tooltiptext {
  visibility: hidden;
  width: 80px;
  background-color: #F25E5E;
  color: white;
  border-radius: 6px;
  padding: 5px 0;
  position: absolute;
  z-index: 1;
  top: -5px;
  left: 110%;
  font-size: 10px;
}

.tooltip .tooltiptext::after {
  content: "";
  position: absolute;
  top: 48%;
  right: 100%;
  margin-top: -5px;
  border-width: 5px;
  border-style: solid;
  border-color: transparent #F25E5E transparent transparent;
}
.tooltip:hover .tooltiptext {
  visibility: visible;
}


/* The Modal (background) */
.modal,.modal2 {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* The Modal (background) */

.modal,.modal2 {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content,.modal-content2 {
  background-color: #fefefe;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 25%;
}

/* The Close Button */
.close,.close2 {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus,
.close2:hover,
.close2:focus  {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}
.myCheckli {font-size: 10px;}

/* Set a style for all buttons */
.Vbtn {
  border: none;
  background-color: inherit;
  padding:0;
  font-size: 8px;
  cursor: pointer;
  display: inline-block;
}

.Vbtn:hover {color: red;}


.default {color: black;}



/* Add padding and center-align text to the container */
.Vcontainer {
  padding: 16px;
  
}

/* The Modal (background) */
.Vmodal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: #474e5d;
  padding-top: 50px;
}

/* Modal Content/Box */
.Vmodal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 50%; /* Could be more or less, depending on screen size */
  text-align: left;
  
}

/* Style the horizontal ruler */
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}
 
/* The Modal Close Button (x) */
.Vclose {
  position: absolute;
  right: 35px;
  top: 15px;
  font-size: 40px;
  font-weight: bold;
  color: #f1f1f1;
}

.Vclose:hover,
.Vclose:focus {
  color: #f44336;
  cursor: pointer;
}

/* Clear floats */
.Vclearfix::after {
  content: "";
  clear: both;
  display: table;
}

/* Change styles for cancel button and delete button on extra small screens */
@media screen and (max-width: 300px) {
  .cancelbtn, .deletebtn {
     width: 100%;
  }
}

/* input 스타일 */
input[type=text] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  box-sizing: border-box;
  border: none;
  border-bottom: 2px solid pink;
}
</style>
<body>
 <jsp:include page="/include/header.jsp"/>
 <!-- 
    request 영역에 저장된 객체 저장
    request.setAttribute("basketList", basketList);
	request.setAttribute("goodsList", goodsList);
  -->
  <%
     List basketList = (List)request.getAttribute("basketList");
     List lectureList = (List)request.getAttribute("lectureList");
     MemberDTO MemberDTO =(MemberDTO) request.getAttribute("memberDTO");
  
  %>
   
  <section id="alll" >			<!-- 위시 수정 -->
   <h3 class="boxh3"> 바구니 > <a href="goods_order/goods_wishlis.jsp" style="font-size: 16px;">위시리스트</a></h3>
  <%
  int total=0;
  for(int i=0;i<basketList.size();i++){
	  BasketDTO bdto = (BasketDTO)basketList.get(i);
	  LectureDTO ldto = (LectureDTO)lectureList.get(i);
	  %>
		<div class="boxx" >
			<div class="clearfix">
  			<div class="column menu">
		      <img class="image" src="./upload/<%=ldto.getL_img().split(",")[0]%>">
		         <!--  width="249" height="162" -->
		         </div>
		 <div class="column content"> 
		  <a href="#" ><%=ldto.getL_title() %></a>
		  <p style="font-size: 12px;"> <%=ldto.getL_content()%></p> <!-- basketDAO 추가 설정 -->
		  </div>
		  </div>
		  
		  <div class="amount">
		   <span style="text-align: center;"><%=ldto.getL_price() %> 원</span>		   <%-- <button class="d_btn" type="button" onclick="location.href ='./BasketDelete.ba?b_num=<%=bdto.getB_num()%>'">장바구니 삭제</button> --%>
		   <div class="tooltip">
		   <a href ="./BasketDelete.ba?b_num=<%=bdto.getB_num()%>">
		   <i class="fa fa-close"></i>    <span class="tooltiptext">장바구니 삭제</span> </a><br>
		   </div>
		    <button class="d_btn d_btn2" type="button" onclick="location.href ='./BasketDelete.ba?b_num=<%=bdto.getB_num()%>'">위시리스트 <i class='fas fa-heart'style='color:black;'></i></button>
		  </div>
		  
	</div>
		
		  
	
		<%--   
		    
		           <a href="./BasketDelete.ba?b_num=<%=bdto.getB_num()%>">취소</a>
		    </td>
		  </tr> --%>
	
	  <%
	  //쿠폰값 수정
	  total += bdto.getB_l_price() * ldto.getL_price();
  }  
  %>

 
 <div class="boxx2">
 <h3 class="boxh32">주문 내역</h3>
	<div class="si_columns">
  <ul class="price">
    <li style="border-bottom:1px solid pink; padding-bottom: 15px;" > 쿠폰: 
    	<select id="cars" >
		  <option value="cho" selected>쿠폰을 선택해 주세요.</option>
		  <option value="volvo">Volvo</option>
		  <option value="saab">Saab</option>
		  <option value="vw">VW</option>
		  <option value="audi" >Audi</option>
		  </select>
    </li>	

    <li>합계&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=total %> 원</li>
    <li class="myCheckli"><input type="checkbox" id="myCheck" onclick="myFunction()" checked> (필수) 구매조건 및 개인정보취급방침 동의 
    <button class="Vbtn"onclick="document.getElementById('id01').style.display='block'">[보기]</button>
    <div id="id01" class="Vmodal">
  <span onclick="document.getElementById('id01').style.display='none'" class="Vclose" title="VClose Modal">×</span>
  <form class="Vmodal-content" action="/action_page.php">
    					<div class="Vcontainer">
																							      <h1>구매조건 및 개인정보취급방침</h1>
																							      <hr>
																							      <p>
																							     <h2> 제 3장. 유료 서비스</h2>
																								<h6><b>제 19조. 유료서비스의 제공</b></h6>
																							
																							<ol style="list-style-type: decimal;">
																							<li style="list-style-type: decimal;">
																							“회원”은 “회사”가 제공하는 절차에 의하여 유료서비스 이용계약(이하 “청약”을 신청합니다. “회사”는 원칙적으로 “회원”의 청약 신청을 승낙합니다. 다만, 다음 각 호에 해당하는 경우에는 승낙하지 않거나 승낙을 유보할 수 있습니다.</li></ol>
																								<ol style="list-style-type: decimal;"><dd><li style="list-style-type: decimal;">실명이 아니거나 타인의 명의를 이용한 경우</li>
																									<li style="list-style-type: decimal;">허위의 정보를 기재하거나, "회사”가 제시하는 내용을 기재하지 않은 경우</li>
																									<li style="list-style-type: decimal;">미성년자가 청소년보호법 등 관련법에 의해서 이용이 금지되는 유료 서비스를 이용하고자 하는 경우</li>
																									<li style="list-style-type: decimal;">"서비스"의 위상이나 명예에 부정적인 영향을 줄 수 있는 경우</li>
																									<li style="list-style-type: decimal;">“유료서비스"에서 제공하는 서비스의 공급량의 제한의 이유로 "서비스"를 제공할 수 없는 경우</li>
																									<li style="list-style-type: decimal;">이 약관에 위배되는 내용을 “회사”에 요구한 이력이 있는 “회원”일 경우</li></dd>
																							</ol>
																							
																							<ol start="2" style="list-style-type: decimal;">
																							<li style="list-style-type: decimal;">“유료서비스” 는 별도의 표기가 없는 한 ‘동영상 열람권' 으로 정의합니다. 질문한 내용에 대한 “유료서비스"에 포함되지 않습니다.</li>
																							<li style="list-style-type: decimal;">청약의 성립시기는 결제가 완료된 시점으로 합니다.</li>
																							<li style="list-style-type: decimal;">“회사”는 계약 체결 전에 “회원”이 청약의 내용을 확인하고, 정정 또는 취소할 수 있도록 적절한 절차를 갖추어야 합니다.</li>
																							<li style="list-style-type: decimal;">“회원”는 계약 전에 이 약관 및 개별 안내 페이지에서 “회사”가 안내하는 사항을 숙지하여 착오 없이 거래할 수 있도록 하여야 합니다.</li>
																							</ol>
																							
																							
																							<h6><b>제 20조. 청약철회</b></h6>
																							
																							“회사”의 “유료서비스”는 청약철회가 가능한 것과 청약철회가 제한되는 것으로 구분되어 제공되며, 이러한 내용은 이 약관 또는 “회원”의 “결제” 시 고지됩니다.
																							청약철회가 가능한 “유료서비스”를 “결제”한 “회원”은 “결제” 시부터 7일 이내에 “회사”의 고객센터에 청약 철회를 할 수 있습니다.
																							“회원”은 전항의 “청약철회” 기간이 경과되거나 전자상거래 등에서의 소비자 보호에 관한 법률, 콘텐츠 산업 진흥원, 온라인 디지털 콘텐츠 이용자 보호 지침 등 관련 법령에서 정한 청약철회 제한 사유에 해당하는 “유료서비스”의 경우 청약철회를 할 수 없습니다.
																							회원은 청약철회 의사를 고객센터 등을 통하여 회사에 그 의사를 표시하여야 하며, 회사는 환불요청을 접수하고 회원의 요청과 환불규정 확인 후, 3영업일 이내에 환불하여 드립니다.
																							회사의 환불 원칙은 다음과 같습니다.
																							강의 구매일 1주 이내에 진도율 7% 미만일 경우 전액 환불이 가능합니다.
																							강의 구매일이 1주일이 넘었거나, 진도율이 7% 이상일 경우 환불이 불가합니다.
																							1강으로 구성된 개별강의는 원칙적으로 환불이 불가능 합니다.
																							강의자료를 다운로드 받는 경우, 환불이 불가합니다.
																							특별강의는 이벤트성 강의, 비정규 강의, 특별기획 강의 등으로서 이는 별도의 수강 취소, 변경 및 환불규정이 적용될 수 있습니다.
																							회사의 환불 예외사항은 다음과 같습니다.
																							회원이 관계법령 및 본 약관의 규정을 위반하여 회사로부터 강제탈퇴 처리가 되는 경우에는 본 조의 환불규정이 적용되지 않습니다.
																							타인으로부터 양도받은(선물받은) 사이버머니에 대해서는 환불이 불가능합니다.
																							회사가 회원에게 무료로 지급한 사이버머니나 할인쿠폰 등으로 인해 회원이 획득하게 된 금액에 대해서는 환불되지 않습니다.
																							
																							<h6><b>제 21조. 청약철회 시 대금의 환급</b></h6>
																							
																							“회사”는 “유료서비스”를 “결제”한 “회원”에게 해당 “유료서비스”를 공급하기 곤란하다는 것을 알았을 때, 즉시 해당 사실을 해당 “회원”에게 통보하고 해당 “회원”의 동의를 얻은 후 취소하여야 하며, “회사”는 해당“회원”의 결제일로부터 3영업일 이내에 환불 및 환불에 필요한 조치를 취해야 합니다.
																							결제대금의 환불은“회사”가 환불을 승인한 날로부터 3영업일 이내에 대금의 “결제”와 동일한 방법(신용카드 결제취소 등)으로 이루어집니다.
																							신용카드를 통한 “결제” 대금 환불 시 “결제” 수단의 전자 결제 대행 사업자, 전자 결제 대행 또는 중개서비스 사업자의 정책 상 특정 기간이 지나 동일한 결제수단의 취소가 불가능한 경우에는 환불 정산액으로 환불이 진행됩니다. 환불정산액의 경우 회원정보 수집 및 내부 프로세스에 따라 영업일 15일 이내 처리될 수 있습니다.
																							휴대폰소액결제의 경우, 이동통신사 정책에 따라 결제승인 및 취소는 해당 월 내에만 가능하며 익월로 넘어갈 경우 계좌이체로 처리됩니다.
																							할인 쿠폰을 사용한 강의를 환불할 시 사용된 쿠폰은 소멸됩니다.
																							환불 과정에서 금융수수료가 발생하는 경우, 관련 법률에 따라 결제금액의 10%를 공제하고 환불할 수 있습니다.
																							<h2>제 4장. 계약 해지 및 이용 제한</h2>
																							<h6><b>제22조. 계약해제, 해지 등</b></h6>
																							
																							“회원”은 언제든지 고객센터 또는 회원 정보 관리 메뉴 등을 통하여 이용계약 해지 신청을 할 수 있으며, “회사”는 관련법 등이 정하는 바에 따라 이를 즉시 처리하여야 합니다.
																							“회원”이 계약을 해지할 경우, 관련법 및 개인정보취급방침에 따라 “회사”가 회원정보를 보유하는 경우를 제외하고는 해지 즉시 “회원”의 개인정보 데이터는 소멸됩니다.
																							"회원"이 계약을 해지하는 경우, "회원"이 서비스 내에서 직접 작성한 "게시물" 및 덧글과 같이 본인 계정으로 등록된 게시물 일체는 삭제되지 않으므로, 본인이 직접 사전에 삭제 후 탈퇴 하시기 바랍니다.
																							타인에 의해 담기, 스크랩 등이 되어 재게시 되거나, 공용게시판에 등록된 "게시물" 또한 삭제되지 않으니, 본인이 직접 절차에 의해 삭제 처리를 해야 합니다.
																							<h6><b>제23조. 마일리지</b></h6>
																							
																							“회사”는 서비스의 효율적 이용 및 운영을 위해 회원 가입, 충전, 이벤트 당첨 시에 회원에게 사이버 머니를 무상으로 제공할 수 있습니다. 단, 무상으로 제공된 사이버머니는 사전 공지 후 일부 또는 전부를 조정할 수 있으며, 회사가 정한 기간에 따라 주기적으로 소멸할 수 있습니다.
																							무상으로 제공된 사이버머니는 회원이 현금으로 충전 또는 디지털콘텐츠 판매로 획득한 다른 기타 사이버머니 및 현금과 달리, 회원 탈퇴 시 전부 소멸되며 복구가 불가능합니다.
																							<h6><b>제24조. 이용제한 등</b></h6>
																							
																							“회사”는 “회원”이 이 약관의 의무를 위반하거나 “서비스”의 정상적인 운영을 방해한 경우, 경고, 일시정지, 영구이용정지 등으로 “서비스” 이용을 제한할 수 있습니다.
																							“회사”는 전항에도 불구하고, “주민등록법”을 위반한 명의도용 및 결제도용, “저작권법” 및 “컴퓨터프로그램보호법”을 위반한 불법프로그램의 제공 및 운영방해, “정보통신망법”을 위반한 불법통신 및 해킹, 악성프로그램의 배포, 접속권한 초과행위 등과 같이 관련법을 위반한 경우에는 즉시 영구이용정지를 할 수 있습니다. 본 항에 따른 영구이용정지 시 “서비스” 이용을 통해 획득한 수익 등 기타 혜택 등도 모두 소멸되며, “회사”는 이에 대해 별도로 보상하지 않습니다.
																							“회사”는 “회원”이 계속해서 3개월 이상 로그인하지 않는 경우, 회원정보의 보호 및 운영의 효율성을 위해 이용을 제한할 수 있습니다.
																							“회사”는 본 조의 이용제한 범위 내에서 제한의 조건 및 세부내용은 이용제한정책 및 개별 서비스상의 운영정책에서 정하는 바에 의합니다.
																							본 조에 따라 “서비스” 이용을 제한하거나 계약을 해지하는 경우에는 “회사”는 그 사유 및 제한기간 등을 회원에게 9조에 따라 알려야 합니다.
																							“회원”은 본 조에 따른 이용제한 등에 대해 “회사”가 정한 절차에 따라 이의신청을 할 수 있습니다. 이 때 이의가 정당하다고 “회사”가 인정하는 경우 “회사”는 즉시 “서비스”의 이용을 재개합니다.
																							<h6><b>제25조. 부정이용 금지 및 차단</b></h6>
																							
																							회사는 다음 각호에 해당하는 경우를 부정 이용행위로 봅니다.
																							동일한 ID로 2대 이상의 기기에서 동시접속이 발생하는 경우
																							동일한 ID로 다수의 PC 또는 IP에서 서비스를 이용하는 경우
																							자신의 ID 및 강의 등의 서비스를 타인이 이용하도록 하는 경우
																							자신의 ID 및 강의 등의 서비스를 타인에게 판매, 대여, 양도하는 행위 및 이를 광고하는 행위
																							서비스 이용 중, 복제프로그램을 실행하는 경우 또는 녹화를 하거나 시도하는 경우
																							“강의”의 “게시물”을 재배포 하는경우
																							회사는 전항에 따른 부정 이용자가 발견 되었을 경우, 다음 각호에 따른 조치를 취할 수 있습니다.
																							[1차 발견 시] 전자우편, 쪽지, 팝업창을 통하여 경고합니다.
																							[2차 발견 시] 강제 탈퇴 처리되며 “회사”의 법률 대리인을 통한 고발조치와 민사소송을 진행하게 됩니다.
																							회원은 전항 제2호의 조치를 이유로, 서비스 이용기간의 연장을 요구할 수 없습니다.
																							회원은 회사로부터의 본 조 제2항의 조치에 이의가 있는 경우, 회사의 법률 대리인을 통해 소명할 수 있습니다.
																							부정이용 식별방법 및 차단
																							회사는 회원의 서비스 이용 중에 수집ㆍ확인된 IP정보 등의 자료를 토대로, 서버를 통하여 부정이용 여부를 분류, 확인합니다.
																							회사는 이용자가 서비스 이용 중에 복제프로그램을 실행시키거나 동일한 ID로 동시 접속을 하는 경우, 서비스 이용 접속을 강제로 종료 시킵니다.
																							<h6><b>제26조. 면책</b></h6>
																							
																							“회사”는 천재지변 또는 이에 준하는 불가항력으로 인하여 “서비스”를 제공할 수 없는 경우에는 “서비스” 제공에 관한 책임이 면제됩니다.
																							“회사”는 “회원”의 귀책사유로 인한 “서비스” 이용의 장애에 대하여는 책임을 지지 않습니다.
																							“회사”는 “회원”이 “서비스”와 관련하여 게재한 정보, 자료, 사실의 신뢰도, 정확성 등의 내용에 관하여는 책임을 지지 않습니다.
																							“회사”는 “회원” 간 또는 “회원”과 제3자 상호간에 “서비스”를 매개로 하여 거래 등을 한 경우에는 책임이 면제됩니다.
																							“회사”는 무료로 제공되는 서비스 이용과 관련하여 관련법에 특별한 규정이 없는 한 책임을 지지 않습니다.
																							“회사”는 CP가 제공하거나 회원이 작성하는 등의 방법으로 서비스에 게재된 정보, 자료, 사실의 신뢰도, 정확성 등에 대해서는 보증을 하지 않으며 이로 인해 발생한 회원의 손해에 대하여는 책임을 부담하지 아니합니다.
																							<h6><b>제27조. 준거법 및 재판관할</b></h6>
																							
																							본 약관은 대한민국법령에 의하여 규정되고 이행됩니다.
																							본 약관에 명시되지 않은 사항에 대해서는 관련법령에 의하고, 법에 명시되지 않은 부분에 대하여는 관습에 의합니다.
																							"회사"와 "회원"간 발생한 분쟁에 관한 소송은 제소 당시의 "회사"의 주소에 의한 관할 지방법원을 전속관할로 합니다.
																							<h2>개인정보 취급방침</h2>
																							인프랩 (이하 "회사")는 개인정보보호법, 통신비밀보호법, 전기통신사업법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등을 준수하고 있습니다. "회사"는 본 개인정보취급방침을 통하여 이용자가 제공하는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드리고자 합니다.
																							
																							본 개인정보취급방침은 정부의 법률 및 지침 변경이나 "회사"의 내부 방침 변경 등으로 인하여 수시로 변경될 수 있으며, 개정된 사항은 개인정보취급방침을 시행하기 최소 7일전에 쉽게 알아 볼 수 있도록 "회사"가 제공하는 서비스 페이지에 공지하도록 하겠습니다.
																							
																							"회사"의 개인정보취급방침은 다음과 같은 내용을 포함하고 있습니다.
																							
																							개인정보의 수집 및 이용 목적, 수집하는 개인정보의 항목 및 수집방법
																							개인정보의 제3자 제공
																							개인정보 보유 및 이용기간
																							회원의 권리와 행사 방법
																							개인정보 자동 수집 장치의 설치/운영 및 거부에 관한 사항
																							개인정보 보호를 위한 기술적·관리적 대책
																							개인정보 관리 책임자의 성명, 연락처, 부서
																							고지의 의무
																							<h4><b>1. 개인정보의 수집 및 이용 목적, 수집하는 개인정보의 항목 및 수집방법</b></h4>
																							개인정보란 생존하는 개인에 관한 정보로서 당해 개인을 식별할 수 있는 정보(당해 정보만으로는 특정 개인을 식별할 수 없더라도 다른 정보와 용이하게 결합하여 식별할 수 있는 것을 포함합니다.)를 말합니다.
																							"회사"는 수집된 개인정보를 다음의 목적을 위해 활용합니다.
																							회원가입 및 의사소통에 관한 사항: 회원 본인확인, 부정 가입방지, 가입 의사확인, 연령확인, 고충상담 및 처리, 공지사항 안내 등
																							콘텐츠 및 서비스 제공에 관한 사항: 캐시 결제, 개인 및 법인사업자의 서비스 이용 및 판매대금 정산, 금융거래 시 본인 인증 및 금융서비스 등
																							이벤트 및 마케팅, 자료조사에 관한 사항: 이벤트 및 홍보성 정보전달, 서비스이용에 관한 통계조사 등
																							기타 서비스 제공 등
																							"회사"는 위에 명시한 목적을 위해 다음과 같은 개인정보를 수집하고 있습니다.
																							필수항목: 이름(실명), 이메일, 비밀번호, 생년월일
																							선택항목:
																							성별, 관심사, 캐시 충전 시 신용카드 정보, 은행계좌 정보, 통신사 정보 와 같은 대금결제를 위한 추가정보 등
																							강사 등록 시 사업자 등록을 하지 않은 개인인 경우
																							필수정보: 이름(실명), 휴대전화번호, 우편번호, 주소
																							추가정보: 주민등록번호, 정산계좌정보(은행명, 계좌번호, 예금주)
																							강사 등록 시 사업자 등록을 한 개인사업자 및 법인사업자
																							필수정보: 회사명, 사업자등록번호, 대표자명, 회사 전화번호, 우편번호, 주소, 담당자명, 담당자 휴대전화번호
																							추가정보: 통신판매업신고번호, 수익입금계좌정보(은행명, 계좌번호, 예금주)
																							그 외 추가정보 입력 후 제출할 서류
																							사업자 등록을 하지 않은 개인: 계좌사본, 신분증사본
																							사업자 등록을 한 개인사업자 및 법인사업자: 계좌사본, 사업자등록증사본, 통신판매업신고증사본
																							수집방법: 홈페이지(회원가입, 게시판 등), 모바일 어플리케이션, 팩스, 전화, 고객센터 문의, 이벤트 응모
																							서비스 이용과정이나 사업 처리 과정에서 서비스 이용기록, 접속 로그, 쿠키, 접속 IP 정보, 결제기록, 이용정지 기록과 같은 정보들이 생성되어 수집 가능
																							부가서비스 또는 이벤트 응모 과정에서 해당 서비스의 이용자에 관한 정보 (개인정보 추가 수집에 대한 동의를 받는 경우에 한정)
																							"회사"는 이용자의 개인정보의 수집할 경우 반드시 이용자의 동의를 얻어 수집하며, 이용자의 기본적 인권을 침해할 우려가 있는 인종, 출신지, 본적지, 사상, 정치적 성향, 범죄기록, 건강상태 등의 정보는 이용자의 동의 또는 법령의 규정에 의한 경우 이외에는 수집하지 않습니다.
																							"회사"는 회원 가입을 만 14세 이상인 경우에 가능하도록 하며 개인정보의 수집·이용에 법정대리인의 동의가 필요한 만 14세 미만 아동의 개인정보는 수집하지 않습니다.
																							"회사"는 다음과 같은 방법으로 개인정보를 수집할 수 있습니다
																							홈페이지(회원가입, 게시판 등), 모바일 어플리케이션, 팩스, 전화, 고객센터 문의, 이벤트 응모
																							생성정보 수집 툴을 통한 자동 수집
																							<h4><b>2. 개인정보의 제3자 제공 및 위탁</b></h4>
																							<h5><b>2-1. 개인정보의 제3자 제공</b></h5>
																							"회사"는 정보주체의 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.
																							
																							<h5><b>2-2. 개인정보 처리의 위탁</b></h5>
																							"회사"는 원활한 업무 처리를 위해서 아래와 같이 개인정보를 위탁하고 있으며, 관계 법령에 따른 위탁계약 시 개인정보가 안전하게 관리될 수 있도록 필요한 사항을 규정하고 있습니다. 회사의 개인정보 위탁처리 기관 및 위탁업무 내용은 아래와 같습니다.
																							
																							제공받은 자	제공하는 목적	제공하는 개인정보 항목
																							LGCNS	톡드림을 이용한 카카오톡 알림 서비스	사용자 이름, 연락처
																							지식공유자	강의학습 정보 확인 및 발송	사용자 이름, 연락처
																							<h4><b>3. 개인정보 보유 및 이용기간</b></h4>
																							"회사"는 회원 가입 시 제공한 정보를 회원 가입시점부터 탈퇴 신청이 접수된 날까지 보관할 수 있습니다. 원칙적으로 회원 탈퇴 처리가 완료된 이후 회원 개인정보는 "회사"의 하드디스크에서 완전히 삭제되며, 문서의 경우 분쇄기로 분쇄하여 어떠한 용도로도 이용될 수 없도록 처리됩니다.
																							단, 관계법령의 규정에 의하여 보존할 필요가 있는 경우 "회사"는 아래와 같이 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다
																							개별적으로 회원의 동의를 받은 경우에는 약속한 보유기간
																							보존근거: 전자상거래 등에서의 소비자보호에 관한 법률, 통신비밀보호법
																							보존기간:
																							계약 또는 청약철회 등에 관한 기록(전자상거래법): 5년
																							대금결제 및 재화 등의 서비스 등의 공급에 관한 기록(전자상거래법): 5년
																							소비자의 불만 또는 분쟁처리에 관한 기록(전자상거래법): 3년
																							접속에 관한 기록 (통신비밀보호법): 3개월
																							<h4><b>4. 회원 및 법정대리인의 권리와 행사 방법</b></h4>
																							회원 및 법정대리인은 언제든지 다음의 사항에 관하여 개인정보 열람, 수정 및 회원 탈퇴를 요구할 수 있습니다.
																							"회사"가 보유하고 있는 회원의 개인정보
																							"회사"가 이용자의 개인정보를 이용하거나 제3자에게 제공한 내역
																							"회사"에게 개인정보수집ㆍ이용ㆍ제공 등의 동의를 한 내역
																							회원 및 법정대리인은 "회사" 서비스에서 직접 자신의 정보를 열람, 정정을 할 수 있으며, 별도로 개인정보보호책임자에게 서면, 전화, 이메일 등을 통하여 개인정보의 열람, 정정을 요청할 수 있습니다.
																							회원 및 법정대리인은 언제든지 자신의 개인정보처리의 정지를 요구할 수 있습니다.
																							회원 및 법정대리인은 언제든지 회원가입 시 개인정보의 수집, 이용, 제공 등에 대해 동의하신 의사표시를 철회(회원탈퇴)할 수 있습니다.
																							회원 및 법정대리인이 "회사" 서비스에서 본인 확인 절차를 거친 후 직접 동의철회(회원탈퇴)를 하거나, 별도로 개인정보보호책임자에게 서면, 전화 또는 이메일 등을 통하여 연락하면 지체 없이 이용자의 개인정보를 파기하는 등 필요한 조치를 취합니다. 단, 동의철회(회원탈퇴)가 있더라도 관계법령에 따라 최소한의 정보가 보관됩니다.
																							<h4><b>5. 개인정보 자동 수집 장치의 설치/운영 및 거부에 관한 사항</b></h4>
																							"회사"는 회원의 정보를 수시로 저장하고 불러오는 "쿠키"(cookie)를 사용합니다. "쿠키"는 웹사이트 이용 시 서버가 사용자의 웹브라우저에 보내는 작은 데이터 꾸러미로 회원의 컴퓨터의 하드디스크에 저장됩니다. "회사"는 다음과 같은 목적을 위해 "쿠키"를 사용합니다.
																							사용목적:
																							이용자의 접속 유지
																							이용자의 접속 빈도나 방문 시간 등을 분석, 이용자의 취향과 관심분야를 파악 및 자취 추적, 각종 이벤트 참여 정도 및 방문 횟수 파악 등을 통한 타겟 마케팅 및 개인 맞춤 서비스 제공
																							이용자는 "쿠키" 설치에 대한 선택권을 가지고 있으며 웹브라우저에서 옵션을 설정함으로써 모든 "쿠키"를 허용하거나, "쿠키"가 저장될 때마다 확인을 거치거나, 아니면 모든 "쿠키"의 저장을 거부할 수 있음
																							<h4><b>6. 개인정보 보호를 위한 기술적/관리적 대책</b></h4>
																							회원의 개인정보는 비밀번호에 의해 철저히 보호되고 있으며 본인이 제공한 이메일주소에 매칭되는 비밀번호는 본인만이 알고 있습니다. 따라서 개인정보의 확인 및 변경도 비밀번호를 알고 있는 본인에 의해서만 가능합니다.
																							회원은 본인의 비밀번호를 누구에게도 알려주면 안됩니다. 이를 위해 "회사"에서는 기본적으로 PC에서의 사용을 마치신 후 온라인상에서 로그아웃(LOG-OUT)하고 웹 브라우저를 종료하도록 권장합니다.
																							"회사"의 개인정보 보호를 위한 기술적/관리적 대책은 다음과 같습니다.
																							수집한 개인정보 중 비밀번호 등 본인임을 인증하는 정보에 대한 암호화 장치
																							컴퓨터 바이러스에 의한 개인정보의 침해를 막기 위한 백신소프트웨어 설치, 갱신, 점검 조치
																							개인정보 시스템에 대한 접근권한 설정, 관리 및 침입차단 시스템 등을 이용한 접근 통제장치
																							개인정보 취급자에 대한 지정과 권한의 설정 및 교육, 개인정보의 안전한 관리
																							<h4><b>7. 개인정보 관리 책임자의 성명, 연락처, 부서</b></h4>
																							이용자의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 "회사"는 개인정보관리책임자를 두고 있습니다. 개인정보와 관련한 문의사항이 있으시면 아래의 개인정보관리책임자에게 연락 주시기 바랍니다.
																							
																							이 름: 코딩팜
																							소 속: 코딩팜
																							연락처: 010-0000-0000
																							E-mail: codingfarm@gmail.com
																							기타 개인정보침해에 관한 상담이 필요한 경우에는 한국정보보호진흥원, 대검찰청 인터넷범죄수사센터, 경찰청 사이버테러대응센터 등으로 문의하실 수 있습니다.
																							
																							한국정보보호진흥원 (1336)
																							대검찰청 인터넷범죄수사센터 (02-3480-3600)
																							경찰청 사이버테러대응센터 (02-392-0330)
																							<h4><b>8. 고지의 의무</b></h4>
																							현재 개인정보 취급 방침에서 내용의 추가, 삭제 및 수정이 있을 시에는 변경사항의 시행일의 7일 전부터 "회사" 사이트의 공지사항을 통하여 고지 할 것 입니다. 다만, 회원의 권리 또는 의무에 중요한 내용의 변경은 최소 30일전에 고지하겠습니다.
																							
																							개인정보취급방침 시행일자: 2019년 11월 18일
																							      </p>
    
      
      						</div>
  </form>
</div>
    
    <br>

    <p id="text" style="display:none; color: red">구매조건 및 결제대행 서비스 약관 동의하여야 합니다.</p>
    </li>
  </ul>
    <button id="myBtn" class="si_btn" type="button"><i class='fas fa-check' style='font-size:15px'></i>&nbsp;결제하기</button> 
		 <!-- The Modal -->
			<div id="myModal" class="modal">
			 <!-- Modal content -->
			
			<div class="modal-content">
			  <span class="close">&times;</span>
			  <button class="si_btn" id="check_module"> 카드 결제 </button>
			<button class="si_btn" id="myBtn2"> 무통장 입금 </button>
			<button class="si_btn"> 모바일 결제 </button>
			  <button class="si_btn"> 네이버 페이 </button>
							
				 <!-- The Modal -->
					<div id="myModal2" class="modal2">
				  <!-- Modal content -->
				<form action="./OrderAdd.or" name="frmJoin" onSubmit="return CheckForm(this)">
				    <div class="modal-content2">
						<span class="close2">&times;</span>
						<div class="b_cho" >
							<h4>무통장 입금</h4><hr>
							<table style="border-collapse: collapse;">
							<tr>
							<td>은행 선택 </td>
							<td>
							<select id="bankch">
								<option value="bk_ch" selected>은행을 선택해 주세요</option> 
							  <option value="hana">하나은행</option>
							  <option value="kakao">카카오뱅크</option>
							  <option value="shinhan">신한은행</option>
							  <option value="sc" >sc제일은행</option>
							</select></td>
							</tr>
							<tr>
							<td>
							입금자명 </td><td><input type="text" placeholder="코딩팜"> <br><br></td></tr>
							<tr><td rowspan="2">현금영수증</td> <td> <input type="radio" name="creceipt" value="so"> 소득공제용
										 <input type="radio" name="creceipt" value="ji"> 지출증빙용
										 <input type="radio" name="creceipt" value="no"> 미발행<br>
										 <!-- <input type="text" readonly value="휴대 전화 번호" style="width:35%"> -->
						<input type="text" placeholder="휴대 전화 번호(-없이 숫자만)"></td></tr>
					<%-- <tr><td>이메일<input type="text"><%=MemberDTO.getM_email() %></td></tr> --%>
						</table><hr style="padding-bottom: 0px;">
						
							<input type="checkbox" name="U_checkAgreement1" id="U_checkAgreement1"  > 상기 결제 내용을 확인하였습니다.
							
							<br><input type="submit" value="결제">
						</div>
						</div>
						</form>

			</div>

						</div>
 
</div>

	</div>
	<%
String phone = (String)request.getAttribute("phone");
String name = (String)request.getAttribute("name");
String email = (String)request.getAttribute("email");	%>
<script>

$("#check_module").click(function () {
var IMP = window.IMP; // 생략가능
IMP.init('imp18806264');
IMP.request_pay({
pg: 'inicis', 
pay_method: 'card',
merchant_uid: 'merchant_' + new Date().getTime(),
/*
merchant_uid에 경우
https://docs.iamport.kr/implementation/payment
*/
name: '장바구니',
//결제창에서 보여질 이름
amount: <%=total %>,
//가격
buyer_email: '<%=email%>',
buyer_name: '<%=name %>',
buyer_tel: '<%=phone %>',
buyer_postcode: '123-456',
m_redirect_url: 'https://www.yourdomain.com/payments/complete'
/*
모바일 결제시,
결제가 끝나고 랜딩되는 URL을 지정
(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
*/
}, function (rsp) {
console.log(rsp);
if (rsp.success) {
var msg = '결제가 완료되었습니다.';
msg += '고유ID : ' + rsp.imp_uid;
msg += '상점 거래ID : ' + rsp.merchant_uid;
msg += '결제 금액 : ' + rsp.paid_amount;
msg += '카드 승인번호 : ' + rsp.apply_num;
location.href="./OrderAdd.or";
} else {
var msg = '결제에 실패하였습니다.';
msg += '에러내용 : ' + rsp.error_msg;
}
alert(msg);
location.href="./BasketList.ba";
});
});
</script>
<script>
// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>
<script>
// Get the modal
var modal2 = document.getElementById("myModal2");

// Get the button that opens the modal
var btn2 = document.getElementById("myBtn2");

// Get the <span> element that closes the modal
var span2 = document.getElementsByClassName("close2")[0];

// When the user clicks the button, open the modal 
btn2.onclick = function() {
  modal2.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span2.onclick = function() {
  modal2.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal2) {
    modal2.style.display = "none";
  }
}
</script>
<script>
// Get the modal
var Vmodal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == Vmodal) {
    Vmodal.style.display = "none";
  }
}
</script>

<script type="text/javascript">
function myFunction(){
    var checkBox = document.getElementById("myCheck");
    var text = document.getElementById("text");
    if (checkBox.checked == false){
        text.style.display = "block";
      }else {
         text.style.display = "none";
      }
}
</script>

<script type="text/javascript">
function CheckForm(Join){
    
    //체크박스 체크여부 확인 [하나]
    var chk1=document.frmJoin.U_checkAgreement1.checked;
    
    if(!chk1){
        alert('상기 결제 내용 확인에 동의해 주세요');
        return false;
    } 
}
</script>

</section>


 
 

</body>
<!-- footer -->
 <jsp:include page="/include/footer.jsp"></jsp:include>
</html>