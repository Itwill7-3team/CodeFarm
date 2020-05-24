<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- https://channel.io 
	joygajoy22@gmail.com
	sua1208
-->

<!-- Channel Plugin Scripts -->
<script>
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var d = window.document;
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "5d9693cd-a636-4fc4-ae9c-264858e7b59b"
  });
</script>
<!-- End Channel Plugin -->



<!--해피톡 <script>
    window.__ht_wc = window.__ht_wc || {};
    window.__ht_wc.host = 'design.happytalkio.com';
    window.__ht_wc.site_id = '4000001455'; // site_id
    window.__ht_wc.site_name = 'CodingFarm'; // 회사 이름
    window.__ht_wc.category_id = '116716'; // 대분류 id
    window.__ht_wc.division_id = '116717'; // 중분류 id
    // 고정 및 Custom 파라미터 추가 영역, 파라미터가 여러개인 경우 ,(콤마)로 구분
    // window.__ht_wc.params = 'site_uid=abcd1234,parameter1=param1';
    
    (function() {
        var ht = document.createElement('script');
        ht.type = 'text/javascript';
        ht.async = true;
        ht.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + window.__ht_wc.host + '/web_chatting/tracking.js';
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(ht, s);
    })();
</script> -->
</body>
</html>