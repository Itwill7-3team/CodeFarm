<%@page import="com.lecture.db.LectureDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="./img/logo.ico" rel="shortcut icon" type="image/x-icon">
<title>코딩팜-강의만들기</title>
<link href="./css/updateLecture.css" rel="stylesheet">



	<% LectureDTO ldto=(LectureDTO)request.getAttribute("ldto");System.out.println("작동"); %>

	
</head>
<body>
	<jsp:include page="/include/header.jsp" />
	<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.js"></script>

	<div class="header">
		<div class="header_center">
			<span class="header_title">내 강의 만들기</span>
			<div class="header_right">
				<button class="right_btn">강의보기</button>
				<button class="right_btn save">저장</button>
			</div>
		</div>
	</div>
	<div class="content_cover">
		<div class="content">
			<aside class="sidebar">
			<div class="side_menu">
				<div class="side_title">강의제작</div>
				<div class="side_items">
					<div class="side_item active" data-type="information">
						<i class="fas fa-check-circle"></i><span class="item_title mouse">강의정보</span>
					</div>
					<div class="side_item " data-type="introduction">
						<i class="fas fa-check-circle"></i><span class="item_title mouse">상세소개</span>
					</div>
					<div class="side_item" data-type="curriculum">
						<i class="fas fa-check-circle"></i><span class="item_title mouse">커리큘럼</span>
					</div>
					<div class="side_item" data-type="cover-img">
						<i class="fas fa-check-circle"></i><span class="item_title mouse">커버이미지</span>
					</div>
				</div>

			</div>
			<div class="side_menu">
				<div class="side_title">설정</div>
				<div class="side_items">
					<div class="side_item" data-type="course_setting">
						<i class="fas fa-check-circle"></i><span class="item_title mouse">강의설정</span>
					</div>
					
				</div>

			</div>
			<div class="submit_button">
				<button class="button submit">제출하기</button>
			</div>
			</aside>
			<div class="main_content_cover">
				<h4 class="title_heading">강의제작</h4>
				<h4 class="title_sub_heading">강의 정보</h4>
				<div class="main_content" id="information">
				<div class="field">
					<div class="title input_item">
						<label class="menu_label">강의 제목</label>
						<div class="input_box">
							<input class="box_input" name="title" placeholder="제목을 입력해주세요"
								autocomplete="off" value="${ldto.l_title}">
						</div>
					</div>
				</div>
				<div class="field">
					<div class="label_box">
						<label class="menu_label">이런걸 배울수 있어요 <span class="tip">Tip<i
								class="fas fa-angle-right"></i></span></label>
					</div>
						<input class="box_input" name="abilities" placeholder="ex)리엑트 네이티브 개발" autocomplete="off">
						<button class="addInput button" data-name="abilities" value="1">추가하기</button>
					<div class="warn_wrap"><span>두개이상 넣어주세요</span></div>
						<ul class="boxes abilities">
						<%
						if(ldto.getL_abilities()!=null){
						String[] abilities=ldto.getL_abilities().split("/");
						for(int i=0;i<abilities.length;i++){ %>
					
			<li class="dynamic_box" data-content="<%= abilities[i] %>">
			<div class="content_box"><%=abilities[i] %></div>
			<div class="btns">
				<a class="btn_icon del"><i class="fas fa-trash-alt"></i></a>
				<span class="btn_icon handle"><i class="fas fa-grip-lines"></i></span></div></li>
						<%}} %>
						</ul>
				</div>
				<div class="field">
					<div class="label_box">
						<label class="menu_label">이런 분들에게 추천해요 <span class="tip">Tip
						<i class="fas fa-angle-right"></i></span></label>
					</div>
						<input class="box_input" name="title" placeholder="ex)코딩 처음 접하는 사람" autocomplete="off">
						<button class="addInput button" data-name="targets" value="1">추가하기</button>
						<div class="warn_wrap"><span>두개이상 넣어주세요</span></div>
						<ul class="boxes targets">
						<%
						if(ldto.getL_targets()!=null){
						String[] targets=ldto.getL_targets().split("/");
						for(int i=0;i<targets.length;i++){ %>
			<li class="dynamic_box" data-content="<%=targets[i] %>">
			<div class="content_box"><%=targets[i] %></div>
			<div class="btns">
				<a class="btn_icon del"><i class="fas fa-trash-alt"></i></a>
				<span class="btn_icon handle"><i class="fas fa-grip-lines"></i></span></div></li>
						<%}} %>
						</ul>
				</div>
				<div class="field">
					<div class="label_box">
						<label class="menu_label">선수 지식이 필요하다면 무엇인가요? <span
							class="select">(선택)</span></label>
					</div>
						<input class="box_input" name="title" placeholder="ex)C언어" autocomplete="off">
						<button class="addInput button" data-name="based" value="1">추가하기</button>
						
						<ul class="boxes based">
						<%
						if(ldto.getL_based()!=null){
						String[] based=ldto.getL_based().split("/");
						for(int i=0;i<based.length;i++){ %>
			<li class="dynamic_box" data-content="<%=based[i] %>">
			<div class="content_box"><%=based[i] %></div>
			<div class="btns">
				<a class="btn_icon del"><i class="fas fa-trash-alt"></i></a>
				<span class="btn_icon handle"><i class="fas fa-grip-lines"></i></span></div></li>
						<%}} %>
						</ul>
				</div>
					<div class="field">
						<div class="label_box">
							<label class="menu_label">카테고리 </label>
							<div class="button_box categoryBox1">
								<button class="button category1" value="IT프로그래밍">IT프로그래밍</button>
								<button class="button category1" value="크리에이티브">크리에이티브</button>
								<button class="button category1" value="업무스킬">업무스킬</button>
								<button class="button category1" value="그외">그외</button>
							</div>
							<label class="menu_label"> 2차 분류 </label>
							<div class="button_box categoryBox2">
								
							</div>
						</div>
					</div>
					<div class="field">
						<div class="title button_item">
							<label class="menu_label">강의수준</label>
							<div class="button_box level">
								<button class="button level" value="입문">입문</button>
								<button class="button level" value="초급">초급</button>
								<button class="button level" value="중급">중급</button>
								<button class="button level" value="고급">고급</button>
							</div>
							<input type="hidden">
						</div>
					</div>
				</div>
				<div class="main_content" id="introduction">
					<div class="title textarea_item">
						<label class="menu_label">강의 두줄 요약 </label>
						<textarea class="textarea description" name="title"
							placeholder="주제에 대한 설명을 적어주세요" autocomplete="off">${ldto.l_description}</textarea>
					</div>
					<hr>
					<div class="notification">
						<h3 class="bold">소개글을 충실히 작성해 주세요</h3>
						<p>
							강의 소개글은 강의 수강신청 및 판매율에 결정적인 영향을 끼칩니다.<br> 최소 7줄 이상의 소개를
							부탁드려요!<br> 강의 소개글 분량이 모자란 경우, 제출 후 반려될 수 있습니다.
						</p>
						<br> 
						<h3 class="bold">매력적인 소개글</h3>
						<p>
							학생들이 강의 소개를 볼 때 수강하고 싶도록 마음껏 내 강의의 매력을 어필해 보세요.<br> <span
								class="bold">사진, 그래프, 영상</span>등 설득될만한 자료를 꼭 첨부해 주세요!
						</p>
						<br> 
						<p>
							혹시 강의 소개 작성이 막막한 분들을 위해 가이드를 준비했어요<br> 가이드를 보고 싶은 분들은 <a
								href="#">이곳</a> 을 클릭!!
						</p>
					</div>
					<div class="body textarea_item">
						<label class="menu_label">강의 상세 내용(해당내용은 강의 상세페이지에서
							보여집니다.)</label>
						<!-- 에디터 넣는자리  시작 -->
						<div id="summernote2">${ldto.l_content}</div>
						<!-- 에디터 넣는자리 끝  -->
					</div>
				</div>
				<div class="main_content" id="curriculum">
					<div class="notification">
						<h3 class="bold">영상 등록</h3>
						<p>
							강의의 커리큘럼을 모두 작성한 뒤 수업마다 영상을 연결해 주셨나요?<br> 일부 영상에 재생 에러가 발생할
							경우, 파일명을 바꿔서 재업로드해주세요.<br> 강의 커리큘럼이 확정되지 않으면 강의를 오픈할 수 없습니다.
						</p>
						<br>
						<h3 class="bold">무료공개 수업 최소 1개 이상!</h3>
						<p>
							무료공개 수업을 최소 한 개 이상 설정해주세요.<br> 강의를 잘 표현 할 수 있는 좋은 수업을 보여준다면
							수강신청률이 올라갑니다.
						</p>
						<br>
						<h3 class="bold">여러개의 섹션으로 나눠주세요</h3>
						<p>
							수업들을 여러 섹션으로 잘게 묶어 놓으면 학생들이 훨씬 효과적으로 학습할 수 있습니다.<br> 보통 1개
							섹션당 4~6개의 수업으로 구성하면 좋아요!
						</p>
					</div>
					<div class="add_unit_button_wrapper">
						<button class="button4 add_unit_btn add_section_btn" value="1"><i class="fas fa-plus-circle"></i> 섹션 추가하기</button>
					</div>
					<ul class="curriculum_list ui-sortable">
						<li class="unit unit_section">
							<div class="box unit_box">
								<h3 class="section_title">
									<span class="unit_label">섹션 0 : </span>
									<span>첫번째 섹션의 제목을 입력해주세요.</span>
								</h3>
								<div class="unit_btns">
									<button class="button4 add_unit_btn add_lecture_btn"><i class="fas fa-plus-circle"></i> 수업추가하기</button>
									<button class="button4 section_mod_btn"><i class="fas fa-pen"></i></button>
									<button class="button4 unit_del_btn"><i class="fas fa-trash-alt"></i></button>
								</div>
							</div>
						</li>
						<li class="unit unit_lecture">
							<div class="box unit_box">
							      <p><span class="unit_label">수업 1 : </span><span>값을 입력해주세요.</span></p>
							      <div class="unit_btns">
							        <div>
							        	<button type="button" class="button4 lecture_mod_btn" >
							        		<i class="fas fa-pen"></i>
							  			</button>
							          	<button type="button" class="button4 unit_del_btn" >
							    			<i class="fas fa-trash-alt"></i>
							  		 	</button>
							        </div>
							     </div>
							 </div>
						</li>
						
					
					</ul>
					<!-- <div class="section_cover">
						<div class="section input_item">
							<label class="menu_label">섹션 0</label> <input type="text"
								class="box_input" placeholder="섹션제목을 적어주세요" autocomplete="off">
							<input class="addvideo button" value="영상추가하기" type="file">영상
							추가하기
							</button>
						</div>
					</div> -->
					
				</div>
				<div class="main_content" id="cover-img">
						<div class="notification">
						<h3 class="bold">커버 이미지 - 썸네일 및 홍보영상 등록</h3>
						<p>
							강의 커버 이미지(썸네일)를 직접 제작하실 경우, 이미지 규정에 맞춰 주세요.<br>
							이미지가 규정에 맞지 않을 경우, 운영팀 판단하에 임의로 변경될 수 있습니다.<br>
							홍보동영상 등록에 홍보동영상이나 강의 첫번째 영상(무료공개)을 등록해주세요.
						</p>
						</div>
					<hr>
						<div class="img_upload">
							<img class="tumnail">
							<div class="uploader">
							<p>
							          강의를 대표하는 이미지 
							  <a data-id="10" class="show_guide_modal ">
							    <span class="icon is-small">
							      <i class="far fa-question-circle"></i>
							    </span>
							  </a><br>
							          <small>
							          이미지 크기: 768 × 500(px), 확장자: jpg, jpeg, png, 이미지에 한글을 포함할 수 없습니다.
							     </small>
							 </p>
							 <form id="component_file_form" class="control" data-id="">
   							 <input id="image_file_upload" class="hidden_input" type="file" name="file" accept=".jpg, .jpeg, .png">
    							<div class="file_info">업로드 할 파일을 선택해주세요</div>
   								<div style="font-size: 0; margin-top: 5px; text-align: right;">
      							<button type="button" class="button2 add" onclick="getFile();">파일 선택</button>
							    <button type="button" class="button2 upload" disabled="">업로드</button>
						  </div>
					 <div class="downloadable">
      
						    </div>
						  </form>
						</div>
							<!--uploader 끝  -->
						</div>
						<!-- img_upload 끝 -->
				</div>
				<div class="main_content" id="course_setting">
					<div class="notification">
						<h3 class="bold">강의 설정 - 가격 및 수강 기한</h3>
						<p>
							설정해 주신 강의 가격은 부가세 미포함 가격입니다.<br>
							수강 기한에 제한을 두실 경우 반드시 개월 단위로 표기해주세요.<br>
						</p>
						<br> 
						<h3 class="bold">강의 계약정보 체크</h3>
						<p>
						유료 강의의 경우, 체크해주신 계약정보 동의 여부에 따라 계약서가 발송됩니다.<br>
						오픈 전, 계약정보 수정을 원하시면 인프런 운영팀으로 문의 주세요.<br>
						</p>
					</div>
					<hr>
					<div class="field" >
						<div class="label">가격 설정</div>
						<div class="control">
							<input class="box_input price" type="number" name="price" placeholder="가격을 설정해주세요" min="0" step="1000" max="1000000">
							<span>₩</span>
						</div>
						<div class="notice">
							<p>
								1. 가격 설정 후 제출하신 후에는, 가격 변경이 되지 않아요! 바꾸고 싶은 경우에는 운영팀에 문의해주세요 :)<br>
								2. 입력하신 가격은 부가세 미포함 가격입니다. 실제 수강생에는 부가세 10% 합산된 가격으로 보입니다.<br>
								3. 가격은 무료의 경우 0원으로 유료의 경우 10,000원 이상 1,000원 단위로 설정할 수 있습니다.
							</p>
						</div>
						<!-- 사용 안함  -->
						<!-- <div class="field">
							<div class="label">공개설정</div>
							<div class="buttons">
								<button class="button3 isActive" data-content="1">코딩팜 공개</button>
								<button class="button3" data-content="0">URL 로만 접근</button>
							</div>
						</div>
						<div class="field">
							<div class="label">수강 기한</div>
							<div class="buttons">
								<button  class="button3 isActive">무제한</button>
								<button  class="button3">제한</button>
							</div>
						</div> -->
						<div class="field">
							<div class="label">시작 메시지 <span>(수정가능)</span></div>
							<textarea class="textarea start-msg" name="start-msg"
							placeholder="시작 메세지를 적어주세요" autocomplete="off"></textarea>
						</div>
						<div class="field">
							<div class="label">완강 메시지 <span>(수정가능)</span></div>
							<textarea class="textarea end-msg" name="end-msg" placeholder="완강 메세지를 적어주세요" autocomplete="off"></textarea>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	
	
	
	
//태그 다완성되면 시작됨
$(document).ready(function() {
	
	$("header").removeClass("sticky");
	//시작할때 하나 화면출력
	$("#information").css("display", "block");
	 //에디터

	$('#summernote2').summernote({
			  height: 500,                 // set editor height
			  minHeight: null,             // set minimum height of editor
		      maxHeight: null,             // set maximum height of editor
		      focus: true,                  // set focus to editable area after initializing summernote
		      lang: "ko-KR",					// 한글 설정
				placeholder: '내용을 입력하세요 :-D',	//placeholder 설정

		  });
		
	
	//에디터 끝 
	$(".button_box.categoryBox1").on("click","button",function(){
		console.log($(this).val());
		var itprograming=["웹개발","모바일앱","게임 개발","데이터 사이언스","보안","인공지능","알고리즘","교양",
			"수학","서버","자동화","데이터베이스","개발도구","프레임워크 및 라이브러리","프로그래밍 언어",
			"서비스 개발","인프라","사물인터넷","블록체인"];
		var itprograming_eng=["web-dev","mobile-app","game_dev","data-science","security","artificaial-intelligence","algorithm","culture",
			"math","server-dev","automation","database-dev","programming-tool",
			"framework-library","programming-lang","service-dev","infra","iot","blockchain"];
		var creative=["3D 모델링","그래픽 디자인","영 상 편집,유튜브","영화 그래픽",
			"웹앱 디자인","게임 디자인","UX/UI","Sound","AR/VR"];
		var creative_eng=["3d_modeling","graphic-design","youtube","movie-graphic","webapp-design","game-design",
			"ux-ui","sound","ar-vr"];
		var businessskill=["MS-OFFICE","마케팅","금융 주식 투자","데이터 분석","업무 자동화",
			"회계 재무","경영지식","기획 프로젝트 관리","글쓰기","자기 계발","외국어"];
		var businessskill_eng=["office","marketing","finace","data-analysis","task-automation","accounting","management",
			"project-manage","writing","self-dev","foreign_language"];
		
		$(".button_box.categoryBox2").empty();
			
		if($(this).val()=="IT프로그래밍"){
			$.each(itprograming,function(i, element) {
				$(".button_box.categoryBox2").append('<button class="button category2" value="'+itprograming_eng[i]+'">'+element+'</button>');
			});
		}
		if($(this).val()=="크리에이티브"){
			$.each(creative,function(i, element) {
				$(".button_box.categoryBox2").append('<button class="button category2" value="'+creative_eng[i]+'">'+element+'</button>');
			});
		}
		if($(this).val()=="업무스킬"){
			$.each(businessskill,function(i, element) {
				$(".button_box.categoryBox2").append('<button class="button category2" value="'+businessskill_eng[i]+'">'+element+'</button>');
			});
		}
	});
	
	//클릭하면 display 나옴
	$(".side_item").click(function() {
		
		$(".side_item").removeClass("active");
		$(this).addClass("active");
		var active = $(this).attr("data-type");
		$(".main_content").css("display", "none");
		$('#' + active).css("display","block");
		$(".title_sub_heading").html(
		$(this).children("span").html());
	});
	//btn클릭시  active클래스 추가
	$(".button.level").click(function() {
		$(".button.level").removeClass("active");
		$(this).addClass("active");
	});
	$(".category1").click(function() {
		$(".category1").removeClass("active");
		$(this).addClass("active");
	});
	$(".categoryBox2").on("click","button",function() {
		$(".category2").removeClass("active");
		$(this).addClass("active");
	});
	//input버튼 새로 추가하는 액션
	$(".addInput").click(function() {
		var type=$(this).attr("data-name");
		var name = $(this).prev("input:first").attr("name");
		var placeholder = $(this).prev("input:first").attr("placeholder");
		var value=$(this).prev("input:first").val();
		console.log(value);
		if($(this).prev("input:first").val()){
		$(this).siblings(".boxes").append(
		'<li class="dynamic_box" data-content='+value+'>'
			+'<div class="content_box">'+value+"</div>"
			+'<div class="btns">'
				+'<a class="btn_icon del">'+'<i class="fas fa-trash-alt"></i>'+'</a>'
				+'<span class="btn_icon handle">'+'<i class="fas fa-grip-lines"></i>'+'</span>'
			+'</div>'
		+'</li>');
		$(this).prev("input:first").val("");
		}
		 
	});
	
	//box slide UI method
		 $(".boxes").sortable({
			 	containment : 'parent',
		        cursor:"move",
		        forcePlaceholderSize: true,
		        opacity: 0.5,
		        placeholder: "sortable-placeholder",
		        handle:".btn_icon.handle",
		        start: function(event, ui) {

		            ui.item.data('start_pos', ui.item.index());
		        },

		        stop: function(event, ui) {
		            var spos = ui.item.data('start_pos');
		            var epos = ui.item.index();

		        }
		    }); 
		 $(".boxes").disableSelection();
		 //list  움직이는 이벤트
		$(".ui-sortable").sortable({
			containment : 'parent',
	        cursor:"move",
	        forcePlaceholderSize: true,
	        opacity: 0.5,
			 start: function(event, ui) {
		            ui.item.data('start_pos', ui.item.index());
		        },

		        stop: function(event, ui) {
		            var spos = ui.item.data('start_pos');
		            var epos = ui.item.index();
		            reorder();
		        }
		});

	//input 으로 추가한 ol태그 삭제

	$(".field").on("click",(".btn_icon.del"),function(){
		$(this).parents(".dynamic_box").remove();
	});
	//input으로 추가한 ol태그 위치변경
	$(".field").on("click",(".btn_icon.handle"),function(){
	});
	//수업 변경 이벤트
	$(".curriculum_list").on("click",".lecture_mod_btn",function(){
		$("<div id='modal'>").dialog ({
			modal:true,
			open:function() {
				$(this).load("./include/VideoModal.jsp"); // 자기 자신(this) 앞에다가 ex.jsp를 띄워라
			},
			width:1280,
			//title:"외부파일 창 띄우기"
				
		});
	});
	//수업 추가 이벤트
	$(".curriculum_list").on("click",".add_lecture_btn",function(){
		var data=prompt("값을 입력해주세요", "");
		if(data==null){return;}
		for(var i=Number($(this).parents("li").index()+1);i<=$(this).parents("ul").children().size();i++){
				console.log(i);	
				console.log("시작값:"+Number($(this).parents("li").index()+1)+"끝 값:"+$(this).parents("ul").children().size());
			if($(".curriculum_list>li").eq(i).attr("class")=="unit unit_section ui-sortable-handle" || !$(".ui-sortable>li").eq(i) || $(this).parents("ul").children().size()==i ){
					console.log("실행"+i);				
				$(".curriculum_list>li").eq(i-1).after('<li class="unit unit_lecture ui-sortable-handle">'
						+'<div class="box unit_box">'
						      +'<p><span class="unit_label">수업 1 : </span><span>'+data+'</span></p>'
						      +'<div class="unit_btns">'
						        +'<div>'
						        	+'<button type="button" class="button4 lecture_mod_btn" >'
						        		+'<i class="fas fa-pen"></i>'
						  			+'</button>'
						          	+'<button type="button" class="button4 unit_del_btn" >'
						    			+'<i class="fas fa-trash-alt"></i>'
						  		 	+'</button>'
						        +'</div>'
						     +'</div>'
						 +'</div>'
					+'</li>'		
				);
				break;
			}
		
		}
		 reorder();
	});
	//섹션추가 이벤트
	$(".add_section_btn").on("click",function(){
		$(".curriculum_list").append(
				'<li class="unit unit_section ui-sortable-handle" style="opacity: 1;">'
				+'<div class="box unit_box">'
					+'<h3 class="section_title">'
						+'<span class="unit_label"></span>'
						+'<span></span>'
					+'</h3>'
					+'<div class="unit_btns">'
						+'<button class="button4 add_unit_btn add_lecture_btn"><i class="fas fa-plus-circle" aria-hidden="true"></i> 수업추가하기</button>'
						+'<button class="button4 section_mod_btn"><i class="fas fa-pen" aria-hidden="true"></i></button>'
						+'<button class="button4 unit_del_btn"><i class="fas fa-trash-alt" aria-hidden="true"></i></button>'
					+'</div>'
				+'</div>'
			+'</li>'		
		);
		 reorder();
	});
	//섹션 강의 지우기
	$(".curriculum_list").on("click",".button4.unit_del_btn",function(){
		$(this).parents("li").remove();
		reorder();
	});
	//섹션 강의 지우기
	$(".curriculum_list").on("click",".button4.section_mod_btn",function(){
		var input = prompt('바뀔 이름을 입력해주세요');
		$(this).parents(".box.unit_box").find("span").eq(1).html(input);
	});
	
	 //정렬 이벤트
	function reorder() {
		var index=0;
	    $(".curriculum_list").children("li").each(function(i, box) {
	    	if($(box).attr("class")=="unit unit_lecture ui-sortable-handle"){
	    		index++;
	    	}else{
	    		index=0;
	    	}
	        $(box).find(".unit_label").html("수업  "+index+" :");
			if($(this).next().length==0 || $(this).next().attr("class")=="unit unit_section ui-sortable-handle")
				 $(this).css("border-bottom","1px solid #5eceb3");
			else
				 $(this).css("border-bottom","none");
			
	        
	    });
	    $(".unit_section").each(function(i, box) {
	        $(box).find(".unit_label").html("세션  "+i+" :");

	    });
			$(".curriculum_list").children("li").css("border-top","none");
		if($(".curriculum_list").children().first().attr("class")=="unit unit_lecture ui-sortable-handle")
			$(".curriculum_list").children().first().css("border-top","1px solid #5eceb3");
	 }
	 //가격 기본값 천원단위이하 짜름
	 $(".box_input.price").on("change",function(){
		 if($(".box_input.price").val()!=0 && $(".box_input.price").val()<10000){
			 $(".box_input.price").val(10000);
		 }	
		 $(".box_input.price").val(Math.floor($(".box_input.price").val()/1000)*1000);
	 });
	//textarea 자동으로 세로너비 증가
	$(".textarea").on("keydown keyup change",function(){
		 $(this).height(1).height( $(this).prop('scrollHeight')+12 );	
	});

	//제출하기 버튼 누르면 발생하는 이벤트
	$(".button.submit").click(
	function() {
		var side_item_check=$(".side_item.final").size()==4?true:false;
		if(side_item_check){
			 $.ajax({
				 type: "POST",
		            //enctype: 'multipart/form-data',
		            url: "./recordUpdate.in",
		            data: {
						num: <%=Integer.parseInt(request.getParameter("num"))%>,    	
						id: "${m_email}",            	
		            },

		            success:function(data){
		            	alert("데이터 전송 성공");
		            },
		            error: function (data) {
		            	alert("저장실패!");
		            }
		        });
		}else{
			alert("필수요소들을 더입력해주세요.");
		}
		
	});
	//저장하기 버튼 누르면 저장하는 이벤트
	$(".save").on("click",function(){
		//강의 제목
		var title=$("input[name=title]").val();
		//이런걸 배울수 있어요
		var abilities="";
		for(var i=0;i<$(".boxes.abilities").children().size();i++)
			abilities+=$(".boxes.abilities").children().eq(i).children(".content_box").html()+"/";
		//이런 분들에게 추천해요
		var targets="";
		for(var i=0;i<$(".boxes.targets").children().size();i++)
			targets+=$(".boxes.targets").children().eq(i).children(".content_box").html()+"/";
		//선수 지식이 필요하다면 무엇인가요?
		var based="";
		for(var i=0;i<$(".boxes.based").children().size();i++)
			based+=$(".boxes.based").children().eq(i).children(".content_box").html()+"/";
		//카테고리
		var category=$(".button.category1.active").attr("value")+"/"+$(".button.category2.active").attr("value");
		//강의수준
		var level=$(".button.level").attr("value");
		/* 1페이지 끝 */
		//강의 두줄 요약
		var description=$(".textarea.description").val();
		//강의 상세 내용(해당내용은 강의 상세페이지에서 보여집니다.)
		var body=$(".note-editable").html();
		/* 2페이지 끝 */
		
		/* 3페이지  끝 */
		var img=$("#image_file_upload").val().replace("C:\\fakepath\\","");
		
		/* 4페이지 끝  */
		//가격정보
		var price= $(".box_input.price").val();
		console.log(price);
		if($(".textarea.end-msg").val()){
			var start_msg= processText($(".textarea.start-msg").val());
		}else{
			var start_msg="";
		}
		if($(".textarea.end-msg").val()){
			var end_msg= processText($(".textarea.end-msg").val());
		}else{
			var end_msg="";
		}
	
		/* 5페이지 끝 */
		//data 처리 끝
		//ajax 처리(Data저장)
		 $.ajax({
			 type: "POST",
	            //enctype: 'multipart/form-data',
	            url: "./updateLectureAction.in",
	            data: {
					num: <%=Integer.parseInt(request.getParameter("num"))%>,    	
					id: "${m_email}",            	
	            	title: title,
	            	abilities:abilities,
	            	targets:targets,
	            	based:based,
	            	category:category,
	            	level:level,
	            	description:description,
	            	body:body,
	            	img:img,
	            	price:price,
	            	start_msg:start_msg,
	            	end_msg:end_msg
	            },

	            success:function(data){
	            	alert(data);
	            },
	            error: function (data) {
	            	alert("저장실패!");
	            }
	        });
	});
	$(".hidden_input").on("change", function() {
		if($(this).val()){
		$(".file_info").html($(".hidden_input").val().split("\\fakepath\\")[1]);
			$(".button2.upload").removeAttr("disabled");
			$(".button2.upload").css("opacity",1);
		}else{
			$(".file_info").html("업로드 할 파일을 선택해주세요");
			$(".button2.upload").attr("disabled","true")
			$(".button2.upload").css("opacity",0.7);
		}
	});
	$(".button2.upload").on("click",function(){
		var form=$("#component_file_form")[0];
		var data = new FormData(form);
		 $.ajax({
			 type: "POST",
	            enctype: 'multipart/form-data',
	            url: "./addLectureImg.in",
	            data: data,
	            
	            processData: false,
	            contentType: false,
	            cache: false,
	            timeout: 600000,
	            success:function(data){
	            	
	            	$(".tumnail").attr("src","./upload/"+data);
	            	
	            },
	            error: function (data) {
	            	alert("fail");
	            }
	        });
	});
	reorder();
	//데이터 불러오는 처리
	$(".categoryBox1").children('button[value="${ldto.l_type}"]').trigger("click");
	
	$(".categoryBox2").children('button[value="${ldto.l_type2}"]').trigger("click"); 
	$(".button_box").children('button[value="${ldto.l_level}"]').trigger("click");

	$(".tumnail").attr("src","./upload/+${ldto.l_img}");
	if($(".tumnail").attr("src")=="./upload/+"){
		$(".tumnail").attr("src","./img/logo.png");
	}
	$(".file_info").html("${ldto.l_img}");
	$(".box_input.price").attr("value","${ldto.l_price}");
	$(".start-msg").html(returnText("${ldto.start_msg}"));
	$(".end-msg").html(returnText("${ldto.end_msg}"));
	
	if($(".file_info").html()==""){
		$(".file_info").html("업로드 할 파일을 선택해주세요");
	}
	$(".side_item").on("click",function(){
		//페이지 완료 체킹
	var abilities_check=$(".boxes.abilities>li").size()>1?true:false;
	var targets_check=$(".boxes.targets>li").size()>1?true:false;
	var category_check=$(".button_box.categoryBox1").children(".active").size()!=0?true:false;
	var category2_check=$(".button_box.categoryBox2").children(".active").size()!=0?true:false;
	var level_check=$(".button_box.level").children(".active").size()!=0?true:false;
	var page1_check=abilities_check&&targets_check&&category_check&&category2_check&&level_check;
	if(page1_check){
		$("div[data-type=information]").addClass("final");
	}
	//페이지 1 체크 완료 
	var description_check=$(".textarea.description").val().length>0?true:false;
	var body_check=$("#summernote2").html().length>0?true:false;
	var page2_check=description_check&&body_check;
	if(page2_check){
		$("div[data-type=introduction]").addClass("final");
	}
	var page4_check=$(".tumnail").attr("src")!="./img/logo.png"?true:false;
	if(page4_check){
		$("div[data-type=cover-img]").addClass("final");
	}
	var price_check=$(".box_input.price").val()?true:false;
	var start_msg_check=$(".textarea.start-msg").val()?true:false;
	var end_msg_check=$("textarea.end-msg").val()?true:false;
	var page5_check=price_check&&start_msg_check&&end_msg_check;
	if(page5_check){
		$("div[data-type=course_setting]").addClass("final");
	}
	console.log(page1_check+page2_check+page4_check+page5_check);
	});
});
	function getFile(){
		$(".hidden_input").click();
	}
	//textarea 태그로 변경
	function processText(data) {
		 var lines = data.split("\n");

		 // generate HTML version of text
		 var resultString  = "<p>";
		 for (var i = 0; i < lines.length; i++) {
		   resultString += lines[i] + "<br />";
		 }
		 resultString += "</p>";

		 // print out to page
		return resultString;
		}
	//태그->textarea
	function returnText(data){
		var lines=data.replace("<p>"," ").replace("</p>"," ").replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
		return lines;
	}
	function engtoKor(eng){
		var type1_kor=["IT프로그래밍","크리에이티브","업무스킬"]
		var type1_eng=["it-programming","creative","business"];
		var itprograming_kor=["웹개발","모바일앱","게임 개발","데이터 사이언스","보안","인공지능","알고리즘","교양",
			"수학","서버","자동화","데이터베이스","개발도구","프레임워크 및 라이브러리","프로그래밍 언어",
			"서비스 개발","인프라","사물인터넷","블록체인"];
		var itprograming_eng=["web-dev","mobile-app","game_dev","data-science","security","artificaial-intelligence","algorithm","culture",
			"math","server-dev","automation","database-dev","programming-tool",
			"framework-library","programming-lang","service-dev","infra","iot","blockchain"];
		var creative_Kor=["3D 모델링","그래픽 디자인","영 상 편집,유튜브","영화 그래픽",
			"웹앱 디자인","게임 디자인","UX/UI","Sound","AR/VR"];
		var creative_eng=["3d_modeling","graphic-design","youtube","movie-graphic","webapp-design","game-design",
			"ux-ui","sound","ar-vr"];
		var businessskill_kor=["MS-OFFICE","마케팅","금융 주식 투자","데이터 분석","업무 자동화",
			"회계 재무","경영지식","기획 프로젝트 관리","글쓰기","자기 계발","외국어"];
		var businessskill_eng=["office","marketing","finace","data-analysis","task-automation","accounting","management",
			"project-manage","writing","self-dev","foreign_language"];
		
		
	}
	</script>

</body>
</html>