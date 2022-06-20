<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication property="principal.user.user_id" var="principal_user_id" />
<c:set var="app" value="${pageContext.request.contextPath}" />
				<!DOCTYPE html>
				<html>

				<head>
					<script src="//image.hmall.com/p/js/co/jquery-3.4.1.min.js"></script>
					<!-- jQuery Plugin -->
					<script src="//image.hmall.com/p/js/co/jquery.easing.min.js"></script>
					<!-- jQuery UI Effect -->
					<script src="//image.hmall.com/p/js/co/jquery-ui.1.12.1.min.js"></script>
					<!-- jQuery UI js -->
					<link rel="stylesheet" type="text/css" href="${app}/resources/css/mypage.css">
					<style>
					.order-step.return-step ul li {
					    width: 33% !important;
					    padding: 0px 30px;
					}
					span.state.sky.주문취소 {
						color: #ff5340 !important;
					}
					span.state.sky.주문접수 {
						color: #3abbd5 !important ;
					}
					span.state.sky.결제완료 {
						color: #03c75a !important;
					}
					span.state.sky.상품발송 {
						color: #3abbd5 !important;
					}
					span.state.sky.상품준비중 {
						color: #737373 !important;
					}
					span.state.sky.반품접수 {
						color: #737373 !important;
					}
					span.state.sky.반품완료 {
						color: #03c75a !important ; 
					}
					span.state.sky.교환접수 {
						color: #737373 !important;
					}
					span.state.sky.교환완료 {
						color: #03c75a !important;  
					}
					
					</style>
				<script type="text/javascript">
				function openWindow(url) {
				    window.open(url, "_blank");
				}
				_TRK_PI_ = "MYPAGE";
				
				/*
				 * 상품평 쓰기 버튼 with 유효성 검사
				 * !! 마이페이지에서 댓글을 달게 하는 것의 이점은 확실한 주문정보를 제공
				 */
				function InsertReview(prd_board_id, prd_id){
					var token = $("input[name='_csrf']").val();
					var header = "X-CSRF-TOKEN";
					
					//var parentObj = $(obj).closest("dd");
				
					var val_cur_user='${principal_user_id}';
					var val_prd_board_id = prd_board_id;
					var val_prd_id = prd_id;
					// 마이페이지에서 prd_board_id 접근?
							
					
					
					// insert 전 자격 체크, goto checkValidReview controller
					$.ajax({
						url : "${app}/r/checkValidReview",
						method : "POST",
						data : {
							user_id : val_cur_user,
							prd_board_id : prd_board_id,
							prd_id : val_prd_id
						},
						dataType : "json",
						beforeSend : function(xhr) {
							xhr.setRequestHeader(header, token);
						},
						success : function(data) {
							//alert(JSON.stringify(data));
							if (data.ReviewFlag == "Already") {
								alert('현재 상품게시판에 댓글이 등록되어있습니다');
							} else if(data.ReviewFlag == "Possible"){
								
								let popUrl = "${app}/r/insert/" + val_cur_user+ "?prd_board_id=" + prd_board_id + "&&prd_id="+prd_id;
								console.log(popUrl);
								let popOption = "width = 600px, height=700px, top=300px, left=300px, scrollbars=yes";
								window.open(popUrl,"리뷰 쓰기",popOption);
								
							} else if(data.ReviewFlag == "Impossible"){
								alert('상품평은 구매고객에 한해 작성이 가능합니다.');
							}
						}
					});
				}					 
									
				 
				 <!-- document ready해서 setPeriod startDate endDateStr--> 
				 
					 $(document).ready(function(){
						 startsetPeriod();	 		 		 		 		 
					 });
				
				 	function startsetPeriod(){
						var d = new Date();
					 	var endDateStr = getDateStr(d);
					 	var dt ,startDateStr;
					    dt = new Date(d.setDate(d.getDate() - 14));
					    startDateStr = getDateStr(dt);
					     $("input[name='ordStrtDt']").val(startDateStr);
					     $("input[name='ordEndDt']").val(endDateStr);	    
					}
					 
				 
				 function setPeriod(period) {
				 	var d = new Date();
				 	var endDateStr = getDateStr(d);
				 	var dt ,startDateStr;
				
				     if (period == 2){ 
				     	dt = new Date(d.setDate(d.getDate() - 14));
				     	console.log(dt);
				     	startDateStr = getDateStr(dt);
				     	console.log(startDateStr);
				     } else if (period == 3){
				     	dt = new Date(d.setMonth(d.getMonth() - 3));
				     	startDateStr = getDateStr(dt);
				     } else if (period == 6) {
				     	dt = new Date(d.setMonth(d.getMonth() - 6));
				     	startDateStr = getDateStr(dt);
				     } else if (period == 0) {
				     	startDateStr = endDateStr.substr(0,4)+"0101";
				     	endDateStr = endDateStr.substr(0,4)+"1231";
				     } else if (period == -1) {
				     	d.setFullYear(new Date().getFullYear() - 1);
				     	startDateStr = getDateStr(d).substr(0,4)+"0101";
				     	endDateStr = startDateStr.substr(0,4)+"1231";
				     } else if (period == -2) {
				     	d.setFullYear(new Date().getFullYear() - 2);
				     	startDateStr = getDateStr(d).substr(0,4)+"0101";
				     	endDateStr = startDateStr.substr(0,4)+"1231";
				     } else { // 전체
				     	startDateStr = "00000000";
				     	endDateStr = "99999999";
				     }
						
				     $("input[name='ordStrtDt']").val(startDateStr);
				     $("input[name='ordEndDt']").val(endDateStr);
				     makeList();
				
				 }
				
				
				 function getDateStr(dt){
				 	var year = dt.getFullYear();
				 	var month = dt.getMonth();
				 	month++;
				 	if( month < 10 ){
				 		month = "0" + month;
				 	}
				 	var date = dt.getDate();
				 	if( date < 10){
				 		date = "0" + date;
				 	}
				 	return year + "" +  month + "" + date;
				 	}
				 
				 <!--페이지 클릭했을 때 페이지를 갈 수 있게 하는 함수 -->
					 function goToPageNum(pageNum){ 
						   $("input[name='pageNum']").val(pageNum);
						   
						   makeList();
					 }
					<!-- 유닉스 시간 전환 함수 --> 
					function Unix_timestamp(t){
					    var date = new Date(t*1000);
					    var year = date.getFullYear();
					    var month = " " + (date.getMonth()+1);
					    var day = " " + date.getDate();
					    var hour = "0" + date.getHours();
					    var minute = "0" + date.getMinutes();
					    var second = "0" + date.getSeconds();
					    return year + "." + month.substr(-2) + ". " + day.substr(-2);
					}
					
					function Unix_timestampConv(t)
					{
					    return Math.floor(t / 1000);
					}
					
					function search(keyword){		
						$("input[name='keyword']").val(keyword);		
						makeList();
						$("input[name='txtItemNm']").val("");
						$("input[name='keyword']").val("");
					}
					
					$(function () {
					    $("#txtItemNm").keyup(function (e) {
					    	if (e.keyCode == 13) {   		
					    		var keyword = $("input[name='txtItemNm']").val();
					    		search(keyword);
					    	}
					    })
				    })
				
						
				 function makeList()
					{
						   var keyword = $("input[name='keyword']").val();
						   var pageNum = $("input[name='pageNum']").val();
						   var ordStrtDt = $("input[name='ordStrtDt']").val();
						   var ordEndDt = $("input[name='ordEndDt']").val();
						   var amount = $("input[name='amount']").val();
						   var no_image_url = "https://image.hmall.com/hmall/pd/no_image_100x100.jpg";	 
						   $.ajax({
						         type : "GET"
						         ,url : "${app}" + "/mypage/crelistdate"
						         ,dataType: 'json'
						         ,data : {
						           pageNum : pageNum,
						           keyword : keyword,
						  		   amount : amount,
						  		   ordStrtDt : ordStrtDt,
						  		   ordEndDt : ordEndDt
						         }
						  	 	,crossDomain: true
						  	 	,success : function(data){
						  	 		var orderlist = data[0];
						  	 		var paging = data[1]; 
						  	 		var list="";
						  	 		
						  	 		if(orderlist.length == 0){   
						  	 		   list += `<div class="nodata">
						  	 		            <span class=" bgcircle"><i class="icon nodata-type7"></i></span>
						  	 		            <p>주문한 상품이 없습니다.</p>
						  	 		           </div>`
						  	 		}else {
						  	 		   for(var i = 0 ; i < orderlist.length; i++){
						  	 		   list +=  `<dl>
						  	 		                <dt>
						  	 		                    <div class="date">
						  	 		                    <span> ` + Unix_timestamp(Unix_timestampConv(orderlist[i].order_date)) + ` (주문번호 : ` + orderlist[i].prd_order_id + `)</span>
						  	 		                    </div>
						  	 		                    <%--<div class="abs">
						  	 		                        <a href="${app}/mypage/od?orderNo=`+ orderlist[i].prd_order_id + `"
						  	 		                        class="btn alink"><span>주문/배송 상세</span></a>
						  	 		                    </div>--%>
						  	 		                </dt>`
						  	 		        for(var j=0; j < orderlist[i].orderDetailList.length; j++){
						  	 		        	list += `<dd class="btn-col2">
						  	 		                <a href="${app}/p/` + orderlist[i].orderDetailList[j].prd_board_id + `">   
						  	 		                <span class="img"><img src="` + orderlist[i].orderDetailList[j].upload_path + `" alt="` + orderlist[i].orderDetailList[j].prd_nm + `" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&AR=0')"/></span>
						  	 		                        <div class="box">
						  	 		                     <span class="state sky ` + orderlist[i].orderDetailList[j].order_flag + ` ">` + orderlist[i].orderDetailList[j].order_flag + `<em class="color-999">
						  	 		                            </em>
						  	 		                            </span> 
						  	 		                            <span class="tit">` + orderlist[i].orderDetailList[j].prd_nm + `</span>
						  	 		                                <div class="info">
						  	 		                                    <ul>
						  	 		                                        <li>` + orderlist[i].orderDetailList[j].all_option + `</li>
						  	 		                                        <li>` + orderlist[i].orderDetailList[j].prd_count + ` 개</li>
						  	 		                                    </ul>
						  	 		                                </div>
						  	 		                            <span class="price"> <strong> ` + orderlist[i].orderDetailList[j].prd_price + `</strong>원</span>
						  	 		                        </div>
						  	 		                </a>`
						  	 		            if(orderlist[i].orderDetailList[j].order_flag == '주문접수' || orderlist[i].orderDetailList[j].order_flag == '상품준비중'){
						  	 		                list += `<div class="btngroup">
						  	 		                            <button class="btn btn-linelgray small30" type="button"
						  	 		                            	onClick="location.href='${app}/mypage/oc?orderDetailNo= ` + orderlist[i].orderDetailList[j].prd_orderdetail_id + ` &orderNo= ` + orderlist[i].prd_order_id + `'"><span>주문취소</span>
						  	 		                            </button>
						  	 		                         </div>`
						  	 		            }
						  	 		            if(orderlist[i].orderDetailList[j].order_flag == '결제완료'){
						  	 		                list += `<div class="btngroup">
						  	 		                            <button class="btn btn-linelgray small30" type="button"
						  	 		                            	onClick="location.href='${app}/mypage/oc?orderDetailNo=` + orderlist[i].orderDetailList[j].prd_orderdetail_id + ` &orderNo= ` + orderlist[i].prd_order_id + `'"><span>결제취소</span>
						  	 		                            </button>                                      
						  	 		                        </div>`
						  	 		            }
						  	 		            if(orderlist[i].orderDetailList[j].order_flag == '상품발송'){       
						  	 		                list += `<div class="btngroup">
						  	 		                            <button class="btn btn-linelgray small30" type="button"
						  	 		                            	onClick="location.href='${app}/mypage/oc?orderDetailNo=` + orderlist[i].orderDetailList[j].prd_orderdetail_id + ` &orderNo= ` + orderlist[i].prd_order_id + `'"><span>결제취소</span>
						  	 		                            </button>
						  	 		                        </div>`
						  	 		            }
						  	 		            if(orderlist[i].orderDetailList[j].order_flag == '배송완료'){       
						  	 		                list += `<div class="btngroup">
						  	 		                		<button class="btn btn-linelgray small30" type="button"
					 		                            	onClick="InsertReview(' ` + orderlist[i].orderDetailList[j].prd_board_id + `','` + orderlist[i].orderDetailList[j].prd_id +`')"><span>상품평쓰기</span>
					 		                           		 </button>
						  	 		                        <button class="btn btn-linelgray small30" type="button"
						  	 		                          onClick="window.open('${app}/mypage/exchangePopup?detailid=` + orderlist[i].orderDetailList[j].prd_orderdetail_id + `','교환신청','width=588,height=724')"><span>교환신청</span>
						  	 		                        </button>
						  	 		                        <button class="btn btn-linelgray small30" type="button"
						  	 		                          onClick="window.open('${app}/mypage/returnPopup?detailid=` + orderlist[i].orderDetailList[j].prd_orderdetail_id + `','반품신청','width=588,height=724')"><span>반품신청</span>                                      
						  	 		                        </button>
						  	 		                    </div>`
						  	 		            }   
						  	 		         list += `</dd>`           
						  	 		        }
						  	 		    list += `</dl>`
						  	 		    }   
						  	 		}
						 	 		$(".order-list").html(list);
						 	 		var pstr = ""
						 	            var pageMaker = data[1];
						 	            if (pageMaker.prev){
						 	            	pstr += "<a href='javascript://' onclick='goToPageNum(1)' class='page-first' aria-label='처음페이지 이동'> <i class='icon'></i><span class='hiding'>처음페이지 이동</span></a>"
						 	            	pstr += "<a href='javascript://' onclick='goToPageNum(" + String(parseInt(pageMaker.cri.pageNum) - 1) + ")' class='page-prev' aria-label='이전페이지 이동'>"
						 					pstr += "<i class='icon'></i><span class='hiding'>이전페이지 이동</span></a>"
						 	            }
						 	            for(let i = parseInt(pageMaker.startPage); i <= parseInt(pageMaker.endPage); i++){
						 	            	if (i == pageMaker.cri.pageNum){
						 	            		pstr += "<strong aria-label='현재 선택페이지'>" + i + "</strong>"
						 	            	}
						 	            	else {
						 	            		pstr += "<a href='javascript://' onclick='goToPageNum(" + i + ")'>" + i + "</a>"
						 	            	}
						 	            }
						 	            if (pageMaker.next){
						 	            	pstr += "<a href='javascript://' onclick='goToPageNum(" + String(parseInt(pageMaker.cri.pageNum) + 1) + ")' class='page-next' aria-label='다음페이지 이동'> <i class='icon'></i><span class='hiding'>다음페이지 이동</span></a>"
						 	    			pstr += "<a href='javascript://' onclick='goToPageNum(" + pageMaker.realEnd + ")' class='page-last' aria-label='마지막페이지 이동'> <i class='icon'></i><span class='hiding'>마지막페이지 이동</span></a>"
						 	            }
						 	            $(".page-prevarea").html(pstr);   
						  	 	}
						  	 	  
							});
					}
					 
				
				 </script>

				</head>
				<form>
					<input type="hidden" name="pageNum" value="1"/>
					<input type="hidden" name="amount" value="10"/>
					<input type='hidden' name='ordStrtDt' id='ordStrtDt' value="" />  
					<input type='hidden' name='ordEndDt' id='ordEndDt' value="" /> 
					<input type='hidden' name='keyword' id='keyword' value="" /> 
				</form>

							        <h3 class="title22">취소/반품/교환/AS현황</h3>
							        <div class="order-step return-step">
							            <p class="txt-right">&nbsp;</p>
							            <ul>
							                <li>
							                    <div>
							                        <strong class="num">${cstep}</strong>
							                        <span class="txt">주문취소</span>
							                    </div>
							                </li>
							                <li>
							                    <div>
							                        <strong class="num">${rstep1}</strong>
							                        <span class="txt">반품접수</span>
							                    </div>
							                    <div>
							                        <strong class="num">${rstep2}</strong>
							                        <span class="txt">반품완료</span>
							                    </div>
							                </li>
							                <li>
							                    <div>
							                        <strong class="num">${estep1}</strong>
							                        <span class="txt">교환접수</span>
							                    </div>
							                    <div>
							                        <strong class="num">${estep2}</strong>
							                        <span class="txt">교환완료</span>
							                    </div>
							                </li>
							            </ul>
							        </div>
                            <ul class="dotlist">
                                <li>취소/반품/교환 요청: 취소/반품/교환 신청은 상품발송 후 7일 이내에만 가능합니다.</li>
                            </ul>
						<div class="filter-box">
							<div class="search-filter">
								<ul class="radiolist">
									<li><input type="radio" name="order" id="order01" value="2"
											aria-checked=&#034;true&#034; checked=&#034;&#034;> <label for="order01"
											onclick="setPeriod(2);">최근 14일</label></li>
									<li><input type="radio" name="order" id="order02" value="3"
											aria-checked=&#034;false&#034;> <label for="order02"
											onclick="setPeriod(3);">최근 3개월</label></li>
									<li><input type="radio" name="order" id="order03" value="6"
											aria-checked=&#034;false&#034;> <label for="order03"
											onclick="setPeriod(6);">최근 6개월</label></li>
									<li><input type="radio" name="order" id="order04" value="0"
											aria-checked=&#034;false&#034;> <label for="order04"
											onclick="setPeriod(0);">2022년</label></li>
									<li><input type="radio" name="order" id="order05" value="-1"
											aria-checked=&#034;false&#034;> <label for="order05"
											onclick="setPeriod(-1);">2021년</label></li>
									<li><input type="radio" name="order" id="order06" value="-2"
											aria-checked=&#034;false&#034;> <label for="order06"
											onclick="setPeriod(-2);">2020년</label></li>
									<li><input type="radio" name="order" id="order07" value="-3"
											aria-checked=&#034;false&#034;> <label for="order07"
											onclick="setPeriod(-3);">전체</label></li>
								</ul>
								<input type="hidden" id="searchType" name="searchType" value="2" />
								<input type="hidden" class="from" name="strtDt" id="txtOrdStrtDt" maxlength="8"
									value="" /> <input type="hidden" class="to" name="endDt" id="txtOrdEndDt"
									maxlength="8" value="" />

								<div class="inputbox sm">
									<label class="inplabel icon-find"><input type="text" name="txtItemNm" id="txtItemNm"
											value="" placeholder="상품명 검색"></label>
									<button class="btn btn-find" type="button" id="serach">
										<i class="icon find"></i><span class="hiding">검색</span>
									</button>
									<button class="btn ico-clearabled">
										<i class="icon"></i><span class="hiding">지우기</span>
									</button>
								</div>
							</div>
						</div>	
						<div class="order-list">
							<c:if test = "${fn:length(list) == 0}">
							<div class="nodata" >
								<span class=" bgcircle"><i class="icon nodata-type7"></i></span>
									<p>최근 14일간의 주문한 상품이 없습니다.</p>
							</div>  
							 </c:if>
							  <c:if test = "${fn:length(list) > 0}">
							  <c:forEach var="orderDTO" items="${list}">   
								<dl>
								
									<dt>
										<div class="date">
											<span><fmt:formatDate value="${orderDTO.order_date}" type= "date"/> (주문번호 : <c:out value="${orderDTO.prd_order_id}"/>)</span>
										</div>
										<div class="abs">
							<%-- <a href="${app}/mypage/od?orderNo=${orderDTO.prd_order_id}"
								class="btn alink"><span>주문/배송 상세</span></a> --%>
						</div>
					</dt>
					 <!-- 이중포 여기 -->
					 <c:forEach items="${orderDTO.orderDetailList}" var="detailDTO">
						<dd class="btn-col2">
						   <a href="${app}/p/${detailDTO.prd_board_id}">
	  					   <span class="img"><img src="${detailDTO.upload_path}" alt="${detailDTO.prd_nm}" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&AR=0')"/></span>
						<div class="box">
								<span class="state sky">${detailDTO.order_flag}<em class="color-999">
								</em>
								</span> 
							<span class="tit">${detailDTO.prd_nm}</span>
							<div class="info">
								<ul>
	                                <li>${detailDTO.all_option}</li>
	                                <li>${detailDTO.prd_count} 개</li>
							 	</ul>
							</div>
							<span class="price"> <strong>${detailDTO.prd_price}</strong>원</span>
						</div>
						</a>
	                     	   <c:if test="${detailDTO.order_flag == '주문접수' || detailDTO.order_flag == '상품준비중'}">
	                           <div class="btngroup">
	                               <button class="btn btn-linelgray small30" type="button"
	                                     onClick="location.href='${app}/mypage/oc?orderDetailNo=${detailDTO.prd_orderdetail_id}&orderNo=${orderDTO.prd_order_id}'"><span>주문취소</span>
	                               </button>
	                           </div>
	                           </c:if>
	                           <c:if test="${detailDTO.order_flag == '결제완료'}">
	                           <div class="btngroup">
	                               <button class="btn btn-linelgray small30" type="button"
	                                     onClick="location.href='${app}/mypage/oc?orderDetailNo=${detailDTO.prd_orderdetail_id}&orderNo=${orderDTO.prd_order_id}'"><span>결제취소</span>
	                               </button>                                      
	                           </div>
	                           </c:if>
	                           <c:if test="${detailDTO.order_flag == '상품발송'}">
	                           <div class="btngroup">
	                                <button class="btn btn-linelgray small30" type="button"
	                                      onClick="location.href='${app}/mypage/oc?orderDetailNo=${detailDTO.prd_orderdetail_id}&orderNo=${orderDTO.prd_order_id}'"><span>결제취소</span>
	                                </button>
	                           </div>
	                           </c:if>
	                           <c:if test="${detailDTO.order_flag == '배송완료'}">
	                           <div class="btngroup">
                           		<button class="btn btn-linelgray small30" type="button"
                                                onClick="InsertReview('${detailDTO.prd_board_id}','${detailDTO.prd_id}')"><span>상품평쓰기</span>
                                </button>
	                           	<button class="btn btn-linelgray small30" type="button"
	                                 onClick="window.open('${app}/mypage/exchangePopup?detailid=${detailDTO.prd_orderdetail_id}','교환신청','width=588,height=724')"><span>교환신청</span>
	                           	</button>
	                           	<button class="btn btn-linelgray small30" type="button"
	                                 onClick="window.open('${app}/mypage/returnPopup?detailid=${detailDTO.prd_orderdetail_id}','반품신청','width=588,height=724')"><span>반품신청</span>                                      
	                           	</button>
	                           </div>
	                     </c:if>   
					</dd>
					</c:forEach>
	
					
				</dl>
				 </c:forEach>
				</c:if>
			</div>

		
								<div class="paging">
									<div class="page-prevarea">
										<c:if test="${pageMaker.prev }">
											<a href="javascript://" onclick="goToPageNum(1)" class="page-first" aria-label="처음페이지 이동"> <i
												class="icon"></i><span class="hiding">처음페이지 이동</span>
											</a>
											<a href="javascript://" onclick="goToPageNum(${pageMaker.cri.pageNum - 1})"
												class="page-prev" aria-label="이전페이지 이동"> <i class="icon"></i><span
												class="hiding">이전페이지 이동</span>
											</a>
										</c:if>
										<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
											<c:if test="${pageMaker.cri.pageNum == num}">
												<strong aria-label="현재 선택페이지">${num}</strong>
											</c:if>
											<c:if test="${pageMaker.cri.pageNum != num}">
												<a href="javascript://" onclick="goToPageNum(${num})">${num}</a>
											</c:if>
										</c:forEach>
										<c:if test="${pageMaker.next }">
											<a href="javascript://" onclick="goToPageNum(${pageMaker.cri.pageNum + 1})" class="page-next" aria-label="다음페이지 이동"><i class="icon"></i><span
												class="hiding">다음페이지 이동</span></a>
											<a href="javascript://" onclick="goToPageNum(${pageMaker.realEnd})" class="page-last" aria-label="마지막페이지 이동"><i class="icon"></i><span
												class="hiding">마지막페이지 이동</span></a>
										</c:if>
									</div>
						</div>
														<script> 
									$(".state:contains('주문취소')").css({color:"#ff5340"});																													
									$(".state:contains('주문접수')").css({color:"#3abbd5"});
									$(".state:contains('결제완료')").css({color:"#03c75a"});
									$(".state:contains('상품발송')").css({color:"#3abbd5"});
									$(".state:contains('상품준비중')").css({color:"#737373"});
									$(".state:contains('반품접수')").css({color:"#737373"});
									$(".state:contains('반품완료')").css({color:"#03c75a"});
									$(".state:contains('교환접수')").css({color:"#737373"});
									$(".state:contains('교환완료')").css({color:"#03c75a"});
								</script>
						<div class="tblwrap">
							<h4 class="ctypo17">주문상태 안내</h4>
							<table>
								<caption>테이블 제목</caption>
								<colgroup>
									<col style="width: 140px">
									<col style="width: 160px">
									<col style="width: auto">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row" rowspan="6">접수 → 배송완료</th>
										<td>주문접수</td>
										<td>주문접수 후 입금을 확인하는 단계 입니다.</td>
									</tr>
									<tr>
										<td>결제완료</td>
										<td>주문/결제가 완료되었거나 입금확인이 완료된 단계입니다.</td>
									</tr>
									<tr>
										<td>상품 준비중</td>
										<td>주문하신 상품을 발송하기 위해 상품을 준비하는 단계입니다.</td>
									</tr>
									<tr>
										<td>발송 준비중</td>
										<td>주문하신 상품을 택배사로 전달하는 단계입니다.</td>
									</tr>
									<tr>
										<td>상품 발송</td>
										<td>택배사를 통해 상품발송이 완료되어 배송추적이 가능한 단계입니다. <br>(H.Point는
											상품발송 단계에서만 내려받으실 수 있습니다.)
										</td>
									</tr>
									<tr>
										<td>배송 완료</td>
										<td>택배 송장 조회결과 배송완료된 단계입니다.</td>
									</tr>
									<tr>
										<th scope="row">주문취소</th>
										<td>주문취소</td>
										<td>주문취소 처리가 완료된 단계입니다.</td>
									</tr>
									<tr>
										<th scope="row" rowspan="5">반품</th>
										<td>반품접수</td>
										<td>반품신청이 접수되어 처리중인 상태입니다.</td>
									</tr>
									<tr>
										<td>상품 회수중</td>
										<td>반품접수된 상품이 택배사를 통해 회수중인 상태입니다.</td>
									</tr>
									<tr>
										<td>상품 확인중</td>
										<td>당사 물류센터로 상품도착 후 백화점 매장으로 상품 이동중인 단계입니다. <br>(백화점 상품에
											한함)
										</td>
									</tr>
									<tr>
										<td>반품완료</td>
										<td>반품처리가 완료된 상태입니다.</td>
									</tr>
									<tr>
										<td>반품취소</td>
										<td>반품취소가 완료된 상태입니다.</td>
									</tr>
									<tr>
										<th scope="row" rowspan="6">교환</th>
										<td>교환접수</td>
										<td>교환신청이 접수되어 처리중인 상태입니다. (해외배송 제외)</td>
									</tr>
									<tr>
										<td>교환상품 준비중</td>
										<td>교환상품을 발송하기 위해 상품을 준비하는 단계입니다.</td>
									</tr>
									<tr>
										<td>교환상품발송 준비중</td>
										<td>교환 상품을 택배사로 전달하는 단계입니다. (해외배송 제외)</td>
									</tr>
									<tr>
										<td>교환상품발송</td>
										<td>교환 상품이 택배사를 통해 발송이 완료되어 배송추적이 가능한 단계입니다.</td>
									</tr>
									<tr>
										<td>교환완료</td>
										<td>교환처리가 완료된 상태입니다. (해외배송 제외)</td>
									</tr>
									<tr>
										<td>교환취소</td>
										<td>교환취소가 완료된 상태입니다.</td>
									</tr>
									<tr>
										<th scope="row" rowspan="7">A/S</th>
										<td>A/S 접수</td>
										<td>A/S 신청이 접수되어 처리중인 상태입니다.</td>
									</tr>
									<tr>
										<td>A/S 상품 회수 중</td>
										<td>A/S 접수된 상품이 택배사를 통해 회수중인 상태입니다.</td>
									</tr>
									<tr>
										<td>A/S 상품 회수 완료</td>
										<td>A/S 상품이 회수된 상태입니다.</td>
									</tr>
									<tr>
										<td>A/S 상품 준비 중</td>
										<td>A/S 상품을 발송하기 위해 상품을 준비하는 상태입니다.</td>
									</tr>
									<tr>
										<td>A/S 상품 발송</td>
										<td>A/S 상품이 택배사를 통해 발송된 상태입니다.</td>
									</tr>
									<tr>
										<td>A/S 완료</td>
										<td>A/S 처리가 완료된 상태입니다.</td>
									</tr>
									<tr>
										<td>A/S 취소</td>
										<td>A/S 접수가 취소된 상태입니다.</td>
									</tr>
								</tbody>
							</table>
						</div>

						<!-- 2020-09-03 텍스트 수정 -->
						<div class="guide-box">
							<h4 class="ctypo18">꼭 읽어보세요! Notice</h4>
							<ul class="dotlist">
								<li>주문상태가 '상품발송'인 경우 배송조회가 가능합니다. 단 주문하신 상품을 업체에서 직접 배송하는 경우
									배송조회가 이루어지지 않을 수 있습니다.</li>
								<li>결제수단을 무통장 입금이나 상품권으로 선택한 경우, 주문일로부터 <strong class="color-666">7일 이내 입금 및 접수확인이 되지
										않으면 주문이 취소</strong>됩니다.
								</li>
								<li>복합결제 후 일부 금액만 결제한 경우 주문일로부터 7일 후 주문이 취소되며, 결제한 금액은 환불처리됩니다.
									단, 현금 결제는 예치금으로 환불됩니다.</li>
								<li><strong class="color-666">반품 및 교환 신청은 상품발송 후 7일 이내</strong>에
									가능합니다.</li>
								<li>반품 신청 시 반품상품이 도착한 후 상품 상태를 점검한 다음에 결제가 취소됩니다. 단, 상품 점검 시 반품
									불가 사유에 해당하는 경우 고객님께 통보 후 상품을 다시 발송해 드립니다.</li>
								<li>주문과 관련하여 문의사항이 있으실 경우 고객센터(1600-0000) 혹은 Hmall 1:1상담신청을 통해
									문의 바랍니다.</li>
							</ul>
						</div>
						<!-- // 2020-09-03 텍스트 수정 -->
					</div>
				</div>
				<!-- // .contents -->
				</div>
				</div>
				<!-- //.container -->

				</main>

				</html>