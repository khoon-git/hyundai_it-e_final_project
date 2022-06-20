<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="app" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<div id="bannerWrap" class="">
                    <div class="quickbtn_group">
                    <span class="img">
						<img class="ic_img"src="${app}/resources/images/user.png">
					</span>
                        <p class="quickmenu"><em>QUICK 메뉴</em></p>
                        <div class="quick_btn">
                            <a href="${app}/mypage/odslist"><span>주문/배송조회</span></a>
                        </div>
                        <div class="quick_btn">
                            <a href="${app}/mypage/crelist"><span>취소/교환/반품조회</span></a>
                        </div>
                        <div class="quick_btn">
                            <a href="#" onClick="window.open('${app}/cs/qnaInsPopUp','1:1 문의하기','width=756,height=700')"><span>1:1문의</span></a>
                        </div>
                        <div class="quick_btn">
                            <a href="${app}/mypage/prevModify"><span>회원정보수정</span></a>
                        </div>
                    </div>
                </div>
</html>