<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="app" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="${app}/resources/css/customer.css">

<style>
.hidden {
	display: none !important;
}

.cus-wrap.noti .noti-wrap {
	/*공지사항과 옆 쪽 마진 삭제 */
	width: 480px;
	margin-left: 0px !important;
}

.cus-wrap.monitering a {
	display: inline-block;
	width: 235px !important;
}

.cus-wrap.monitering a+a {
	position: relative;
	padding-left: 18px !important;
}

.cus-wrap.monitering {
	padding: 20px 32px 19px 32px !important;
	border: 1px solid #ddd;
	border-radius: 5px;
	overflow: hidden;
}

.cus-wrap.monitering dl dt {
	margin-bottom: 7px;
	font-size: 17px;
	line-height: 70px !important;
	font-weight: 700;
}

.cus-wrap .search-area {
	padding: 20px 33px !important;
	background: #f8f8f8;
	border-radius: 5px;
}

.btngroup {
	display: inline-block !important;
	justify-content: space-between;
}

dt, dd {
	padding: 10px;
}

dt {
	margin-bottom: 5px;
}

dt span {
    display: inline-block;
    width: 6px;
    height: 6px;
    background-color: transparent;
    border-radius: 7px;
    vertical-align: middle;
    margin-right: 10px;
}

.cus-wrap .accparent {
    border-top: 2px solid #D3D3D3 !important;
}


dt.on span {
    background-color: #6d8fe2;
}


dd {
	background-color: #F8F8F8;
	margin-bottom: 5px;
	display: none;
}

dt.arcordian {
	padding: 20px;
	color: #333;
	font-size: 15px;
}

dd.arcordian-down {
	padding: 20px;
	color: #333;
	font-size: 15px;
}

.faqimg {
	width: 700px !important;
}
</style>
<script type="text/javascript">
        function checkCseg() {
            if (isLoginChk == "true") {

                $.ajax({
                    type: "post"
                    , url: "/p/cpa/findUserIsCseg"
                    , dataType: "json"
                    , async: false
                    , success: function (data) {
                        if (data.csegMember == "true") {
                            window.location = data.refreshUrl;
                        } else {
                            alert("고객평가단이 아닙니다.");
                        }
                    }
                    , error: function (request, status, error) {
                        alert("조회시 오류가 발생했습니다.");
                    }

                });

            } else {
                openLoginPopup(location.href);
            }
        }

        // 마이페이지 주문 배송현황
        function consultPop2() {
            window.open(serverHost + "/p/mpf/selectMyPageMain");
        }

        function checkMtrg() {
            if (isLoginChk == 'true') {

                $.ajax({
                    type: "post"
                    , url: "/p/cpa/findUserIsMtrg"
                    , dataType: "json"
                    , async: false
                    , success: function (data) {
                        if (data.mtrgMember == "true") {
                            window.location = data.refreshUrl;
                        } else {
                            alert("채널평가단이 아닙니다.");
                        }
                    }
                    , error: function (request, status, error) {
                        alert("조회시 오류가 발생했습니다.");
                    }
                });

            } else {
                openLoginPopup(location.href);
            }

        }

        //검색하여 리스트 출력
        function searchCntn() {
            var ancmCntn = $("input[name='keyword']").val().trim();
            if (ancmCntn == "") {
                alert("검색어를 입력해 주세요.");
                return false;
            }
            $("form[name='searchForm']").submit();
        }

        //2021.07.02 KJH FAQ 조회수 카운트
        function lookup_count(target, notice_id, category) {
            if (($(target).parent().attr('class') != "selected")) {
                if (category.toString().length == 1) {
                    category = "0" + category;
                }
                $.ajax({
                    url: "/p/cca/FaqCountAjax",
                    data: {
                        "notice_id": notice_id
                        , "category": category
                    },
                    type: "POST",
                    dataType: "json",
                    cache: false,
                    success: function (data) {
                        console.log("json success");
                    },
                    error: function () {
                        console.log("json error");
                    }
                });
            }
        }
    </script>
</head>
<div class="contents">
    <div class="cus-wrap noti">
        <!--공지사항-->
        <div class="noti-wrap">
            <div class="tit-wrap">
                <h3>공지사항</h3>
                <p><a href="${app}/cs/noticeList">전체보기</a></p>
            </div>
            <!--tblwrap tbl-list-->
            <div class="tblwrap tbl-list">
                <table>
                    <caption>고객센터 공지사항</caption>
                    <colgroup>
                        <col style="width:400px">
                        <col style="width:75px">
                    </colgroup>
                    <tbody>
                    <c:forEach items="${Nlist}" var="nlist" varStatus="vs">
                        <tr>
                            <td class="nowrap"><a href="${app}/cs/noticeView?articleid=${nlist.article_id}">${nlist.title}</a></td>
                            <td class="txt-center"><span class="date"><fmt:formatDate value="${nlist.ins_dt}" type="date" /></span></td>
                        </tr>
                    </c:forEach>    
                    </tbody>
                </table>
            </div>
            <!--//tblwrap tbl-list-->
        </div>


        <!--1:1 문의하기-->
        <div class="question-wrap">
            <h3>1:1 문의하기</h3>
            <div class="btngroup">
                <button class="btn btn-chat" type="button" onclick="window.open('${app}/cs/qnaInsPopUp','1:1 문의하기','width=756,height=700')">
                	<span><i class="icon"></i>1:1 문의하기</span>
                </button>
                <button class="btn btn-board" onclick="location.href='${app}/cs/qna'">
                	<span><i class="icon"></i>내 상담내역 조회</span>
                </button>

            </div>
        </div>
        <!--//1:1 문의하기-->

	</div>
	<!--//1:1문의하기 / 공지사항-->





	<div class="cus-wrap"> 
        <div class="search-area">
            <h3>FAQ 검색</h3>
            <form name="searchForm" method="get" action="${app}/cs/faq/faqSearch">
                <div class="inputbox">
                    <input hidden="hidden" />
                    <label class="inplabel icon-find"><input type="text" name="keyword" placeholder="질문을 검색해보세요"
                            title="검색어 입력" value=""></label>
                    <button type="button" class="btn btn-find" onclick="searchCntn();"><i class="icon find-sm"></i><span
                            class="hiding">검색</span></button>
                </div>
            </form>
        </div>
    </div>
    <!--//search : 자주 묻는 질문-->

	<!--베스트 FAQ 10-->
	<div class="cus-wrap">
		<div class="tit-wrap">
			<h3>자주 찾는 질문</h3>
		</div>
		<!--accparent-->
		<div class="accparent">
			<c:forEach items="${list}" var="dto" varStatus="vs">
				<dl>
					<dt class="arcordian">
						<span></span>${dto.title}</dt>
					<dd class="arcordian-down">${dto.content}</dd>
				</dl>
			</c:forEach>
		</div>
		<!--//accparent-->
		<script type="text/javascript">
            $('dt').on('click', function () {

                if ($(this).hasClass('on')) {
                    slideUp();
                } else {
                    slideUp();
                    $(this).addClass('on').next().slideDown();
                }
                function slideUp() {
                    $('dt').removeClass('on').next().slideUp();
                };
            })
        </script>
	</div>
</div>
<!-- // .contents -->
</body>

</html>