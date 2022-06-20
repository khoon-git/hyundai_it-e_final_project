<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="app" value="${pageContext.request.contextPath}" />
<c:set var ="flag" value = ""/>
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
                dt,
        dd {
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
		.cus-wrap .faq-tab .faq-full li.on {
   			 border: 0;
   			 background: #3ABBD5;
		}
		.cus-wrap .faq-tab .faq-full li.on {
		    border: 0;
		    background: #6d8fe2 !important;
		}
		.cus-wrap .accparent {
   		
    		border-top: 2px solid #D3D3D3 !important;
		}

		.faqimg {
			width: 700px !important;
		}

		
		
    </style>
    <script src="//image.hmall.com/p/js/co/jquery-3.4.1.min.js"></script><!-- jQuery Plugin -->
    <script src="//image.hmall.com/p/js/co/jquery.easing.min.js"></script><!-- jQuery UI Effect -->
    <script src="//image.hmall.com/p/js/co/jquery-ui.1.12.1.min.js"></script><!-- jQuery UI js -->

    <!-- includeScript -->
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/cc/customer.css">
    
    <!--  자주묻는 질문 버튼 색상 처리  -->
    <script type="text/javascript">
    	
    	$(document).ready(function(){    		
    		var query = new URLSearchParams(location.search).get('faq_flag');
    		if(query == "" || query == null){
    			$('#all').addClass('on');	
    		}else{
    			$('#' + query).addClass('on');	
    		} 
		});

        var param = "";
        var faqLCsfCount = "0";
        jQuery(function ($) {
            if (param != '') {
                $("#" + param).click();
                var ancmId = param;
                var params = "ancmId=" + ancmId;
                $.ajax({
                    url: "/p/ccc/updateFaqCnt", data: params, type: "post", success: function (data) {
                        $("#cnt" + ancmId).html(data.qryCnt);
                    }, dataType: "json"
                });

                $("#" + param).attr('chk', 'true');
            }

            //FAQ 평가 글자 수 제한
            $("textarea").keyup(function () {
                var text = $(this).val();
                var textlength = text.length;
                var bytesize = 0;

                for (i = 0; i < textlength; i++) {
                    onechar = text.charAt(i);
                    if (isValidKorean(onechar)) {
                        bytesize += 2;
                    } else {
                        bytesize++;
                    }
                }

                if (bytesize > 1000) {
                    $("textarea").blur();
                    var msg = $("textarea").val().substring(0, 1000);
                    $("textarea").val(msg);
                    alert("1000byte를 초과하실 수 없습니다");
                    return false;
                }
                $("span.color_ora").text(bytesize);
            });

            $("input[name='keyword']").on("keydown", function (e) {
                if (e.keyCode == 13) {
                    searchCntn();
                }
            });
            
            
            
        })

        //검색하여 리스트 출력
        function searchCntn() {
            var ancmCntn = $("input[name='keyword']").val().trim();
            if (ancmCntn == "") {
                alert("검색어를 입력해 주세요.");
                return false;
            }
            $("form[name='searchForm']").submit();
        }

        //조회수 순서로 리스트 출력
        function sortByCnt() {
            var faqMCsfNo = "";
            var faqLCsfNo = "";

            if (faqMCsfNo) {
                $("#faqMCsfNo").val(leadingSpaces(faqMCsfNo, 5));
            }
            if (faqLCsfNo) {
                $("#faqLCsfNo").val(leadingSpaces(faqLCsfNo, 2));
            }

            $("#sort").val("true");
            $("form[name='searchForm']").submit();
        }

        //자릿수 맞추기
        function leadingSpaces(n, digits) {
            var space = '';
            n = n.toString();

            if (n.length < digits) {
                for (var i = 0; i < digits - n.length; i++)
                    space += '0';
            }
            return space + n;
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
                    <!--search : 자주 묻는 질문-->
                    <div class="cus-wrap">
                        <h3>자주 묻는 질문</h3>
                        <div class="search-area">
                            <form name="searchForm" method="get" action="${app}/cs/faq/faqSearch">
                                <div class="inputbox">
                                    <input hidden="hidden" />
                                    <label class="inplabel icon-find"><input type="text" name="keyword"
                                            placeholder="질문을 검색해보세요" title="검색어 입력" value=""></label>
                                    <button type="button" class="btn btn-find" onclick="searchCntn();"><i
                                            class="icon find-sm"></i><span class="hiding">검색</span></button>
                                </div>
                            </form>
                        </div>              
                    </div>
                    <!--//search : 자주 묻는 질문-->


                    <!--faq-tab-->
                    <div class="cus-wrap">
                        <div class="faq-tab">
                            <ul class="faq-full">
                                <li id="all"><a href="${app}/cs/faq"><span>전체</span></a></li>
                                <li id="U"><a href="${app}/cs/faq/faqView?faq_flag=U"><span>회원</span></a></li>
                                <li id="P"><a href="${app}/cs/faq/faqView?faq_flag=P"><span>상품</span></a></li>
                                <li id="O"><a href="${app}/cs/faq/faqView?faq_flag=O"><span>주문/결제</span></a></li>
                                <li id="D"><a href="${app}/cs/faq/faqView?faq_flag=D"><span>배송</span></a></li>
                                <li id="C"><a href="${app}/cs/faq/faqView?faq_flag=C"><span>취소/교환/반품</span></a></li>
                                <li id="R"><a href="${app}/cs/faq/faqView?faq_flag=R"><span>적립금/e포인트/할인쿠폰</span></a></li>
                                <li id="S"><a href="${app}/cs/faq/faqView?faq_flag=S"><span>사이트 이용</span></a></li>
                                <li id="E"><a href="${app}/cs/faq/faqView?faq_flag=E"><span>기타사항</span></a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- 버튼클릭후 색상변경 처리하기  -->
                     <script type="text/javascript">

					</script>
                    <!--//cus-wrap-->

                    <!--faq-list-->
                    <div class="cus-wrap">
                    <!--accparent-->
        			<div class="accparent">
        				<c:forEach items="${list}" var="dto" varStatus="vs">
            			<dl>
                			<dt class = "arcordian"><span></span>${dto.title}</dt>
                			<dd class = "arcordian-down">${dto.content}</dd>
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
                    <!--//cus-wrap-->
                </div>
                <!-- //.contents -->


</html>