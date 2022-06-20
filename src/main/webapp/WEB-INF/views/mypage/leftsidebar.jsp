<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="app" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>

<script type="text/javascript">
    var upntCustYn = "N";
$(document).ready(function() {
    $.ajax({
        type: "get"
        ,url: "/p/mpf/chkUpntCustYn"
        ,dataType: "json"
        ,async: false
        ,success : function(data) {
            upntCustYn = data.upntCustYn;
        }
        , error: function (data) {
            console.log("chkUpntCustYn_error", data);
        }
    });
});

<!--HPAY임대진 추가 -->
function openHPayTag(pathVal) {
    var url = "http://" + location.host + "/p/mpf/hpayManage";
    try {
        _trk_flashEnvView('_TRK_CP=' + pathVal);
    } catch(e){}
    
    openPopup(url, "loginPup", 640, 600, "no", $(window).width(), $(window).height());
}

//H.Point Pay 관리 통합회원 확인 후 후 화면 분기
function fn_HppManage(){
    if(upntCustYn == "Y"){
        location.href = "https://www.hmall.com/p/mpd/hhpPmntManage";
    }else{
        $("#pec001-01").modal().show();
    }
}

function fn_upntPopupOpen(){
    location.href='/p/cua/registUpnt';
}

function fn_upntPopupClose(){
    $("#pec001-01").modal().hide();
}

function go_rentallist(){
	  $("#formrental").submit();
 }


</script>
<form name="upntLeftForm" method="post" target="uPnt">
    <input type="hidden" name="mcustNo" value="" />
</form>
<form id="formrental" method="get" action="${app}/mypage/rentalList">
	<input type="hidden" name="keyword" value="" />
</form>	
<div class="side-content">


    <h3 class="side-menu-title"><a href="${app}/mypage/mymain">마이페이지</a></h3>
    <div class="side-menu-list">
        <ul>
            <li>
                <a href="javascript:;">나의 쇼핑내역</a>
                <ul class="sub-list">
	                <li><a href="${app}/mypage/odslist">주문/배송조회</a></li>
                    <li><a href="${app}/mypage/crelist">취소/교환/반품</a></li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">나의 대여내역</a>
                <ul class="sub-list">

	                <li><a href="${app}/mypage/retalListgo">현재 대여 물품조회</a></li>

                    <li><a href="${app}/mypage/rentalReturnList">반납 완료 물품 조회</a></li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">회원정보</a>
                <ul class="sub-list">
	               	<li><a href="${app}/mypage/prevModify">회원정보 변경</a><li>
                    <li><a href="${app}/mypage/chngPW">비밀번호 변경</a></li>
                    <li><a href="${app}/mypage/deliever">배송지 관리</a></li>
                    <li><a href="${app}/mypage/prevLeave">회원 탈퇴</a></li>
                </ul>
            </li>
        </ul>
    </div>
</div>