<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<style type="text/css">
#modal *,#modal :after,#modal :before{
	box-sizing: inherit;
	font-size: 16px !important;
}
#modal .video.modal,#modal .modal .dimmed{
	top: 0;
    left: 0;
    right: 0;
    bottom: 0;
}
#modal .video.modal{
	
    /* z-index: 80; */
    position: fixed;
     display: inherit; 
    } 
#modal .dimmed{
    position: absolute;
    background: rgba(11,19,30,.37);
    }
.video.modal .modal_content.modify_lecture_modal_content{
overflow-y: auto;
    min-width: 938px;
    max-height: 800px;
    padding: 0;
    display: block;
}
#modal .video.modal section.modal-card{
	top: 0;
    bottom: 0;
    height: 95%;
    max-width: 920px;
    max-height: 720px;
    z-index: 80;}
    #modal .video.modal .modal_content{
    border-radius: 3px;
    background: #fff;
    max-width: 920px;
    z-index: 90;
    left: 0;
    right: 0;
    top: 0;
    bottom: 0;
    position: absolute;
    margin: auto;
    padding: 16px;
    }
    .video.modal section{
        position: absolute;
    width: 90%;
    left: 0;
    right: 0;
    margin: auto;
    }
    #modal .video.modal .modal_content.modify_lecture_modal_content .modal-card-head{
   	    padding-bottom: 1rem;
    }
    #modal .modal-card-head{
    border-bottom: 1px solid #dbdbdb;
    border-top-left-radius: 6px;
    border-top-right-radius: 6px;
    }
    #modal .modal-card-foot,#modal .modal-card-head{
    align-items: center;
    background-color: #fff;
    display: flex;
    flex-shrink: 0;
    justify-content: flex-start;
    padding: 20px;
    position: relative;
    height: auto !important;
    }
    #modal .control{
        box-sizing: border-box;
    clear: both;
    font-size: 1rem;
    position: relative;
    text-align: left;
    width: 100%;
    }
    #modal .video.modal .modal_content .control input{
	   	margin-top: 8px;
	    background: #f5f5f5;
	    height: 40px;
    }
    #modal .input{
   	border-radius: 3px;
    box-shadow: none;
    background: #f6f6f6;
    color: #5f5f5f;
    border: 1px solid transparent;
    width: 100%;
    }
    #modal .video.modal .modal_content.modify_lecture_modal_content .modal-card-head .x_btn_wrapper{
	    position: absolute;
	    top: 1rem;
	    right: 1rem;
    }
   #modal .modal-card-body{
   		background-color: #fff;
    	flex-grow: 1;
   	    flex-shrink: 1;
    	overflow: auto;
    	padding: 20px;
    	padding-bottom:0;
    	z-index:80;
    }
    #modal .video.modal .modal_content.modify_lecture_modal_content .label_divider{
	    display: block;
	    margin-top: 1rem;
	    font-size: 1.2rem;
	    font-weight: 400;
    }
    #modal .video.modal .modal_content.modify_lecture_modal_content .upload_video_control .selected_video{
    	margin-top: 8px;
    }
    #modal .has-text-info{
   		color:#3298dc!important;
    }
    #modal .video.modal .modal_content.modify_lecture_modal_content .upload_video_control .buttons{
    	margin: 8px 0 4px;
    }
    #modal .buttons .button:not(:last-child):not(.is-fullwidth){
    margin-right: .5rem;
    }
    #modal .buttons .button{
    	margin-bottom: .5rem;
    }
    #modal .button5, .file-cta, .file-name, .input, .pagination-ellipsis, .pagination-link, .pagination-next, .pagination-previous, .select select, .textarea{
    	-webkit-appearance: none;
	    align-items: center !important;
	    border: 1px solid transparent !important;
	    border-radius: 4px !important;
	    box-shadow: none !important;
	    display: inline-flex !important;
	    font-size: 1rem !important;
	    height: 2.25em !important;
	    justify-content: flex-start !important;
	    line-height: 1.5 !important;
	    padding: calc(.375em - 1px) calc(.625em - 1px);
	    position: relative !important;
	    vertical-align: top !important;
    }
    #modal .button5{
	  	background-color: #fff !important;
	    border-color: #dbdbdb !important;
	    border-width: 1px !important;
	    color: #363636 !important;
	    cursor: pointer !important;
	    justify-content: center !important;
	    padding: calc(.375em - 1px) .75em !important;
	    text-align: center !important;
	    white-space: nowrap !important;
	    width: auto !important;
    }
    #modal .buttons{
    align-items: center;
    display: flex;
    flex-wrap: wrap;
    justify-content: flex-start;}
    #modal .video.modal .modal_content.modify_lecture_modal_content .video_selectors{
    	    max-width: 500px;
    }
    #modal .video.modal .modal_content.modify_lecture_modal_content .video_selectors select.lecture_video{
	    width: 100%;
	    max-width: 403px;
	    height: 36px;
	    border-radius: 0;
	    background-color: #fff;
	    -webkit-appearance: none;
	    -moz-appearance: none;
	    appearance: none;
	    font-size: 1rem;
	    padding: 0 8px 0 1rem;
    }
    #modal .is-hidden{
    	    display: none!important;
    }
    #modal .file.is-right{
    	ustify-content: flex-end;
    }
    #modal .file{
	    align-items: stretch;
	    display: flex;
	    justify-content: flex-start;
	    position: relative;
    }
    #modal label{
    	width: 100%;
    }
    #modal .file.is-fullwidth .file-label{
        width: 100%;
    }
    #modal .file-label{
    	align-items: stretch;
	    display: flex;
	    cursor: pointer;
	    justify-content: flex-start;
	    overflow: hidden;
	    position: relative;
    }
   #modal #component_file_form{
	   	display: flex;
	    flex-direction: column;
	    align-items: flex-end;
   }
   #modal .video.modal .modal_content .control{
   		margin-top: 1rem;
   }
   #modal #component_file_form .hidden_input{
	   	width: .1px;
	    height: .1px;
	    opacity: 0;
	    overflow: hidden;
	    position: absolute;
	    z-index: -1;
   }
   #modal .video.modal .modal_content .control input{
	   	margin-top: 8px;
	    background: #f5f5f5;
	    height: 40px;
   }
   #modal #component_file_form .file_info{
	   	display: inline-block;
	    margin-top: 0;
	    width: 100%;
	    vertical-align: middle;
	    line-height: 45px;
	    padding-left: 1rem;
	    color: #454545;
	    height: 50px;
	    background: none;
	    border: 1px solid #979797;
	    border-radius: 0;
   }
   #modal #component_file_form .button5{
	   	height: 50px;
	    width: 85px;
	    margin-left: -5px;
	    border-radius: 0;
	    border: none;
	    background: #747474;
	    color: #fff;
   }
   #modal #component_file_form .button5.upload{
	   	margin-left: 0;
	    background: #1dc078;
   }
   #modal .button5.is-primary.is-hovered, .button5.is-primary{
   		background-color: #ff6d5a;
	    border-color: transparent;
	    color: #fff;
   }
   #modal .radios{
   	display: flex;
   }
   #modal .video.modal .modal_content.modify_lecture_modal_content .radios .radio_label{
       display: inline-block;
   	   margin-right: 5px;
   }
</style>
</head>

<div class="video modal ">
            <div class="dimmed"></div>
            <section class="modal-card content modal_content modify_lecture_modal_content">
              <header class="modal-card-head">
                <div class="control">
                  <label>
                    수업 제목<input type="text" class="input modify_lecture_title_input" placeholder="제목을 입력해주세요." value="ㅁㄴㅇ">
                  </label>
                </div>
                <div class="x_btn_wrapper">
                  <button class="x_btn"><svg aria-hidden="true" id="icon_times" xmlns="http://www.w3.org/2000/svg" width="16" viewBox="0 0 320 512"><path d="M207.6 256l107.72-107.72c6.23-6.23 6.23-16.34 0-22.58l-25.03-25.03c-6.23-6.23-16.34-6.23-22.58 0L160 208.4 52.28 100.68c-6.23-6.23-16.34-6.23-22.58 0L4.68 125.7c-6.23 6.23-6.23 16.34 0 22.58L112.4 256 4.68 363.72c-6.23 6.23-6.23 16.34 0 22.58l25.03 25.03c6.23 6.23 16.34 6.23 22.58 0L160 303.6l107.72 107.72c6.23 6.23 16.34 6.23 22.58 0l25.03-25.03c6.23-6.23 6.23-16.34 0-22.58L207.6 256z"></path><title>닫기</title></svg></button>
                </div>
              </header>
              <div class="modal-card-body">
                <label class="label_divider" for="lecture_upload">영상 업로드</label>
                <div class="upload_video_control">
                  <div class="selected_video"><span class="has-text-danger">수업과 연결된 영상이 없습니다.</span></div>
                  <div class="buttons">
                    <button class="button5 new_file_uploader">
                      새 파일 업로드
                    </button>
                    <button class="button5 show_library">
                      라이브러리에서 선택
                    </button>
                  </div>
                </div>
                <div class="video_selectors">
                  <div class="vimeo_uploader_container is-hidden"></div>
                  <select class="lecture_video is-hidden"><option>사용 가능한 영상이 없습니다.</option></select>
                  
<div class="uploader_container unit_video_uploader is-hidden">
  <div class="file has-name is-fullwidth is-right">
    <label class="file-label">
      <input class="file-input" type="file" accept="video/*">
      <span class="file-name">
        <span class="file_progress">파일을 선택하세요</span>
      </span>
      <span class="file-cta"><span class="file-label">파일 선택</span></span>
    </label>
  </div>
</div>
                </div>                
                <h4 class="label_divider">무료공개 여부 선택</h4>
                <div class="radios">
                  <span class="radio_label">예</span><input type="radio" class="radio" name="preview" value="true">
                  <span class="radio_label">아니오</span><input type="radio" class="radio" name="preview" value="false" checked="">
                </div>
                <label class="label_divider" for="note_upload">수업 노트 작성</label>
						<!-- 에디터 넣는자리  시작 -->
						<div id="summernote"></div>
						<!-- 에디터 넣는자리 끝  -->
                <label class="label_divider" for="attach_file_input">자료 파일 업로드</label>
                <div class="file_uploader_component"><form id="component_file_form" class="control" data-id="">
    <input id="attach_file_input" class="hidden_input" type="file" name="file" accept="*">
    <div class="file_info">파일을 선택하세요</div>
    <div style="font-size: 0; margin-top: 5px;">
      <button type="button" class="button5 add">파일 선택</button>
      <button type="button" class="button5 upload" disabled="">업로드</button>
    </div>
    <div class="downloadable">
      
    </div>
  </form></div>
              </div>
              <div class="modal-card-foot">
                <div class="buttons">
                  <button type="button" class="button5 cancel_btn">취소</button>
                  <button type="button" class="button5 add_btn is-primary">
                    저장
                  </button>
                </div>
              </div>
            </section>
          </div>
          </html>
<script>
//에디터

$('#summernote').summernote({
		  height: 500,                 // set editor height
		  minHeight: null,             // set minimum height of editor
	      maxHeight: null,             // set maximum height of editor
	      focus: true,                  // set focus to editable area after initializing summernote
	      lang: "ko-KR",					// 한글 설정
			placeholder: '내용을 입력하세요 :-D',	//placeholder 설정
		

	  });
 $('.x_btn').click(function(){
	removeModal();
}); 
	 function removeModal(){
		$("#modal").remove();
	} 
</script>