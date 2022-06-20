<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="app" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>

        <style>
            table, td, th {
            border : 1px solid black;
            border-collapse : collapse;
            }
            th, td {
            text-align: center;
            }
            .solid {
            border: solid 5px #a1a1a1;
            margin: 10px 10px 25px 10px;
            padding: 15px 10px 15px 10px;
            }
        </style>
    </head>

    <body>
        <h2> | 장바구니 조회</h2>
        <div>
            ※ 문의하실 상품을 선택하시고 확인 버튼을 클릭해주세요.
            
            <form action="${app}/findInCart" method="post">
            <table>
                <caption>테이블 제목</caption>
                <colgroup>
                    <col style="width:40px">
                    <col style="width:450px">
                    <col style="width:120px">
                </colgroup>
                <tbody>
                    <tr>
                        <th>선택</th>
                        <th>상품명</th>
                        <th>금액</th>
                    </tr>
                    <tr>
                    	<c:forEach items="${list}" var="dto" varStatus="vs">
                        <td><input type="radio" name="orderNo" value="${vs}" checked="checked"></td>
                        <td>${dto.prd_nm}</td>
                        <td>${dto.price}</td>
                        </c:forEach>
                    </tr>
                </tbody>
            </table>
            <div class="suborc">
		        <input type="submit" value="확인" style="cursor: pointer;">
		        <input type="button" value="취소" onClick="window.close()" style="cursor: pointer;">
		    </div>
            </form>
        </div>
    </body>

</html>