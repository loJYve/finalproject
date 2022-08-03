<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    ﻿<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">﻿
<!DOCTYPE html>
<<<<<<< HEAD
<html>
<head>
<meta charset="UTF-8">
<title>BJSCAR</title>
</head>
<body>
	<h1>header</h1>
</body>
=======
<html lang="en">
<header>
	<nav>
			<ul class="clearfix">
				<li class="main"><a class="btn btn-primary" href="<%=request.getContextPath()%>/main.do">bjscar</a></li>
				<li class="menu">1st menu
						<ul>
							<li>2nd menu</li>
							<li>2nd menu</li>
						</ul>
				</li>
				<li class="menu">1st menu
						<ul>
							<li>2nd menu</li>
							<li>2nd menu</li>
							<li>2nd menu</li>
							<li>2nd menu</li>
						</ul>
				</li>
				<li class="menu">1st menu
						<ul>
							<li>2nd menu</li>
							<li>2nd menu</li>
						</ul>
				</li>
				<li class="menu">1st menu
						<ul>
							<li>2nd menu</li>
							<li>2nd menu</li>
							<li>2nd menu</li>
						</ul>
				</li>
				<ul class="login">
					<button class="login">로그인</button>
				</ul>				
			</ul>
	</nav>
</header>
<style>
a{
	text-decoration: none;
	color:black;
}
html,body{
  height:100%;
}
body{
  text-align:center;
}
body:before{
  content:'';
  height:100%;
  display:inline-block;
  vertical-align:middle;
}
button{
  margin-top:10px;
  background:cornflowerblue;
  color:#fff;
  border:none;
  position:relative;
  height:40px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
button:hover{
  background:#fff;
  color:#1AAB8A;
}
button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}
​
​
.menu{
	text-align:center;
}
.main{
	font-weight:bolder;
	font-size:larger;
	margin-right:200px;
}
* {margin:0; padding:0;}
ul li {list-style:none;}
.clearfix:after{content:'';display:block; clear:both;}

body {background:white; overflow-y:scroll;padding-top:100px;}

header {	
	margin-top:20px;
	background:linear-gradient(white 50px, rgba(255,255,255,0.8) 50px, rgba(255,255,255,0.8) );
		height:50px;
		overflow:hidden;
	position:absolute;
	left:0; right:0;
	top:0;
}


nav {width:960px; margin:0 auto;}
nav > ul > li {float:left; line-height:50px; margin-right:40px;}
nav > ul > li ul{ width:100%;}

main p{
	margin-bottom:27px;
}
</style>
<script>
$(function(){
	var $firstMenu = $(".menu"),
			$header = $('header');
	
	$firstMenu.mouseenter(function(){
		$header.stop().animate({height:'300px'});
	})
	.mouseleave(function(){
		$header.stop().animate({height:'50px'});
	});
	
	
	
});
</script>
>>>>>>> branch 'main' of https://github.com/loJYve/finalproject.git
</html>