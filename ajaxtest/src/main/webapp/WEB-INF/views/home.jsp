<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
<script>
	$(function() {
		$('#id01').on('click',function() {
			$.ajax({
				url : 'read',
				type : 'get',
				success : function(t) {
					/* $(t).find("person").each(function() {
						var name = $(this).find('name').text();
						var age = $(this).find('age').text();
						var salary = $(this).find('salary').text();
						$('<h1></h1>').text(name + " " + age + " "+ salary).appendTo('body');
					}); */
					$("#result").html(t);
				},
				error : function() {
					alert('실패 ㅠㅠ');
				}
			});
		});

		$('#id02').on('click', function() {
			$.ajax({
				url : 'write', //가져오고자하는 서버페이지 주소를 넣는다. 
				type : 'post', //데이터를 서버로 전송하게 된다. 
				data : {
					name : $('#name1').val(), //에디터박스의 아이디를 넣으면 해당 에디터박스의 데이터를 보내준다.
					age : $('#age1').val(),
					salary : $('#salary1').val()
				},
				success : function(t) {
					alert('성공!');
				},
				error : function() {
					alert('실패 ㅠㅠ');
				}
			});
			$("#name1").text("");
			$("#age1").text("");
			$("#salary1").text("");
		});
	});
</script>
</head>
<body>
	<h1>Hello world!</h1>

	<P>The time on the server is ${serverTime}.</P>

	<button id="id01">DB 데이터 읽기</button><br />
	이름:<input type="text" id="name1"><br />
	나이:<input type="text" id="age1"><br />
	월급:<input type="text" id="salary1"><br />
	<button id="id02">DB로 전송</button>
	<div id="result"></div>
</body>
</html>
