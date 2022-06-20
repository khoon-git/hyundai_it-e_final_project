<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Center Modal</title>

<style>
/*
table 간격 설정
https://webisfree.com/2018-06-21/table-%ED%83%9C%EA%B7%B8-tr-%EC%9A%94%EC%86%8C-%EC%82%AC%EC%9D%B4%EC%97%90-%EA%B0%84%EA%B2%A9-margin-%EC%A0%81%EC%9A%A9%ED%95%98%EA%B8%B0
*/
table {
	width: 400px;
	border-color: white;
	border-collapse: collapse;
	border-spacing: 0 120px;
}
tr.space {
  border-bottom: 40px solid #fff;
}
</style>

<style>
#homemodal {
	display: none;
	width: auto;
	padding: 20px 60px;
	background-color: #fefefe;
	border: 1px solid #888;
	border-radius: 3px;
}
#homemodal .modal_close_btn {
	position: absolute;
	top: 10px;
	right: 10px;
}
</style>

</head>

<body>
	<div id="homemodal">

		<table>
			<tr>
				<th>[목표]</th>
				<td> Spring CRUD 기반 웹서비스 구현과 확장</td>
			</tr>
			<tr class="space">
				<th></th>
				<td> 그리고 '?'</td>
			</tr>
			<tr>
				<th>[유의]</th>
				<td> login 안할 시 Read 외 기능 제한</td>
			</tr>
		</table>

		<a class="modal_close_btn">닫기</a>
	</div>


	<!-- modal 활성화 button은 login.jsp에 배치됨 -->

	<script>
		function modal(id) {
			var zIndex = 9999;
			var modal = document.getElementById(id);
			// 모달 div 뒤에 희끄무레한 레이어
			var bg = document.createElement('div');
			bg.setStyle({
				position : 'fixed',
				zIndex : zIndex,
				left : '0px',
				top : '0px',
				width : '100%',
				height : '100%',
				overflow : 'auto',
				// 레이어 색갈은 여기서 바꾸면 됨
				backgroundColor : 'rgba(0,0,0,0.4)'
			});
			document.body.append(bg);
			// 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
			modal.querySelector('.modal_close_btn').addEventListener('click',
					function() {
						bg.remove();
						modal.style.display = 'none';
					});
			modal
					.setStyle({
						position : 'fixed',
						display : 'block',
						boxShadow : '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',
						// 시꺼먼 레이어 보다 한칸 위에 보이기
						zIndex : zIndex + 1,
						// div center 정렬
						top : '50%',
						left : '50%',
						transform : 'translate(-50%, -50%)',
						msTransform : 'translate(-50%, -50%)',
						webkitTransform : 'translate(-50%, -50%)'
					});
		}
		// Element 에 style 한번에 오브젝트로 설정하는 함수 추가
		Element.prototype.setStyle = function(styles) {
			for ( var k in styles)
				this.style[k] = styles[k];
			return this;
		};
		document.getElementById('popup_open_btn').addEventListener('click',
				function() {
					// 모달창 띄우기
					modal('homemodal');
				});
	</script>

</body>

</html>