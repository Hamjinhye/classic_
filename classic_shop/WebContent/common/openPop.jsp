<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CLASSIC HOT ISSUE!</title>
<!-- jQuery lib -->
<script src='/classic_shop/public/js/jquery/jquery-3.2.1.min.js'></script>
<script src='/classic_shop/public/js/jquery-ui/jquery-ui.min.js'></script>
</head>
<body>
	<div id="bannerPage">
		<div id="bannerInner">
			<p>${banner.num}</p>
			<p>${banner.name}</p>
			<p>${banner.content}</p>
			<p>${banner.state}</p>
		</div>
		<div>
			<input type="checkbox" id="popClose" name="popClose" value="on" onchange="javacript:todayClose(this.value)">
			<label for="popClose">오늘 하루동안 이 창을 열지 않기</label>
		</div>
	</div>
<script>

	function getCookie(cookieName){
		var name = cookieName+"=";
		var x = 0;
		while(x<=document.cookie.length){
			var y = (x+name.length);
			if(document.cookie.substring(x,y)==name){
				if((endName=document.cookie.indexOf(";",y))==-1) endName = document.cookie.length;
				return unescape(document.cookie.substring(y, endName));
			}
			x = document.cookie.indexOf(" ", x)+1;
			if(x==0) break;
		}
		return "";
	}
	function todayClose(){
		var checked = document.querySelector('#popClose:checked');
		if(checked != null && checked.value=='on'){
			var now = new Date();
			now.setTime(now.setTime()+(1000*60*60*24*1));
			document.cookie = 'popup=off; path=/; expires='+ now.toUTCString()+';';
			window.close();
		}
		window.close();
	}
</script>
</body>
</html>