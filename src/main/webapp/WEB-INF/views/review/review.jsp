<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="app" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="<c:url value="${app}/webjars/jquery/3.6.0/dist/jquery.js" />"></script>
<link rel="stylesheet" type="text/css" href="${app}/resources/css/display.css">
<link rel="stylesheet" type="text/css" href="${app}/resources/css/prd-list.css">
<link rel="stylesheet" type="text/css" href="${app}/resources/css/search.css">  
<script type="text/javascript" src="${app}/resources/js/commonFunction.js"></script>    

</head>


<body>
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
	
	<input type="hidden" name="pageNum" value="${reviewpageMaker.cri.pageNum}"/>
  	<input type="hidden" name="amount" value="${reviewpageMaker.cri.amount}"/>
	<input type="hidden" name="prd_board_id" value="${prd_board_id}"/>
	<input type="hidden" name="categoryCode" value="${categoryCode}"/>
	<input type="hidden" name="sort" value="1"/>
	
	<sec:authentication property="principal" var="principal_user" />
	<c:if test="${principal_user != 'anonymousUser' }">
		<sec:authentication property="principal.user.user_id" var="principal_user_id" />
	</c:if>

	<dl>
		<dt>
			<div class="date">
				<span>2022. 6. 3 (주문번호 : 20220603215832)</span>
			</div>
			<div class="abs">
				<a href="${app}/mypage/od?orderNo=20220603215832" class="btn alink"><span>주문/배송
						상세</span></a>
			</div>
		</dt>
		<!-- 이중포 여기 -->

		<dd class="btn-col2">
			<a href="${app}/p/200"> <span class="img"><img
					src="https://image.hmall.com/static/3/5/29/68/2068295310_0.jpg?RS=300x300&amp;AR=0"
					alt="닥터시드 허니앤밀크밤 모이스처 바디워시 1000ml"
					onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
			</span>
				<div class="box">
					<span class="state" style="color: rgb(255, 83, 64);"> 주문취소 <em
						class="color-999"> </em>
					</span> <span class="tit">나이키 신발</span>
					<div class="info">
						<ul>
							<li>Yellow 220</li>
							<li>1 개</li>
						</ul>
					</div>
					<span class="price"> <strong>10000</strong>원
					</span>
				</div>
			</a>




		</dd>

		<dd class="btn-col2">
			<a href="${app}/p/200"> <span class="img"><img
					src="https://image.hmall.com/static/3/5/29/68/2068295310_0.jpg?RS=300x300&amp;AR=0"
					alt="닥터시드 허니앤밀크밤 모이스처 바디워시 1000ml"
					onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
			</span>
				<div class="box">
					<span class="state" style="color: rgb(3, 199, 90);"> 결제완료 <em
						class="color-999"> </em>
					</span> <span class="tit">로션</span>
					<div class="info">
						<ul>
							<li></li>
							<li>2 개</li>
						</ul>
					</div>
					<span class="price"> <strong>25000</strong>원
					</span>
				</div>
			</a>


			<div class="btngroup">
				<button class="btn btn-linelgray small30" type="button"
					onclick="location.href='/p/mpa/selectOrdImdtCnclReqPup.do?ordNo=20220527277541&amp;chkOrdPtcSeq=1'">
					<span>결제취소</span>
				</button>
			</div>



		</dd>

		<dd class="btn-col2">
			<a href="${app}/p/200"> <span class="img"><img
					src="https://image.hmall.com/static/3/5/29/68/2068295310_0.jpg?RS=300x300&amp;AR=0"
					alt="닥터시드 허니앤밀크밤 모이스처 바디워시 1000ml"
					onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
			</span>
				<div class="box">
					<span class="state"> 배송완료 <em class="color-999"> </em>
					</span> <span class="tit">남자 셔츠</span>
					<div class="info">
						<ul>
							<li>XL</li>
							<li>1 개</li>
						</ul>
					</div>
					<span class="price"> <strong>10000</strong>원
					</span>
				</div>
			</a>




			<div class="btngroup">
				<button class="btn btn-linelgray small30" type="button"
					onclick="InsertReview(this)">
					<span>상품평쓰기</span>
				</button>
				<button class="btn btn-linelgray small30" type="button"
					onclick="window.open('${app}/mypage/exchangePopup?detailid=7','교환신청','width=588,height=724')">
					<span>교환신청</span>
				</button>
				<button class="btn btn-linelgray small30" type="button"
					onclick="window.open('${app}/mypage/returnPopup?detailid=7','반품신청','width=588,height=724')">
					<span>반품신청</span>
				</button>
			</div>

		</dd>


		<!--주문 flag 따라 색상 변환  -->
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

	</dl>


	<!-- 상품평 tab -->
	<div class="pages page3" id="viewPage03">
		<div id="itemOptEvalInfo">

			<!-- 구매고객 총 평점 -->
			<div class="content-area review-point">
				<h3>Review Test 화면</h3>
			</div>
			<!--// 구매고객 총 평점 -->

			<!-- 구매고객 총 평점 -->
			<div class="content-area review-point">
				<h3>구매고객 총 평점</h3>
				<!--review-star -->
				<div class="review-star">
					<div class="starbg type-big pt10">
						<p class="score">
							<span class="hiding">5점</span>
						</p>
					</div>
					<span class="like-point" aria-label="포인트"><em>board와 통일</em></span>
				</div>
				<!-- //.review-star -->
			</div>
			<!--// 구매고객 총 평점 -->

			<!-- 상품평 tab의 댓글 리스트 -->
			<div class="content-area txt-review" id="reviewContentArea">

				<h3>
					상품평 <em class="total-num">${reviewpageMaker.total}</em>건
					<c:if test="${1==1 }">
						<div style="float: right;">
							<button ga-category="상품상세" ga-action="상품평" ga-label="상품평 쓰기"
								class="btn btn-lineblack small gp_className" onclick="evalWriteCore()">
								<span><i class="icon review"></i>상품평 쓰러가기 버튼(제품상세에서의 버튼 : 마이페이지 이동 버튼)</span>
							</button>
							<button ga-category="상품상세2" ga-action="상품평2" ga-label="상품평 쓰기2"
								class="btn btn-lineblack small gp_className" onclick="InsertReview(this)">
								<span><i class="icon review"></i>상품평 쓰기(마이페이지에서 출현할 버튼)</span>
							</button>
						</div>
					</c:if>
				</h3>

				<!--review-list-->
				<div class="text-review-list-std">
					<ul class="txt-review-list">
						<c:forEach items="${reviewDTO}" var="dto">
							<li class="review-item">
								<div class="review-top">
									<div class="top-left">
										<c:if test="${dto.star==1}">
											<div class="starbg pt2">
												<p class="score"></p>
											</div>
										</c:if>
										<c:if test="${dto.star==2}">
											<div class="starbg pt4">
												<p class="score"></p>
											</div>
										</c:if>
										<c:if test="${dto.star==3}">
											<div class="starbg pt6">
												<p class="score"></p>
											</div>
										</c:if>
										<c:if test="${dto.star==4}">
											<div class="starbg pt8">
												<p class="score"></p>
											</div>
										</c:if>
										<c:if test="${dto.star==5}">
											<div class="starbg pt10">
												<p class="score"></p>
											</div>
										</c:if>
								
										<span class="nick">${dto.user_id }</span>
										
									</div>
									<div class="top-right">
										<c:choose>
											<c:when test="${principal_user == 'anonymousUser' }">
											</c:when>
											<c:otherwise>
													<c:if test="${principal_user_id == dto.user_id }">
														<button><span class="nick" onclick="DeleteReview(${dto.review_id })">삭제 </span></button>
													</c:if>
											</c:otherwise>
										</c:choose>
										
										<span class="date">
										<fmt:formatDate pattern="yyyy-MM-dd" value="${dto.ins_dt}"/>
										</span>
									</div>
								</div>
								<!--review-option-->
								<div class="review-option">
									<c:choose>
											<c:when test="${dto.option1 == null}">
												<em>색상/속성 : 단일상품</em><br>
											</c:when>
											<c:when test="${dto.option1 != null && dto.option2 == null}">
												<em>${dto.option1 }</em><br>
											</c:when>
											<c:when test="${dto.option1 != null && dto.option2 != null}">
												<em>${dto.option1 }/${dto.option2 }</em><br>
											</c:when>
									</c:choose>
								</div> 
								<!--//review-option--> 
								

								<!-- pdwrap -->
								<div class="pdwrap photo-review">
									<div class="pdlist-wrap">
										<c:forEach items="${dto.fileList}" var="file">
											<div class="pdthumb">
												<a href="javascript:;">
													<div class="thumb">
														<img src="${file.upload_path}" alt="">
													</div>
												</a>
											</div>
										</c:forEach>
									</div>
								</div> <!-- 동영상 --> <!-- 동영상 --> <!-- //.pdwrap --> <!--review-content-->
								<div class="review-content">
									<div class="review-txt">${dto.content }</div>
								</div> <!--//review-content-->
							</li>
						</c:forEach>
					</ul>
				</div>
				<!--//review-list-->

				<div class="paging itemEvalPaging">
					<div class="page-prevarea">
						
						<c:if test="${reviewpageMaker.prev }">
							<a href="javascript://" onclick="goToPageNumCore(1)"
								class="page-first" aria-label="처음페이지 이동"> <i class="icon"></i><span
								class="hiding">처음페이지 이동</span>
							</a>
							<a href="javascript://"
								onclick="goToPageNumCore(${reviewpageMaker.cri.pageNum - 1})"
								class="page-prev" aria-label="이전페이지 이동"> <i class="icon"></i><span
								class="hiding">이전페이지 이동</span>
							</a>
						</c:if>
						
						<c:forEach var="num" begin="${reviewpageMaker.startPage }"
							end="${reviewpageMaker.endPage }">
							<c:if test="${reviewpageMaker.cri.pageNum == num}">
								<strong aria-label="현재 선택페이지">${num}</strong>
							</c:if>
							<c:if test="${reviewpageMaker.cri.pageNum != num}">
								<a href="javascript://" onclick="goToPageNumCore(${num})">${num}</a>
							</c:if>
						</c:forEach>

						<c:if test="${reviewpageMaker.next }">
							<a href="javascript://"
								onclick="goToPageNumCore(${reviewpageMaker.cri.pageNum + 1})"
								class="page-next" aria-label="다음페이지 이동"><i class="icon"></i><span
								class="hiding">다음페이지 이동</span></a>
							<a href="javascript://"
								onclick="goToPageNumCore(${reviewpageMaker.realEnd})"
								class="page-last" aria-label="마지막페이지 이동"><i class="icon"></i><span
								class="hiding">마지막페이지 이동</span></a>
						</c:if>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!--//content-area // 상품평텍스트-->

	<!--// 상품평 -->

</body>

<script>

	// 마이페이지로 넘어가 댓글을 달기 전, 자격을 평가하는 함수
	// 마이페이지는 구조적으로 로그인 한 상태를 전제이나, 상품상세는 아닐 수 있으므로
	// anonymousUser 부터 체크
	function evalWriteCore(){
		var val_cur_user='${principal_user}';
		var prd_board_id = '${prd_board_id}';
		console.log(val_cur_user,prd_board_id);
		
		
		if (val_cur_user=='anonymousUser'){
			// 비로그인 시 로그인 팝업
			LoginPopup();
		} else{
			// 로그인 시
			val_cur_user='${principal_user_id}';
			console.log(val_cur_user);
			var val_reviewIsExist='${reviewIsExist}';
			console.log(val_cur_user, val_reviewIsExist);
			
			var val_reviewIsPossible='${reviewIsPossible}';
			console.log(val_reviewIsPossible);
			
			// 현재 게시판에 이미 댓글을 단지 판단
			if (val_reviewIsExist>0){
				alert('현재 상품게시판에 댓글이 등록되어있습니다');
			} else{
				// 해당 prd_board_id로 주문상세가 없는 경우 ; 임의로 step00
				if (val_reviewIsPossible=0){
					alert('상품평은 구매고객에 한해 작성이 가능합니다.');
					return
				}
				
				// 해당 prd_board_id로 최소 주문을 한 경우 ; step01~03 모두 포괄
				var result = confirm("상품평은 주문하신 상품이 발송된 후에 작성하실 수 있습니다. \n마이페이지로 이동하여 확인하시겠습니까?");
				
				if(result){
					location.href = '${app}/mypage/odslist';
				}
			}
			
		}
	}
	
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
				
		console.log(prd_board_id,prd_id);
		
		// insert 전 자격 체크, goto checkValidReview controller
		$.ajax({
			url : "${app}/r/checkValidReview",
			method : "POST",
			data : {
				user_id : val_cur_user,
				prd_board_id : prd_board_id,
				prd_id : prd_id
			},
			dataType : "json",
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(data) {
				//alert(JSON.stringify(data));
				if (data.reviewFlag == "Already") {
					alert('현재 상품게시판에 댓글이 등록되어있습니다');
				} else if(data.reviewFlag == "Possible"){
					
					let popUrl = "${app}/r/insert/" + val_cur_user+ "?prd_board_id=" + prd_board_id + "&&prd_id="+prd_id;
					console.log(popUrl);
					let popOption = "width = 600px, height=700px, top=300px, left=300px, scrollbars=yes";
					window.open(popUrl,"리뷰 쓰기",popOption);
					
				} else if(data.reviewFlag == "Possible"){
					alert('상품평은 구매고객에 한해 작성이 가능합니다.');
				}
			}
		});
	}
	
	/*
	 * 상품평 삭제 버튼, 자기 자신만 보인다.
	 */
	function DeleteReview(review_id){
		var token = $("input[name='_csrf']").val();
		var header = "X-CSRF-TOKEN";
		var prd_board_id = $("input[name='prd_board_id']").val();
		
		$.ajax({
			url : "${app}/r/deleteReview",
			method : "POST",
			data : {
				review_id : review_id,
				prd_board_id : prd_board_id
			},
			dataType : "json",
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(data) {
				//alert(JSON.stringify(data));
				if (data.delete_review_Success == "True") {
					location.reload();
				}
			}
		});
	}

</script>

<script>
	$(document).ready(function(){
		deleteCheck();
	});

	/* 댓글 리스트 생성 - test */
	function setReviewListTest(){
	      console.log("set review");
	      var str = "";
	     $.ajax({
	        type : "GET"
	        ,url : "${app}" + "/r/list"
	        ,dataType: 'json'
	        ,data : {
	          pageNum : 2,
	 		   amount : 10,
	 		   prd_board_id : "${prd_board_id}",
	 		   categoryCode : "${categoryCode}",
	 		   sort : 1
	        }
	        
	        ,success : function(data){
	       	 console.log(data);
	       	 // review information
	       	 console.log(data[0]);
	       	 // review paging info
	       	 console.log(data[1]);
	        }
	     });
	}

   
	//  unix time stamp to Date
   	function UnixTimeToDate(UnixTime){
		var origin = new Date(UnixTime);
		
		var year = origin.getFullYear();
		var month = ('0' + (origin.getMonth() + 1)).slice(-2);
		var day = ('0' + origin.getDate()).slice(-2);
		
		var val_time = year+"-"+month+"-"+day;
		
		return val_time;
   	}

	function ReadOptions(option1, option2){
		var val_str="";
		console.log(option1,option2);
		
		if(option1 == null){
			val_str="<em>색상/속성 : 단일상품</em><br>";
		} else if(option1 != null && option2 == null){
			val_str="<em>"+option1+"</em><br>";
		} else if(option1 != null && option2 != null){
			val_str="<em>"+option1+"/"+option2+"</em><br>";
		}
		console.log(val_str);
		return val_str;
	}
   
   	function ReadStarRate(star) {
	   var val_str="";
	   
	   switch (star) {
	   		case 1:
			  val_str="<div class='starbg pt2'><p class='score'></p></div> ";
			  break;
	   		case 2:
			  val_str="<div class='starbg pt4'><p class='score'></p></div> ";
			  break;
	   		case 3:
			  val_str="<div class='starbg pt6'><p class='score'></p></div> ";
			  break;
	   		case 4:
			  val_str="<div class='starbg pt8'><p class='score'></p></div> ";
			  break;
	   		case 5:
			  val_str="<div class='starbg pt10'><p class='score'></p></div> ";
			  break;
	   }
	   
	   return val_str;
   	}
   
   	function deleteCheck(user_id, review_id) {
 	   var val_str="";
 	   
 	   console.log('#','${principal_user}');
 	   
 	   if('${principal_user}' == 'anonymousUser'){
			val_str=" ";
 	   } else{
 		   // login user and review owner
 		   console.log('#','${principal_user_id}');
 		   if('${principal_user_id}'== user_id){
 			  val_str="<button><span class='nick' onclick='DeleteReview("+review_id+")'>삭제 </span></button> ";
 		   } else{
 			  val_str=" ";
 		   }
 	   }
 	   
 	   return val_str;
    }
   	
   	/* 댓글 리스트 생성 */
   	function setReviewList(){
       console.log("set review real");
       var sort = $("input[name='sort']").val();
	   var pageNum = $("input[name='pageNum']").val();
	   var prd_board_id = $("input[name='prd_board_id']").val();
	   var categoryCode = $("input[name='categoryCode']").val();
	   var amount = $("input[name='amount']").val();
	   var totalAmount = $("#total-amount");

	   console.log(sort);
	   console.log(pageNum);
	   console.log(prd_board_id);
	   console.log(categoryCode);
	   console.log(amount);
	   console.log(totalAmount);
	   try {
      	   loading(true);
          } catch (e) {
          }
      $.ajax({
         type : "GET"
         ,url : "${app}" + "/r/list"
         ,dataType: 'json'
         ,data : {
           pageNum : pageNum,
  		   amount : amount,
  		   prd_board_id : prd_board_id,
  		   categoryCode : categoryCode,
  		   sort : sort
         }
         ,crossDomain: true
         ,success : function(data){
        	console.log(data);
			console.log(data[0]);
        	 
			var str = "";
			// review content part ajax
			str += "<ul class='txt-review-list'>";
			for (let i = 0; i < data[0].length; i++) {
				// review item start
				str += "<li class='review-item'>";
				str += "<div class='review-top'>";
				
				str += "<div class='top-left'>"; // start of top-left

				str += ReadStarRate(data[0][i].star);
				
				str += "<span class='nick'>"+data[0][i].user_id+"</span>";

				str += "</div>"; // end of top-left

				str += "<div class='top-right'>"; // start of top-right
				str += deleteCheck(data[0][i].user_id,data[0][i].review_id);
				//str += "<span class='nick'>"+data[0][i].user_id+data[0][i].review_id+"</span> ";
				str += "<span class='date'>"+ UnixTimeToDate(data[0][i].ins_dt) + "</span>";
				str += "</div>"; // end of top-right
				
				str += "</div>"; // end-review-top
				
				// product option of review item
				str += "<div class='review-option'>";
				str += ReadOptions(data[0][i].option1,data[0][i].option2);
				str += "</div>";
				
				// img of review item
           	    str += "<div class='pdwrap photo-review'>";
           	    str += "<div class='pdlist-wrap'>";
				if(data[0][i].file_yn != 0){
					for (let j = 0; j < data[0][i].fileList.length ; j++){
	            	   str += "<div class='pdthumb'>";
	            	   str += "<a href='javascript:;'>";
	            	   str += "<div class='thumb'>";
	            	   str += "<img src=' ";
	            	   str += data[0][i].fileList[j].upload_path;
	            	   str += " '>";
	            	   str += "</div>";
	            	   str += "</a>";
	            	   str += "</div>";
					}
                }
       		    str += "</div>"; // end of pdlist-wrap
       		    str += "</div>"; // end pdwrap photo-review
       		    
				// content of review item
				str += "<div class='review-content'>";
				str += "<div class='review-txt'>"+data[0][i].content+"</div>";
				str += "</div>";
				
				str += "</li>"
				// review item end
			}
			str += "</ul>";
			$(".text-review-list-std").html(str);
            
			// paging part ajax
            var pstr = ""
                var pageMaker = data[1];
                if (pageMaker.prev){
                	pstr += "<a href='javascript://' onclick='goToPageNumCore(1)' class='page-first' aria-label='처음페이지 이동'> <i class='icon'></i><span class='hiding'>처음페이지 이동</span></a>"
                	pstr += "<a href='javascript://' onclick='goToPageNumCore(" + String(parseInt(pageMaker.cri.pageNum) - 1) + ")' class='page-prev' aria-label='이전페이지 이동'>"
    				pstr += "<i class='icon'></i><span class='hiding'>이전페이지 이동</span></a>"
                }
                for(let i = parseInt(pageMaker.startPage); i <= parseInt(pageMaker.endPage); i++){
                	if (i == pageMaker.cri.pageNum){
                		pstr += "<strong aria-label='현재 선택페이지'>" + i + "</strong>"
                	}
                	else {
                		pstr += "<a href='javascript://' onclick='goToPageNumCore(" + i + ")'>" + i + "</a>"
                	}
                }
                if (pageMaker.next){
                	pstr += "<a href='javascript://' onclick='goToPageNumCore(" + String(parseInt(pageMaker.cri.pageNum) + 1) + ")' class='page-next' aria-label='다음페이지 이동'> <i class='icon'></i><span class='hiding'>다음페이지 이동</span></a>"
        			pstr += "<a href='javascript://' onclick='goToPageNumCore(" + pageMaker.realEnd + ")' class='page-last' aria-label='마지막페이지 이동'> <i class='icon'></i><span class='hiding'>마지막페이지 이동</span></a>"
                }
                $(".page-prevarea").html(pstr);
                try {
             	   loading(false);
    	         } catch (e) {
    	         }
         },error : function(e) {
            console.log("review list");
         }
         ,complete: function () {                     
        	 $("#div_ajax_load_image").hide();       
         }
      });
   	}
   
   	function goToPageNumCore(pageNum){
	   $("input[name='pageNum']").val(pageNum);
	   
	   setReviewList();
   	}

   
   	//sort 바꾸기
   	function searchSort(type) {
		  $("input[name='sort']").val(type);
		  $("input[name='pageNum']").val(1);
		  $("#sort" + type).siblings().removeClass("active");
		  $("#sort" + type).addClass("active");
		  
		  setProductList();
		  
	}
   
</script>

</html>