<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko-KR"><head><style id="stndz-style"></style>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
  <link rel="manifest" href="/manifest-web.json">
  <!-- include PWACompat _after_ your manifest -->

  <script type="text/javascript">
    window.isReactNative = false;
    window.isIos = false;
  </script>
  <script async="" src="/pwacompat.min.js"></script>

    <title>코딩팜</title>
    <link rel="canonical" href="https://www.inflearn.com/course/git-and-github/lecture/14175">
   
  <link rel="stylesheet" href="https://cdn.inflearn.com/dist/css/npm_tinymce.5af73b610bbc53450dc2.css">
  <link rel="stylesheet" href="https://cdn.inflearn.com/dist/css/MAIN.289eced6cb0f700b78e5.css">
  <link rel="stylesheet" href="https://cdn.inflearn.com/dist/vendor/bulma-accordion.min.css">
  <link rel="stylesheet" href="https://cdn.inflearn.com/dist/vendor/bulma-switch.min.css">
  <link rel="stylesheet" href="https://cdn.inflearn.com/dist/vendor/bulma-tooltip.min.css">
  <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.12.0/css/all.css" 
  integrity="sha384-ekOryaXPbeCpWQNxMwSWVvQ0+1VrStoPJq54shlYhR8HzQgig1v5fas6YgOqLoKz" crossorigin="anonymous">
  
  <script type="text/javascript" src="https://cdn.inflearn.com/dist/js/legacy/polyfills.b2c7dbe8be012f7f63b3.js" nomodule=""></script>
  <script type="text/javascript" src="https://unpkg.com/element-closest/browser" nomodule=""></script>
  
<script async="" src="https://script.hotjar.com/modules.1d53583a279bcbaf1042.js" charset="utf-8"></script>
<style type="text/css">iframe#_hjRemoteVarsFrame {display: none !important; width: 1px !important; height: 1px !important; opacity: 0 !important; pointer-events: none !important;}</style>

<meta name="mobile-web-app-capable" content="yes">
<meta name="x5-page-mode" content="app"><meta name="browsermode" content="application"></head>
  <body id="inflearn" class="lecture" >
  
    <div id="root">
      <main id="main">
      
<!-- 강좌정보 어사이드 -->      
<section class="lecture_container">
  <a class="toggle_left is-hidden-tablet"><svg width="16" aria-hidden="true" data-prefix="fal" data-icon="times" class="svg-inline--fa fa-times fa-w-10" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512"><path fill="currentColor" d="M193.94 256L296.5 153.44l21.15-21.15c3.12-3.12 3.12-8.19 0-11.31l-22.63-22.63c-3.12-3.12-8.19-3.12-11.31 0L160 222.06 36.29 98.34c-3.12-3.12-8.19-3.12-11.31 0L2.34 120.97c-3.12 3.12-3.12 8.19 0 11.31L126.06 256 2.34 379.71c-3.12 3.12-3.12 8.19 0 11.31l22.63 22.63c3.12 3.12 8.19 3.12 11.31 0L160 289.94 262.56 392.5l21.15 21.15c3.12 3.12 8.19 3.12 11.31 0l22.63-22.63c3.12-3.12 3.12-8.19 0-11.31L193.94 256z"></path></svg></a>
  <aside class="lecture_nav lecture_nav_left opened">
    <div class="lecture_nav_left_header">
      <h5>git과 github</h5>
      <p><span class="is-bold">기간:</span> 무제한</p>
      <div class="progress_container">
        
  <div class="inf_progress">
    <label>진도율 : 5강/14강 (35.71%) | 시간 : 65분/143분</label>
    <progress class="progress is-primary" value="35.71" max="100">35.71%</progress>
  </div>
      </div>
    </div>
    <div class="curriculum">
<ul>
  <li class="list unit unit_section  
      " fxd-data="{&quot;id&quot;:14170,&quot;preview&quot;:false}">
    <span class="list-item unit_title">git 입문</span>
    
  </li>
  <li class="list unit unit_lecture is_checked 
      " fxd-data="{&quot;id&quot;:14171,&quot;preview&quot;:true}">
    <span class="list-item unit_title">소스트리 사용해 보기</span>
    
    <span class="unit_checked icon">
    <svg width="16" aria-hidden="true" data-prefix="fas" data-icon="check-circle" class="svg-inline--fa fa-check-circle fa-w-16" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M504 256c0 136.967-111.033 248-248 248S8 392.967 8 256 119.033 8 256 8s248 111.033 248 248zM227.314 387.314l184-184c6.248-6.248 6.248-16.379 0-22.627l-22.627-22.627c-6.248-6.249-16.379-6.249-22.628 0L216 308.118l-70.059-70.059c-6.248-6.248-16.379-6.248-22.628 0l-22.627 22.627c-6.248 6.248-6.248 16.379 0 22.627l104 104c6.249 6.249 16.379 6.249 22.628.001z"></path></svg></span>
  </li>
  <li class="list unit unit_lecture is_checked 
      " fxd-data="{&quot;id&quot;:14172,&quot;preview&quot;:true}">
    <span class="list-item unit_title">변경사항 취소하기</span>
    
    <span class="unit_checked icon"><svg width="16" aria-hidden="true" data-prefix="fas" data-icon="check-circle" class="svg-inline--fa fa-check-circle fa-w-16" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M504 256c0 136.967-111.033 248-248 248S8 392.967 8 256 119.033 8 256 8s248 111.033 248 248zM227.314 387.314l184-184c6.248-6.248 6.248-16.379 0-22.627l-22.627-22.627c-6.248-6.249-16.379-6.249-22.628 0L216 308.118l-70.059-70.059c-6.248-6.248-16.379-6.248-22.628 0l-22.627 22.627c-6.248 6.248-6.248 16.379 0 22.627l104 104c6.249 6.249 16.379 6.249 22.628.001z"></path></svg></span>
  </li>
  <li class="list unit unit_lecture is_checked 
      " fxd-data="{&quot;id&quot;:14173,&quot;preview&quot;:true}">
    <span class="list-item unit_title">브랜치의 개념</span>
    
    <span class="unit_checked icon"><svg width="16" aria-hidden="true" data-prefix="fas" data-icon="check-circle" class="svg-inline--fa fa-check-circle fa-w-16" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M504 256c0 136.967-111.033 248-248 248S8 392.967 8 256 119.033 8 256 8s248 111.033 248 248zM227.314 387.314l184-184c6.248-6.248 6.248-16.379 0-22.627l-22.627-22.627c-6.248-6.249-16.379-6.249-22.628 0L216 308.118l-70.059-70.059c-6.248-6.248-16.379-6.248-22.628 0l-22.627 22.627c-6.248 6.248-6.248 16.379 0 22.627l104 104c6.249 6.249 16.379 6.249 22.628.001z"></path></svg></span>
  </li>
  <li class="list unit unit_lecture is_checked 
      " fxd-data="{&quot;id&quot;:14174,&quot;preview&quot;:true}">
    <span class="list-item unit_title">병합(merge) 살펴보기</span>
    
    <span class="unit_checked icon"><svg width="16" aria-hidden="true" data-prefix="fas" data-icon="check-circle" class="svg-inline--fa fa-check-circle fa-w-16" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M504 256c0 136.967-111.033 248-248 248S8 392.967 8 256 119.033 8 256 8s248 111.033 248 248zM227.314 387.314l184-184c6.248-6.248 6.248-16.379 0-22.627l-22.627-22.627c-6.248-6.249-16.379-6.249-22.628 0L216 308.118l-70.059-70.059c-6.248-6.248-16.379-6.248-22.628 0l-22.627 22.627c-6.248 6.248-6.248 16.379 0 22.627l104 104c6.249 6.249 16.379 6.249 22.628.001z"></path></svg></span>
  </li>
  <li class="list unit unit_lecture is_checked is_now
      " fxd-data="{&quot;id&quot;:14175,&quot;preview&quot;:false}">
    <span class="list-item unit_title">pull 및 충돌 해결하기</span>
    
    <span class="unit_checked icon"><svg width="16" aria-hidden="true" data-prefix="fas" data-icon="check-circle" class="svg-inline--fa fa-check-circle fa-w-16" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M504 256c0 136.967-111.033 248-248 248S8 392.967 8 256 119.033 8 256 8s248 111.033 248 248zM227.314 387.314l184-184c6.248-6.248 6.248-16.379 0-22.627l-22.627-22.627c-6.248-6.249-16.379-6.249-22.628 0L216 308.118l-70.059-70.059c-6.248-6.248-16.379-6.248-22.628 0l-22.627 22.627c-6.248 6.248-6.248 16.379 0 22.627l104 104c6.249 6.249 16.379 6.249 22.628.001z"></path></svg></span>
  </li>
  <li class="list unit unit_lecture  
      " fxd-data="{&quot;id&quot;:14176,&quot;preview&quot;:false}">
    <span class="list-item unit_title">reset을 이용한 커밋 되돌리기</span>
    
    <span class="unit_checked icon"><svg width="16" aria-hidden="true" data-prefix="fas" data-icon="check-circle" class="svg-inline--fa fa-check-circle fa-w-16" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M504 256c0 136.967-111.033 248-248 248S8 392.967 8 256 119.033 8 256 8s248 111.033 248 248zM227.314 387.314l184-184c6.248-6.248 6.248-16.379 0-22.627l-22.627-22.627c-6.248-6.249-16.379-6.249-22.628 0L216 308.118l-70.059-70.059c-6.248-6.248-16.379-6.248-22.628 0l-22.627 22.627c-6.248 6.248-6.248 16.379 0 22.627l104 104c6.249 6.249 16.379 6.249 22.628.001z"></path></svg></span>
  </li>
  <li class="list unit unit_lecture  
      " fxd-data="{&quot;id&quot;:14177,&quot;preview&quot;:false}">
    <span class="list-item unit_title">브랜치를 만들어서 커밋 되돌리기</span>
    
    <span class="unit_checked icon"><svg width="16" aria-hidden="true" data-prefix="fas" data-icon="check-circle" class="svg-inline--fa fa-check-circle fa-w-16" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M504 256c0 136.967-111.033 248-248 248S8 392.967 8 256 119.033 8 256 8s248 111.033 248 248zM227.314 387.314l184-184c6.248-6.248 6.248-16.379 0-22.627l-22.627-22.627c-6.248-6.249-16.379-6.249-22.628 0L216 308.118l-70.059-70.059c-6.248-6.248-16.379-6.248-22.628 0l-22.627 22.627c-6.248 6.248-6.248 16.379 0 22.627l104 104c6.249 6.249 16.379 6.249 22.628.001z"></path></svg></span>
  </li>
  <li class="list unit unit_lecture  
      " fxd-data="{&quot;id&quot;:14178,&quot;preview&quot;:false}">
    <span class="list-item unit_title">Revert를 사용해 커밋 되돌리기</span>
    
    <span class="unit_checked icon"><svg width="16" aria-hidden="true" data-prefix="fas" data-icon="check-circle" class="svg-inline--fa fa-check-circle fa-w-16" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M504 256c0 136.967-111.033 248-248 248S8 392.967 8 256 119.033 8 256 8s248 111.033 248 248zM227.314 387.314l184-184c6.248-6.248 6.248-16.379 0-22.627l-22.627-22.627c-6.248-6.249-16.379-6.249-22.628 0L216 308.118l-70.059-70.059c-6.248-6.248-16.379-6.248-22.628 0l-22.627 22.627c-6.248 6.248-6.248 16.379 0 22.627l104 104c6.249 6.249 16.379 6.249 22.628.001z"></path></svg></span>
  </li>
  <li class="list unit unit_lecture  
      " fxd-data="{&quot;id&quot;:14179,&quot;preview&quot;:false}">
    <span class="list-item unit_title">revert로 여러 커밋 되돌리기</span>
    
    <span class="unit_checked icon"><svg width="16" aria-hidden="true" data-prefix="fas" data-icon="check-circle" class="svg-inline--fa fa-check-circle fa-w-16" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M504 256c0 136.967-111.033 248-248 248S8 392.967 8 256 119.033 8 256 8s248 111.033 248 248zM227.314 387.314l184-184c6.248-6.248 6.248-16.379 0-22.627l-22.627-22.627c-6.248-6.249-16.379-6.249-22.628 0L216 308.118l-70.059-70.059c-6.248-6.248-16.379-6.248-22.628 0l-22.627 22.627c-6.248 6.248-6.248 16.379 0 22.627l104 104c6.249 6.249 16.379 6.249 22.628.001z"></path></svg></span>
  </li>
  <li class="list unit unit_lecture  
      " fxd-data="{&quot;id&quot;:14180,&quot;preview&quot;:false}">
    <span class="list-item unit_title">브랜치와 스태시</span>
    
    <span class="unit_checked icon"><svg width="16" aria-hidden="true" data-prefix="fas" data-icon="check-circle" class="svg-inline--fa fa-check-circle fa-w-16" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M504 256c0 136.967-111.033 248-248 248S8 392.967 8 256 119.033 8 256 8s248 111.033 248 248zM227.314 387.314l184-184c6.248-6.248 6.248-16.379 0-22.627l-22.627-22.627c-6.248-6.249-16.379-6.249-22.628 0L216 308.118l-70.059-70.059c-6.248-6.248-16.379-6.248-22.628 0l-22.627 22.627c-6.248 6.248-6.248 16.379 0 22.627l104 104c6.249 6.249 16.379 6.249 22.628.001z"></path></svg></span>
  </li>
  <li class="list unit unit_lecture  
      " fxd-data="{&quot;id&quot;:14181,&quot;preview&quot;:false}">
    <span class="list-item unit_title">rebase로 병합하기</span>
    
    <span class="unit_checked icon"><svg width="16" aria-hidden="true" data-prefix="fas" data-icon="check-circle" class="svg-inline--fa fa-check-circle fa-w-16" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M504 256c0 136.967-111.033 248-248 248S8 392.967 8 256 119.033 8 256 8s248 111.033 248 248zM227.314 387.314l184-184c6.248-6.248 6.248-16.379 0-22.627l-22.627-22.627c-6.248-6.249-16.379-6.249-22.628 0L216 308.118l-70.059-70.059c-6.248-6.248-16.379-6.248-22.628 0l-22.627 22.627c-6.248 6.248-6.248 16.379 0 22.627l104 104c6.249 6.249 16.379 6.249 22.628.001z"></path></svg></span>
  </li>
  <li class="list unit unit_lecture  
      " fxd-data="{&quot;id&quot;:14182,&quot;preview&quot;:true}">
    <span class="list-item unit_title">기타 주의 사항</span>
    
    <span class="unit_checked icon"><svg width="16" aria-hidden="true" data-prefix="fas" data-icon="check-circle" class="svg-inline--fa fa-check-circle fa-w-16" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M504 256c0 136.967-111.033 248-248 248S8 392.967 8 256 119.033 8 256 8s248 111.033 248 248zM227.314 387.314l184-184c6.248-6.248 6.248-16.379 0-22.627l-22.627-22.627c-6.248-6.249-16.379-6.249-22.628 0L216 308.118l-70.059-70.059c-6.248-6.248-16.379-6.248-22.628 0l-22.627 22.627c-6.248 6.248-6.248 16.379 0 22.627l104 104c6.249 6.249 16.379 6.249 22.628.001z"></path></svg></span>
  </li>
  <li class="list unit unit_lecture  
      " fxd-data="{&quot;id&quot;:14183,&quot;preview&quot;:true}">
    <span class="list-item unit_title">혼깃 요약</span>
    
    <span class="unit_checked icon"><svg width="16" aria-hidden="true" data-prefix="fas" data-icon="check-circle" class="svg-inline--fa fa-check-circle fa-w-16" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M504 256c0 136.967-111.033 248-248 248S8 392.967 8 256 119.033 8 256 8s248 111.033 248 248zM227.314 387.314l184-184c6.248-6.248 6.248-16.379 0-22.627l-22.627-22.627c-6.248-6.249-16.379-6.249-22.628 0L216 308.118l-70.059-70.059c-6.248-6.248-16.379-6.248-22.628 0l-22.627 22.627c-6.248 6.248-6.248 16.379 0 22.627l104 104c6.249 6.249 16.379 6.249 22.628.001z"></path></svg></span>
  </li>
  <li class="list unit unit_lecture  
      " fxd-data="{&quot;id&quot;:14184,&quot;preview&quot;:false}">
    <span class="list-item unit_title">보너스: revert로 한 커밋 되돌리기</span>
    
    <span class="unit_checked icon"><svg width="16" aria-hidden="true" data-prefix="fas" data-icon="check-circle" class="svg-inline--fa fa-check-circle fa-w-16" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M504 256c0 136.967-111.033 248-248 248S8 392.967 8 256 119.033 8 256 8s248 111.033 248 248zM227.314 387.314l184-184c6.248-6.248 6.248-16.379 0-22.627l-22.627-22.627c-6.248-6.249-16.379-6.249-22.628 0L216 308.118l-70.059-70.059c-6.248-6.248-16.379-6.248-22.628 0l-22.627 22.627c-6.248 6.248-6.248 16.379 0 22.627l104 104c6.249 6.249 16.379 6.249 22.628.001z"></path></svg></span>
  </li>
</ul></div>
  </aside>
  <!-- 강좌정보 어사이드 --> 
  
  <div class="content_container center">
     
  
<!-- 헤더 --> 
<header class="content_header_nav" fxd-data="{&quot;course_id&quot;:194516,&quot;unit_id&quot;:14175}">
  <div class="toggle_left">
  <a class="button is-outlined is-inverted is-link">
  <svg width="16" aria-hidden="true" data-prefix="fal" data-icon="times" class="svg-inline--fa fa-times fa-w-10" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512">
  <path fill="currentColor" d="M193.94 256L296.5 153.44l21.15-21.15c3.12-3.12 3.12-8.19 0-11.31l-22.63-22.63c-3.12-3.12-8.19-3.12-11.31 0L160 222.06 36.29 98.34c-3.12-3.12-8.19-3.12-11.31 0L2.34 120.97c-3.12 3.12-3.12 8.19 0 11.31L126.06 256 2.34 379.71c-3.12 3.12-3.12 8.19 0 11.31l22.63 22.63c3.12 3.12 8.19 3.12 11.31 0L160 289.94 262.56 392.5l21.15 21.15c3.12 3.12 8.19 3.12 11.31 0l22.63-22.63c3.12-3.12 3.12-8.19 0-11.31L193.94 256z"></path></svg>

  </a></div>
  <div class="unit_title">
  <h1>pull 및 충돌 해결하기</h1></div>
  
  <div class="right_buttons">  
    <button class="button is-link review_modal">
      <span><i class="far fa-star"></i></span>
      <span class="is-hidden-touch">수강평 작성해주세요!</span>
    </button>
    <button class="button go_out_course is-outlined is-inverted is-link">
      <span><i class="fal fa-external-link"></i></span>
      <span class="is-hidden-touch">나가기</span>
    </button>
    <button class="button toggle_right is-outlined is-inverted is-link">
      <span><i class="far fa-question-circle"></i></span>
      <span class="is-hidden-touch">질문하기</span>
    </button>
  </div>
</header>
<!-- 헤더 -->

<!-- 컨텐츠바디 -->
<div class="content unit_body">
  <div class="player_cover">
  <div class="video_container">
    
  </div>
  <!-- 강의 컨테이너 -->
  <div class="note_container"> 
  <!-- 아이프레임 -->
  <div class="iframe_container" style="padding:56.23229461756374% 0 0 0; position: relative;">
  
  <iframe width="100%" height="100%" 
  src="https://www.youtube.com/embed/60ctvQsY7ws?rel=0&amp;modestbranding=1&amp;vq=hd720&amp;autoplay=1&amp;enablejsapi=1" 
  frameborder="0" allow="autoplay; encrypted-media" allowfullscreen="allowfullscreen" 
  style="position: absolute; top: 0px; bottom: 0px; left: 0px; right: 0px; height: 100%; width: 100%;" 
  data-gtm-yt-inspected-8964582_7="true" id="212470628">
  </iframe>
  
  </div> 
  <!-- 아이프레임 -->
  
<h2 id="-">오늘의 요약</h2>
<ul>
 	<li>충돌은 자동병합 실패시 발생</li>
 	<li>겁먹지 말고 걱정하지 말고 충돌해결하자.</li>
 	<li>실패하면 다시하면 된다!</li>
</ul>
<h2 id="-">안 쓰는 브랜치 삭제하기</h2>
<ul>
 	<li>현재 브랜치(HEAD) 가 아닌 경우 간단하게 삭제 가능</li>
 	<li>브랜치를 삭제했을 경우 사라지는 커밋이 있는지 없는지 확인하자!</li>
</ul>
<h2 id="git-pull">git pull</h2>
<ul>
 	<li>서버의 내용이 최신일 경우 pull을 적용한다.</li>
 	<li>충돌이 날 수 있지만 놀라지 말자.</li>
 	<li>pull = fetch + merge</li>
</ul>
<h2 id="-">충돌의 발생원인</h2>
<ul>
 	<li>자동병합을 실패했을 경우 발생</li>
 	<li>주로 두 커밋이 같은 파일을 편집했을 경우 발생</li>
</ul>
<h2 id="-">일반적인 해결 방법</h2>
<ul>
 	<li>에디터를 이용한 해결</li>
 	<li>병합툴을 이용한 해결</li>
 	<li>sourceTree를 이용한 해결</li>
</ul>
<h2 id="-">에디터를 사용한 해결</h2>
"겁 먹지 말고" 충돌난 파일을 꼼꼼히 읽어가며 수동으로 수정한다.
<h2 id="-">내것 또는 저장소 것 선택하기</h2>
<ul>
 	<li>혼자서 작업할 경우 일반적으로 두 변경사항 중 하나(주로 내 것)가 최신이고 정답일 가능성이 높다.</li>
</ul>
<h2 id="-">충돌을 해결했는데 이상해졌다면</h2>
<ul>
 	<li>reset을 이용해 되돌리기 시전!</li>
 	<li>다음 시간에 만나요!</li>
</ul>
&nbsp;</div>
  </div>
</div>

<!-- 푸터 -->
<footer class="content_footer_nav navbar">
  <div class="navbar-item is-hidden-mobile toggle_right">
    <button class="button is-primary is-inverted is_no_border is-outlined">
    <svg width="16" aria-hidden="true" data-prefix="far" data-icon="question-circle" class="svg-inline--fa fa-question-circle fa-w-16" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
    <path fill="currentColor" d="M256 8C119.043 8 8 119.083 8 256c0 136.997 111.043 248 248 248s248-111.003 248-248C504 119.083 392.957 8 256 8zm0 448c-110.532 0-200-89.431-200-200 0-110.495 89.472-200 200-200 110.491 0 200 89.471 200 200 0 110.53-89.431 200-200 200zm107.244-255.2c0 67.052-72.421 68.084-72.421 92.863V300c0 6.627-5.373 12-12 12h-45.647c-6.627 0-12-5.373-12-12v-8.659c0-35.745 27.1-50.034 47.579-61.516 17.561-9.845 28.324-16.541 28.324-29.579 0-17.246-21.999-28.693-39.784-28.693-23.189 0-33.894 10.977-48.942 29.969-4.057 5.12-11.46 6.071-16.666 2.124l-27.824-21.098c-5.107-3.872-6.251-11.066-2.644-16.363C184.846 131.491 214.94 112 261.794 112c49.071 0 101.45 38.304 101.45 88.8zM298 368c0 23.159-18.841 42-42 42s-42-18.841-42-42 18.841-42 42-42 42 18.841 42 42z">
    </path></svg> 
    질문하기</button>
  </div>
  <div class="navbar-item">
    <button class="button is-link is-inverted is-outlined is_no_border is_completed">
    <svg width="16" aria-hidden="true" data-prefix="far" data-icon="check" class="svg-inline--fa fa-check fa-w-16" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M435.848 83.466L172.804 346.51l-96.652-96.652c-4.686-4.686-12.284-4.686-16.971 0l-28.284 28.284c-4.686 4.686-4.686 12.284 0 16.971l133.421 133.421c4.686 4.686 12.284 4.686 16.971 0l299.813-299.813c4.686-4.686 4.686-12.284 0-16.971l-28.284-28.284c-4.686-4.686-12.284-4.686-16.97 0z"></path></svg></button></div>
  <div class="navbar-item">
  <button class="button is-link is-inverted is-outlined is_no_border next_unit">
  <svg width="16" aria-hidden="true" data-prefix="far" data-icon="step-forward" class="svg-inline--fa fa-step-forward fa-w-14" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path fill="currentColor" d="M372 32h-24c-6.6 0-12 5.4-12 12v183L116.5 39.4C95.9 22.3 64 36.6 64 64v384c0 27.4 31.9 41.8 52.5 24.6L336 283.9V468c0 6.6 5.4 12 12 12h24c6.6 0 12-5.4 12-12V44c0-6.6-5.4-12-12-12zM112 413.5V98.4l186.7 157.1-186.7 158z">
  </path></svg> 
  다음강의</button></div>
</footer>
<!-- 푸터 -->

</div>


  <aside>
    <div class="lecture_nav lecture_nav_right post_list">
      <div class="right_header">
        <a class="toggle_right">
        <svg width="16" aria-hidden="true" data-prefix="fal" data-icon="times" class="svg-inline--fa fa-times fa-w-10" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512"><path fill="currentColor" d="M193.94 256L296.5 153.44l21.15-21.15c3.12-3.12 3.12-8.19 0-11.31l-22.63-22.63c-3.12-3.12-8.19-3.12-11.31 0L160 222.06 36.29 98.34c-3.12-3.12-8.19-3.12-11.31 0L2.34 120.97c-3.12 3.12-3.12 8.19 0 11.31L126.06 256 2.34 379.71c-3.12 3.12-3.12 8.19 0 11.31l22.63 22.63c3.12 3.12 8.19 3.12 11.31 0L160 289.94 262.56 392.5l21.15 21.15c3.12 3.12 8.19 3.12 11.31 0l22.63-22.63c3.12-3.12 3.12-8.19 0-11.31L193.94 256z">
        </path>
        </svg>
        </a>
        
        <h3>질문 게시판</h3>
        <div class="post_editor">
          
  <div class="search search_bar search_question">
    <input type="text" class="input" placeholder="질문검색">
    <i class="far fa-search"></i>
  </div>
          <div class="buttons">
            <button class="button" fxd-data="{&quot;target&quot;:&quot;question&quot;}">질문하기</button>
          </div>
          <div class="editor">
          </div>
        </div>
      </div>
      <div class="unit_post_list"><ul></ul></div>
    </div>
    <div class="lecture_nav lecture_nav_right post_item">
      <div class="right_header">
        <a class="toggle_right">
        <svg width="16" aria-hidden="true" data-prefix="fal" data-icon="times" class="svg-inline--fa fa-times fa-w-10" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512"><path fill="currentColor" d="M193.94 256L296.5 153.44l21.15-21.15c3.12-3.12 3.12-8.19 0-11.31l-22.63-22.63c-3.12-3.12-8.19-3.12-11.31 0L160 222.06 36.29 98.34c-3.12-3.12-8.19-3.12-11.31 0L2.34 120.97c-3.12 3.12-3.12 8.19 0 11.31L126.06 256 2.34 379.71c-3.12 3.12-3.12 8.19 0 11.31l22.63 22.63c3.12 3.12 8.19 3.12 11.31 0L160 289.94 262.56 392.5l21.15 21.15c3.12 3.12 8.19 3.12 11.31 0l22.63-22.63c3.12-3.12 3.12-8.19 0-11.31L193.94 256z">
        </path></svg></a>
        <a class="back_right">
        <svg width="16" aria-hidden="true" data-prefix="far" data-icon="arrow-to-left" class="svg-inline--fa fa-arrow-to-left fa-w-14" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path fill="currentColor" d="M247.9 412.5l-148.4-148c-4.7-4.7-4.7-12.3 0-17l148.4-148c4.7-4.7 12.3-4.7 17 0l19.6 19.6c4.8 4.8 4.7 12.5-.2 17.1L187.2 230H436c6.6 0 12 5.4 12 12v28c0 6.6-5.4 12-12 12H187.2l97.1 93.7c4.8 4.7 4.9 12.4.2 17.1l-19.6 19.6c-4.7 4.8-12.3 4.8-17 .1zM52 436V76c0-6.6-5.4-12-12-12H12C5.4 64 0 69.4 0 76v360c0 6.6 5.4 12 12 12h28c6.6 0 12-5.4 12-12z">
        </path></svg></a>
        <h4>질문 상세</h4>
      </div>
      <div class="post_container box"></div>
    </div>
  </aside>
</section></main>
    </div> <!-- root끝 -->
    
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
  $(".is-link").click(function(){
    $("aside").toggle();
    $(".content_container").css({"padding-left": "0"});
  });
});
</script>

</body>

</html>