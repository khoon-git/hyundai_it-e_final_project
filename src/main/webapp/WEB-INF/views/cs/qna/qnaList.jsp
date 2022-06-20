<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 스프링 시큐리티 관련 태그 라이브러리 -->
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="app" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
      <link rel="stylesheet" type="text/css" href="${app}/resources/css/customer.css">
      <link rel="shortcut icon" href="https://www.hmall.com/favicon.ico" />
     <script src="//image.hmall.com/p/js/co/jquery-3.4.1.min.js"></script><!-- jQuery Plugin -->
     <script src="//image.hmall.com/p/js/co/jquery.easing.min.js"></script><!-- jQuery UI Effect -->
     <script src="//image.hmall.com/p/js/co/jquery-ui.1.12.1.min.js"></script><!-- jQuery UI js -->
    <style>
        .hidden {
            display: none !important;
        }

        table {
            width: 500px;
        }

        .hide {
            display: none;
        }

        .show {
            display: table-row;
        }

        .item td {
            cursor: pointer;
        }

        .cus-wrap h3 {
            margin-bottom: 20px;
            color: #333;
            font-size: 22px;
            font-weight: 700;
            line-height: 29px;
        }
        
        .cus-wrap .tblwrap table td {
		    font-size: 15px;
		    line-height: 15px;
		    border-bottom: 1px solid #eee;
		}

        .tblwrap table td {
            color: #333;
            line-height: 22px;
        }

        .basic-border-one {

            border: 1px solid #eee;
            background: white;
            padding: 15px;
            margin-bottom: 15px;
            border-radius: 5px;
            min-height: 45px;
        }

        tr.show {
            background: #f8f8f8;
        }

        p.oneaone-p {
            margin-left: 10px;
            margin-bottom: 21px;
        }

        .oneaone-div {
            text-align: end;
            font-size: 14px;
            margin-bottom: 6px;
            margin-right: 5px;
        }

        button.btn_basic {
            border: solid 1px #eee;
            background: #f8f8f8;
            padding: 9px;
            border-radius: 6px;
            font-weight: 600;
        }
        
        ul.pagination.justify-content-center {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 100%;
    margin-top: 15px;
    margin-bottom: 15px;
}

li.paginate_button {
    margin-left: 10px;
}

li.paginate_button {
    margin-left: 10px;
    display: block;
    border: 1px solid #eee;
    background: #eee;
    border-radius: 4px;
    padding: 2px;
    text-align: center;
    font-size: 12px;
}

li.paginate_button.active {
    font-family: none;
    font-weight: 900;
    font-size: inherit;
    background: space;
    border: none;
}

form#searchForm {
    display: flex;
    align-items: center;
    justify-content: end;
}

select.form-control {
    width: 170px !important;
}

input.form-control {
    padding: 8px;
    border: 1px solid #eee;
    margin-left: 3px;
    margin-right: 5px;
    width: 200px;
}

select {
    height: 35px !important;
}

.btn {
    height: 35px !important;
}

.btn-default {
    background-color: #eee;
}
        
    </style>
    <script type="text/javascript">
	$(document).ready(function() {
		var actionForm = $("#actionForm");
		$(".paginate_button a").on("click", function(e) {
			e.preventDefault();
			actionForm.find("input[name='pageNum']").val($(this).attr('href'));
			actionForm.submit();
		});
	});
	</script>
</head>
    <!-- .contents -->
    <div class="contents">
        <!--공지사항-->
        <div class="cus-wrap">
            <h3>내 상담 내역 조회</h3>

            <p class="oneaone-p">
                고객님께서 문의하신 내역입니다. </br>
                언제나 고객님의 입장에서 빠르고 정확한 답변을 드리는 홈쇼핑이 되겠습니다.
            </p>
            <div class="oneaone-div">
                <button class="btn_basic" onClick="window.open('${app}/cs/qnaInsPopUp','1:1 문의하기','width=756,height=700')">1:1 문의하기</button>
            </div>
            <!--tblwrap tbl-list-->
            <div class="tblwrap tbl-list">
             <script type="text/javascript">
                    $(function () {
                        var article = (".recruit .show");
                        $(".recruit .item  td").click(function () {
                            var myArticle = $(this).parents().next("tr");
                            if ($(myArticle).hasClass('hide')) {
                                $(article).removeClass('show').addClass('hide');
                                $(myArticle).removeClass('hide').addClass('show');
                            }
                            else {
                                $(myArticle).addClass('hide').removeClass('show');
                            }
                        });
                    });  
                </script>
                <table class="recruit">
                    <caption>고객센터 공지사항</caption>
                    <colgroup>
                        <col style="width:50px">
                        <col style="width:125px">
                        <col style="width:250px">
                        <col style="width:120px">
                        <col style="width:120px">
                        <col style="width:100px">
                    </colgroup>
                    <thead>
                        <tr>
                            <th scope="col">NO</th>
                            <th scope="col">문의 유형</th>
                            <th scope="col">제목</th>
                            <th scope="col">문의일</th>
                            <th scope="col">답변일</th>
                            <th scope="col">문의상태</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach items="${list}" var="dto" varStatus="vs">
                        <tr class="item">
                            <td class="txt-center"><span>${vs.count}</span></td>
                            <td class="txt-center"><span>${dto.type}</span></td>
                            <td class="nowrap, txt-center">${dto.title}</td>
                            <td class="txt-center"><span class="date"><fmt:formatDate value="${dto.ins_dt}" type="date" /></span></td>
                            <td class="txt-center"><span class="date"><fmt:formatDate value="${dto.ans_ins_dt}" type="date" /></span></td>
                            <td class="txt-center"><span>
                            	<c:if test="${dto.ans_yn eq '0'.charAt(0)}">처리중</c:if>
                            	<c:if test="${dto.ans_yn eq '1'.charAt(0)}">답변완료</c:if>
                            </span></td>
                        </tr>
                        <tr class="hide">
                        	<td colspan="2" style="text-align: center; letter-spacing: 1px">
                        		<div class="basic-border-one">질문 내용</div>
                        		<div class="basic-border-one">답변 내용</div>
                        	</td>
                            <td colspan="4">
                                <div class="basic-border-one">
                                    ${dto.content}
                                </div>
                                <div class="basic-border-one">
                                    ${dto.ans_content}
                                </div>
                            </td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <!--//tblwrap tbl-list-->
            <!--paging-->
			<ul class="pagination justify-content-center">
					<c:if test="${pageMaker.prev }">
						<li class="paginate_button previous"><a href="${pageMaker.startPage - 1}">&lt;</a></li>
					</c:if>
	
					<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
						<li class="paginate_button ${pageMaker.cri.pageNum == num ? 'active': '' }"><c:if test="${pageMaker.cri.pageNum != num}">
						<a href="${num }">${num }</a></c:if><c:if test="${pageMaker.cri.pageNum == num}"><div>${num }</div></c:if></li>
					</c:forEach>
	
					<c:if test="${pageMaker.next}">
						<li class="paginate_button next">
						<a href="${pageMaker.endPage + 1}">&gt;</a></li>
					</c:if>
			</ul>
			<!--paging-->
			<br/>
					<div class="row">
						<form class="form-inline" id="searchForm" action="${app}/cs/qna" method="get">
							<select class="form-control" name="type">
								<option value="T"
									>제목</option>
								<option value="C"
									>내용</option>
								<option value="W"
									>작성자</option>
								<option value="TC"
									>제목
									+ 내용</option>
								<option value="TW"
									>제목
									+ 작성자</option>
								<option value="TWC"
									>제목
									+ 작성자 + 내용</option>
							</select> 
								<input class="form-control" type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword }"/>'> 
								<input type="hidden" value="${pageMaker.cri.pageNum }"> 
								<input type="hidden" value="${pageMaker.cri.amount }">
							<button class="btn btn-default">검색</button>
						</form>
					</div>
					
					<form id="actionForm" method="get">
						<input type="hidden" name="qnaid"	value="">
						<input type="hidden" name="pageNum"	value="${pageMaker.cri.pageNum }">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
		
						<!-- 페이지 이동 시에도 검색 데이터와 함께 전송 -->
						<input type="hidden" name="type" value="${pageMaker.cri.type }">
						<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
					</form>
        </div>
        <!--//공지사항-->
    </div>
    <!-- // .contents -->
    </div>
    <!-- //.container -->
    </main>
    </body>

</html>