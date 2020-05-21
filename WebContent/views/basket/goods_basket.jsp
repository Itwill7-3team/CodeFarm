<%@page import="com.wishlist.db.WishlistDTO"%>
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
<link href="./img/logo.ico" rel="shortcut icon" type="image/x-icon">
<title>코딩팜</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>



</head>
<link rel="stylesheet" href="./css/basket.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.Wmodal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /*Full width */
  height: 100%;  /*Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.Wmodal-content {
  background-color: #fefefe;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 50%;
}

/* The Close Button */
.Wclose {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.Wclose:hover,
.Wclose:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}


/* Float four columns side by side */
/* .Wcolumn {
  float: left;
  width: 90%;
  padding: 0 10px;
 
} */

/* Remove extra left and right margins, due to padding */
.Wrow {margin: 0 -5px;}

/* Clear floats after the columns */
.Wrow:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive columns */
@media screen and (max-width: 600px) {
  .Wcolumn {
    width: 100%;
    display: block;
    margin-bottom: 20px;
  }
}

/* Style the counter cards */
.Wcard {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  padding: 16px;  
  background-color: #f1f1f1;
    max-width: 920px;
  max-height: 720px;
  margin-bottom: 10px;
  
   
}
.Wibox{

    width: 100%;
    height: auto;
    padding: 10px 10px 10px 0;
    display: inline-block;

    
}
.Wbox{float: left;}
.Wmodal-content{max-width: 920px;
  max-height: 720px;
  height: 95%;}
.Wcontent{display: inline-block;

    margin-left: 30px;
    }
    
.Wamount {text-align: center; width: 100px; margin-left: auto;
 padding-top: 10px; }    
</style>


<body>
	<jsp:include page="/include/header.jsp" />
	<%
		List basketList = (List) request.getAttribute("basketList");
		List lectureList = (List) request.getAttribute("lectureList");
		List wishList = (List)request.getAttribute("wishlistList");
		List wishLectureList = (List)request.getAttribute("wishLectureList");
		MemberDTO MemberDTO = (MemberDTO) request.getAttribute("memberDTO");
	%>

	<section id="alll"> <!-- 위시 수정 -->

	<h3 class="boxh3">
		바구니 > <a id="Wabtn" style="font-size: 16px; cursor: pointer;">위시리스트</a>
	</h3>
	<!-- The Modal -->
<div id="WmyModal" class="Wmodal">

  <!-- Modal content -->
  <div class="Wmodal-content">
    <span class="Wclose">&times;</span>
    <h2>위시리스트</h2>
    <hr>
    
          <%
           for (int i = 0; i < wishList.size(); i++) {
        	  WishlistDTO widto = (WishlistDTO) wishList.get(i);
          	  LectureDTO wldto = (LectureDTO) wishLectureList.get(i);
          	  %>
          	  <div class="Wrow">
       <div class="Wcolumn"> 
        <div class="Wcard">
          <div class="Wibox">
          <div class="Wbox" style="display: inline-block;">
           <a href="Detail.le?num=<%=wldto.getL_number() %>">
 			 <img style="width: 130px; height: auto;" src="./upload/<%=wldto.getL_img().split(",")[0]%>" alt="">
				</a>
         
          <div class="Wcolumn Wcontent">
				<a href="Detail.le?num=<%=wldto.getL_number()%>"><%=wldto.getL_title()%></a>
				<p style="font-size: 12px;">
					<%=wldto.getL_m_email()%></p>
				<!-- basketDAO 추가 설정 -->
			  </div>
			 </div> 
			 <div class="Wamount">
			<c:set var="price" value="<%=wldto.getL_price()%>" />
			<span style="text-align: center;"> <fmt:setLocale
					value="ko_KR" />
				<fmt:formatNumber type="currency" value="${price}" />
			</span>
			<div class="tooltip">
				<a href="./WishListDelete.wi?b_num=<%=widto.getW_num()%>"> <i
					class="fa fa-close"></i> <span class="tooltiptext">위시리스트 삭제</span>
				</a><br>
			</div>
	 		<% BasketDTO bdto = new BasketDTO(); { %>
			<button class="d_btn d_btn2" type="button"
				onclick="location.href ='./BasketAdd.ba?b_num=<%=bdto.getB_num()%>'">
				장바구니 <i class='fa fa-cart-plus' style='color: black;'></i>
			</button>   
			<%} %> 
		</div>
			 
          
         </div> 
         
         
          </div>
          
          </div>
           </div> 
          <%
          }
          %>
    
			
      
        
        
      
    </div>
  </div>



	<%
		int total = 0;
		int stotal = 0;
		for (int i = 0; i < basketList.size(); i++) {
			BasketDTO bdto = (BasketDTO) basketList.get(i);
			LectureDTO ldto = (LectureDTO) lectureList.get(i);
	%>
	<div class="boxx">
		<div class="clearfix">
			<div class="column menu">
				<img class="image" src="./upload/<%=ldto.getL_img().split(",")[0]%>">
			</div>
			<div class="column content">
				<a href="#"><%=ldto.getL_title()%></a>
				<p style="font-size: 12px;">
					<%=ldto.getL_m_email()%></p>
				<!-- basketDAO 추가 설정 -->
			</div>
		</div>

		<div class="amount">
			<c:set var="price" value="<%=ldto.getL_price()%>" />
			<span style="text-align: center;"> <fmt:setLocale
					value="ko_KR" />
				<fmt:formatNumber type="currency" value="${price}" />
			</span>

			<div class="tooltip">
				<a href="./BasketDelete.ba?b_num=<%=bdto.getB_num()%>"> <i
					class="fa fa-close"></i> <span class="tooltiptext">장바구니 삭제</span>
				</a><br>
			</div>
			<button class="d_btn d_btn2" type="button"
				onclick="location.href ='./BasketDelete.ba?b_num=<%=bdto.getB_num()%>'">
				위시리스트 <i class='fas fa-heart' style='color: black;'></i>
			</button>
		</div>

	</div>
	<%
		//쿠폰값 수정
			total += ldto.getL_price();
			stotal = total * (100 - ldto.getL_pct()) / 100; // 할인수정
		}
	%>

	<div class="boxx2">
		<h3 class="boxh32">주문 내역</h3>
		<div class="si_columns">
			<ul class="price">
													<!-- 쿠폰 수정 -->
				<li style="border-bottom: 1px solid pink; padding-bottom: 15px;">
					쿠폰: <select id="cars">
						<option value="cho" selected>쿠폰을 선택해 주세요.</option>
						<!-- <option value="volvo">Volvo</option>
						<option value="saab">Saab</option>
						<option value="vw">VW</option>
						<option value="audi">Audi</option> -->
				</select>
				</li>

				<c:set var="total" value="<%=total%>" />
				<li>합계&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<fmt:setLocale
						value="ko_KR" />
					<fmt:formatNumber type="currency" value="${total}" /> 원
				</li>


				<li class="myCheckli"
					style="list-style-type: none; font-size: 12px;"><input
					type="checkbox" id="myCheck" onclick="myFunction()" checked>
					(필수) 구매조건 및 개인정보취급방침 동의
					<button class="Vbtn"
						onclick="document.getElementById('id01').style.display='block'">[보기]</button>
					<div id="id01" class="Vmodal">
						<span
							onclick="document.getElementById('id01').style.display='none'"
							class="Vclose" title="VClose Modal">×</span>
						<form class="Vmodal-content" action="/action_page.php">
							<div class="Vcontainer">
								<jsp:include page="../../include/clause.jsp" />
							</div>
						</form>
					</div> <br>
						<!-- 체크 해제 시 보이기 -->
					<p id="text" style="display: none; color: red">구매조건 및 결제대행 서비스
						약관 동의하여야 합니다.</p></li>
			</ul>
			<button id="myBtn" class="si_btn" type="button">
				<i class='fas fa-check' style='font-size: 15px'></i>&nbsp;결제하기
			</button>
			<!-- Modal -->
			<div id="myModal" class="modal">
				<!-- Modal content -->

				<div class="modal-content">
					<span class="close">&times;</span>
					<button class="si_btn" id="check_module">카드 결제</button>
					<button class="si_btn" id="myBtn2" name="">무통장 입금</button>
						<!-- 실행 x -->
					<button class="si_btn">모바일 결제</button>
					<button class="si_btn">네이버 페이</button>

					<!-- modal2 -->
					<div id="myModal2" class="modal2">
						<!-- Modal content2 -->
						<form action="./OrderAdd.or" name="frmJoin"
							onSubmit="return CheckForm(this)">
							<div class="modal-content2">
								<span class="close2">&times;</span>
								<div class="b_cho">
									<h4>무통장 입금</h4>
									<hr>
									<table style="border-collapse: collapse;">
										<tr>
											<td>은행 선택</td>
											<td><select id="bankch" name="o_t_bank">
													<option value="bk_ch" selected>은행을 선택해 주세요</option>
													<option value="하나은행">하나은행: 135-123456-12345</option>
													<option value="카카오뱅크">카카오뱅크: 3333-00-3333111</option>
													<option value="신한은행">신한은행: 110-555-899996</option>
													<option value="sc제일은행">sc제일은행: 779-22-220000</option>
											</select></td>
										</tr>
										<tr>
											<td>입금자명</td>
											<td><input type="text" placeholder="코딩팜" name="o_t_payer"> <br>
											<br></td>
										</tr>
										<tr>
											<td rowspan="2">현금영수증</td>
											<td><input type="radio" name="creceipt" value="so">
												소득공제용 <input type="radio" name="creceipt" value="ji">
												지출증빙용 <input type="radio" name="creceipt" value="no">
												미발행<br> 
												<!-- <input type="text" readonly value="휴대 전화 번호" style="width:35%"> -->
												<input type="text" placeholder="휴대 전화 번호(-없이 숫자만)"></td>
										</tr>
															<!-- 이메일 수정 -->
										<%-- <tr><td>이메일<input type="text"><%=MemberDTO.getM_email() %></td></tr> --%>
									</table>
									<hr style="padding-bottom: 0px;">
									<input type="checkbox" name="U_checkAgreement1"
										id="U_checkAgreement1"> 상기 결제 내용을 확인하였습니다. <br>
									<input type="submit" value="결제">
								</div>
							</div>
						</form>

					</div>

				</div>

			</div>

		</div>
		<%
			String phone = (String) request.getAttribute("phone");
			String name = (String) request.getAttribute("name");
			String email = (String) request.getAttribute("email");
		%>
	<!-- 카드 결제 -->
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
	amount: <%=total%>,
	//가격
	buyer_email: '<%=email%>',
	buyer_name: '<%=name%>',
	buyer_tel: '<%=phone%>',
	buyer_postcode : '123-456',
	m_redirect_url : 'https://www.yourdomain.com/payments/complete'
	/*
	 모바일 결제시,
	 결제가 끝나고 랜딩되는 URL을 지정
	 (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
	 */
		},function(rsp) {
			console.log(rsp);
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : '
						+ rsp.imp_uid;
				msg += '상점 거래ID : '
						+ rsp.merchant_uid;
				msg += '결제 금액 : '
						+ rsp.paid_amount;
				msg += '카드 승인번호 : '
						+ rsp.apply_num;
				location.href = "./OrderAdd.or";
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : '
						+ rsp.error_msg;
			}
			alert(msg);
			location.href = "./BasketList.ba";
		});
	});
		</script>
	<!-- modal -->
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
	<!-- modal2 -->
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
	<!-- 약관 -->
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
	<!-- 약관 숨기기  -->
	<script type="text/javascript">
		function myFunction() {
			var checkBox = document.getElementById("myCheck");
			var text = document.getElementById("text");
			if (checkBox.checked == false) {
				text.style.display = "block";
			} else {
				text.style.display = "none";
			}
		}
	</script>
	<!-- 무통장 결제 체크 -->
	<script type="text/javascript">
		function CheckForm(Join) {

			//체크박스 체크여부 확인 [하나]
			var chk1 = document.frmJoin.U_checkAgreement1.checked;

			if (!chk1) {
				alert('상기 결제 내용 확인에 동의해 주세요');
				return false;
			}
		}
	</script>

<!-- 위시리스트 모달 -->
<script>
// Get the modal
var Wmodal = document.getElementById("WmyModal");

// Get the button that opens the modal
var Wbtn = document.getElementById("Wabtn");

// Get the <span> element that closes the modal
var Wspan = document.getElementsByClassName("Wclose")[0];

// When the user clicks the button, open the modal 
Wbtn.onclick = function() {
  Wmodal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
Wspan.onclick = function() {
  Wmodal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == Wmodal) {
    Wmodal.style.display = "none";
  }
}
</script>



</section>

</body>
<!-- footer -->
<jsp:include page="/include/footer.jsp"></jsp:include>
</html>