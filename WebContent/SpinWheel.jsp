<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
		*{
			box-sizing: border-box;
			padding: 0;
			margin: 0;
			outline: none;
		}
		body{
			font-family: Open Sans;
			display: flex;
			justify-content: center;
			align-items: center;
			height: 100vh;
			overflow: hidden;
			background: #F44336 ;
			background-size: cover;
		}
		.mainbox{
			position: relative;
			width: 500px;
			height: 500px;
		}
		.mainbox:after{
			position: absolute;
			content: '';
			width: 32px;
			height: 32px;
			background: url('arrow-left.png') no-repeat;
			background-size: 32px;
			right: -30px;
			top: 50%;
			transform: translateY(-50%);
		}
		.box{
			width: 100%;
			height: 100%;
			position: relative;
			border-radius: 50%;
			border: 10px solid #fff;
			overflow: hidden;
			transition: all ease 5s;
		}
		span{
			width: 50%;
			height: 50%;
			display: inline-block;
			position: absolute;
		}
		.span1{
			clip-path: polygon(0 92%, 100% 50%, 0 8%);
			background-color: #ffeb3b;
			top: 120px;
			left: 0;
		}
		.span2{
			clip-path: polygon(100% 92%, 0 50%, 100% 8%);
			background-color: #e91e63;
			top: 120px;
			right: 0;
		}
		.span3{
			clip-path: polygon(50% 0%, 8% 100%, 92% 100%);
			background-color: #4caf50;
			bottom: 0;
			left: 120px;
		}
		.span4{
			clip-path: polygon(50% 100%, 92% 0, 8% 0);
			background-color: #3f51b5;
			top: 0;
			left: 120px;
		}

		/*Little bit adjust the value*/
		.box1 .span3 b{
			 transform: translate(-50%, -50%) rotate(-270deg);
		}
		.box1 .span1 b,
		.box2 .span1 b{
			transform: translate(-50%, -50%) rotate(185deg);
		}
		.box2 .span3 b{
			transform: translate(-50%, -50%) rotate(90deg);
		}
		.box1 .span4 b,
		.box2 .span4 b{
			transform: translate(-50%, -50%) rotate(-85deg);
		}

		.box2{
			width: 100%;
			height: 100%;
			transform: rotate(-135deg);
		}
		span b{
			width: 65px;
			height: 65px;
			line-height: 65px;
			border-radius: 50%;
			font-size: 26px;
			text-align: center;
			background-color: #fff;
			position: absolute;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
			box-shadow: inset 0 3px 3px 0 #717171;
		}
		.spin{
			position: absolute;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
			width: 75px;
			height: 75px;
			border-radius: 50%;
			border: 4px solid #fff;
			background-color: #ff5722;
			color: #fff;
			box-shadow: 0 5px 20px #000;
			font-weight: bold;
			font-size: 22px;
			cursor: pointer;
		}
		.spin:active{
			width: 70px;
			height: 70px;
			font-size: 20px;
		}

		.mainbox.animate:after{
			animation: animateArrow 0.7s ease infinite;
		}
		@keyframes animateArrow{
			50%{
				right: -40px;
			}
		}
		.arrow{
			position: absolute;
    top: 12%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 67px;
    height: 75px;
    border-radius: 50%;
    border: 4px solid #fff;
    background-color: #ff5722;
    color: #fff;
    box-shadow: 0 5px 20px #000;
    font-weight: bold;
    font-size: 22px;
    cursor: pointer;
		}
	</style>
</head>
<body>
<div id="spinid">
<button class="btn btn-success"  onclick="playgame();">Play Game</button>
</div>
<div id="mainbox" class="mainbox" style="display: none;">
		<div id="box" class="box">
			<div class="box1">
				<span class="span1"><b>50</b></span>
				<span class="span2"><b>150</b></span>
				<span class="span3"><b>250</b></span>
				<span class="span4"><b>350</b></span>
				
			</div>
			<div class="box2">
				<span class="span1"><b>10</b></span>
				<span class="span2"><b>110</b></span>
				<span class="span3"><b>210</b></span>
				<span class="span4"><b>310</b></span>
			</div>
		</div>
		<button class="arrow" onclick="myfuncon()"></button>
		<button class="spin" onclick="myfunction()">SPIN</button>
	</div>


<script>
	function playgame() {
		
		document.getElementById("spinid").style.display = "none";
		document.getElementById("mainbox").style.display="block";
	}
function myfunction(){


	var x = 1024; //min value
	var y = 9999; // max value

	var deg = Math.floor(Math.random() * (x - y)) + y;

	document.getElementById('box').style.transform = "rotate("+deg+"deg)";
	
	var element = document.getElementById('mainbox');
	element.classList.remove('animate');
	setTimeout(function(){
		element.classList.add('animate');
		 var x = $("div.box1.span1").position();
		  alert("Top: " + x.top + " Left: " + x.left);
	}, 5000); //5000 = 5 second
}

</script>
</body>
</html>