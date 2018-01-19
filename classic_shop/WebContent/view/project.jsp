<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- awesome Icon -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- kakao 지도 api -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9634cbc392b8b80779d4f419ee72bf3a"></script>
</head>
<body>
<div class="map_body">
	<div class="container">
		<div class="company_project">
			<h2><i>CLASSIC</i></h2>
		</div>
		<div class="company_project" style="padding-left: 20px;">
			<table>
				<tbody>
					<tr>
						<th class="table_title" style="color: #de3131cf; text-align: left;"><small><i>PROJECT INFO</i></small></th>
						<td></td>
						<th class="table_title" style="color: #de3131cf; text-align: left;"><small><i>TEAM INFO</i></small></th>
						<td></td>
					</tr>
					<tr>
						<th class="table_title"><small>PROJECT NAME</small></th>
						<td class="table_content">의류 쇼핑몰 사이트 구축 프로젝트</td>
						<th class="table_title"><small>LEADER</small></th>
						<td class="table_content">김주연 | 맡은 역할</td>
						<td class="table_content"><small style="color: #777;">E-Mail</small> juyeon1203@gmail.com</td>
						<td><i class="fa fa-envelope"></i></td>
					</tr>
					<tr>
						<th class="table_title"><small>DEVELOP PERIOD</small></th>
						<td class="table_content">2017.12.18 ~ 2018.01</td>
						<th class="table_title"><small>TEAM</small></th>
						<td class="table_content">곽은경 | 맡은 역할</td>
						<td class="table_content"><small style="color: #777;">E-Mail</small> iamgwak89@gmail.com</td>
						<td><i class="fa fa-envelope"></i></td>
					</tr>
					<tr>
						<th class="table_title"><small>GitHub ADDRESS</small></th>
						<td class="table_content"><a href="javascript:gitLink();">https://github.com/juuuu6/classic_</a></td>
						<th></th>
						<td class="table_content">김다혜 | 맡은 역할</td>
						<td class="table_content"><small style="color: #777;">E-Mail</small> da5870@nate.com</td>
						<td><i class="fa fa-envelope"></i></td>
					</tr>
					<tr>
						<th></th>
						<td class="table_content"><a href="javascript:gitLink();">https://github.com/juuuu6/classic_admin</a></td>
						<th></th>
						<td class="table_content">함혜진 | 맡은 역할</td>
						<td class="table_content"><small style="color: #777;">E-Mail</small> hammi0213@gmail.com</td>
						<td><i class="fa fa-envelope"></i></td>
					</tr>
					<tr>
						<th></th>
						<td><i class="fa fa-download"><small>  Project PPT download</small></i></td>
						<th></th>
						<td class="table_content">김경미 | 맡은 역할</td>
						<td class="table_content"><small style="color: #777;">E-Mail</small> gyeongmi12268@gmail.com</td>
						<td><i class="fa fa-envelope"></i></td>
					</tr>
					<tr>
						<th></th>
						<td><i class="fa fa-link"></i><small>  Location in CLASSIC_ADMIN SITE</small></td>
						<th></th>
						<td class="table_content">송유정 | 맡은 역할</td>
						<td class="table_content"><small style="color: #777;">E-Mail</small> kkokrkeka@gmail.com</td>
						<td><i class="fa fa-envelope"></i></td>
					</tr>
					<tr>
						<th></th>
						<td></td>
						<th></th>
						<td class="table_content">김혜선 | 맡은 역할</td>
						<td class="table_content"><small style="color: #777;">E-Mail</small> mmmmm1544@gmail.com</td>
						<td><i class="fa fa-envelope"></i></td>
					</tr>
					<tr>
						<th class="table_title" style="color: #de3131cf; text-align: left;"><small><i>USER <br>Development Environment</i></small></th>
						<td></td>
						<th class="table_title" style="color: #de3131cf; text-align: left;"><small><i>ADMIN <br>Development Environment</i></small></th>
						<td></td>
					</tr>
					<tr>
						<th class="table_title"><small>OS</small></th>
						<td class="table_content">Window 7</td>
						<th class="table_title"><small>OS</small></th>
						<td class="table_content">Window 7</td>
					</tr>
					<tr>
						<th class="table_title"><small>Server</small></th>
						<td class="table_content">Apache Tomcat 8.5</td>
						<th class="table_title"><small>Server</small></th>
						<td class="table_content">Apache Tomcat 8.5</td>
					</tr>
					<tr>
						<th class="table_title"><small>DataBase</small></th>
						<td class="table_content">Oracle 11g XE</td>
						<th class="table_title"><small>DataBase</small></th>
						<td class="table_content">Oracle 11g XE</td>
					</tr>
					<tr>
						<th class="table_title"><small>Tools</small></th>
						<td class="table_content">Eclipse</td>
						<th class="table_title"><small>Tools</small></th>
						<td class="table_content">STS</td>
					</tr>
					<tr>
						<th class="table_title"><small>Library</small></th>
						<td class="table_content">JDK 1.8 / ojdbc6 / jstl-1.2</td>
						<th class="table_title"><small>Library</small></th>
						<td class="table_content"> MyBatis / JDK 1.8 / ojdbc6 / jstl-1.2</td>
					</tr>
					<tr>
						<th class="table_title"><small>Back-Language</small></th>
						<td class="table_content">JAVA / JSP</td>
						<th class="table_title"><small>Back-Language</small></th>
						<td class="table_content">JAVA / Spring</td>
					</tr>
					<tr>
						<th class="table_title"><small>Front-Language</small></th>
						<td class="table_content">HTML5 / CSS / Bootstrap3 / jQuery-UI</td>
						<th class="table_title"><small>Front-Language</small></th>
						<td class="table_content">HTML5 / CSS / Bootstrap4 / jQuery-UI</td>
					</tr>
					<tr>
						<th></th>
						<td class="table_content">JavaScript / JSON / jQuery / AJAX</td>
						<th></th>
						<td class="table_content">JavaScript / JSON / jQuery / AJAX</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script>
	var gitLink = function(){
		window.open('https://github.com/juuuu6/classic_','_blank');
	}
</script>
