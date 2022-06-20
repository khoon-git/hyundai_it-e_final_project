<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="app" value="${pageContext.request.contextPath}" />
<c:set var="category" value="${category}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//image.hmall.com/p/js/co/jquery-3.4.1.min.js"></script><!-- jQuery Plugin -->
<script src="//image.hmall.com/p/js/co/jquery.easing.min.js"></script><!-- jQuery UI Effect -->
<script src="//image.hmall.com/p/js/co/jquery-ui.1.12.1.min.js"></script><!-- jQuery UI js -->
<script src="//image.hmall.com/p/js/co/ukDetect.min.js"></script><!-- UI에 사용하는 Detect -->
<script src="//image.hmall.com/p/js/co/slick.min.js"></script><!-- 공통 Slide 플러그인 -->
<link rel="stylesheet" type="text/css" href="${app}/resources/css/display.css">
<link rel="stylesheet" type="text/css" href="${app}/resources/css/prd-list.css">
<link rel="stylesheet" type="text/css" href="${app}/resources/css/search.css">  
<script type="text/javascript" src="${app}/resources/js/commonFunction.js"></script>   
<script src="https://www.googleoptimize.com/optimize.js?id=OPT-NBGRL7P"></script> 

<script>
$(document).ready(function(){
});
//공통 호버
$(document).on('mouseenter mouseleave', '.pdlist-wrap .pdthumb .thumb', function(e){
    var $this = $(this);
    var target = $this.closest('.pdthumb');
    var evType = e.type;
    if(e.type == 'mouseenter'){
    	target.addClass('ui-hover');
    }else if(e.type == 'mouseleave'){
        target.removeClass('ui-hover')
    }
})
.on('mouseenter', '.pdlist-wrap .pdthumb .hoverview', function(e){
    var $this = $(this);
    var target = $this.closest('.pdthumb');
    target.addClass('ui-hover');
})
   /* 상품 리스트 생성 - test */
   function setProductListTest(){
       console.log("set productlist by insert day");
       var str = "";
      $.ajax({
         type : "GET"
         ,url : "${app}" + "/p/list"
         ,dataType: 'json'
         ,data : {
           pageNum : 1,
  		   amount : 30,
  		   categoryCode : "${categoryCode}",
  		   sort : 1
         }
         
         ,success : function(data){
        	 console.log(data);
         }
      });
   }
   
   function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
   
   /* 상품 리스트 생성 */
   function setProductList(){
	   window.scrollTo({ left: 0, top: 0});
       var sort = $("input[name='sort']").val();
	   var pageNum = $("input[name='pageNum']").val();
	   var categoryCode = $("input[name='categoryCode']").val();
	   var amount = $("input[name='amount']").val();
	   var totalAmount = $("#total-amount");
	   var no_image_url = "https://image.hmall.com/hmall/pd/no_image_100x100.jpg";
      $.ajax({
         type : "GET"
         ,url : "${app}" + "/p/list"
         ,dataType: 'json'
         ,data : {
           pageNum : pageNum,
  		   amount : amount,
  		   categoryCode : categoryCode,
  		   sort : sort
         }
         ,crossDomain: true
         ,beforeSend: function () {              
        	 var width = 0;              
        	 var height = 0;              
        	 var left = 0;              
        	 var top = 0;
             width = 50;              
         	 height = 50;
             top = ( $(window).height() - height ) / 2 + $(window).scrollTop();              
             left = ( $(window).width() - width ) / 2 + $(window).scrollLeft();
             if($("#div_ajax_load_image").length != 0) {                     
        	 	$("#div_ajax_load_image").css({                            
        	 		"top": top+"px",                            
        	 		"left": left+"px"                     
        	 		});                     
        	 		$("#div_ajax_load_image").show();              
        	 }              
        	 else {                     
        		 $('body').append(
        				 '<div id="div_ajax_load_image" style="position:absolute; top:' + top + 
        				 'px; left:' + left + 'px; width:' + width + 
        				 'px; height:' + height + 
        				 'px; z-index:9999; background:#f0f0f0; filter:alpha(opacity=50); opacity:alpha*0.5; margin:auto; padding:0; "><img src="https://t1.daumcdn.net/cfile/tistory/233F6D505786DA870A" style="width:50px; height:50px;"></div>');              }
            }       
         ,success : function(data){
  			console.log(data[0]);
        	var str = "";
        	str += "<ul>"
            for (let i = 0; i < data[0].length; i++) {
               str += "<li class='pdthumb'>"
               str += "<a href='${app}/p/" + data[0][i].prd_board_id + "'>"
               str += "<div class='thumb'>"
               str += "<img src='" + data[0][i].prd_board_img + "' alt='제품이미지입니다.' onerror=" + `"noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&AR=0')">`
			   str += "</div>"
               str += "<div class='figcaption'><div class='pdname' aria-label='제품명'>"
               str += data[0][i].title
               str += "</div>"
               if(parseInt(data[0][i].discount_rate) != 0){
            	   str += "<div class='pdprice'>"
            	   str += "<span class='rateprice' aria-label='할인율이 적용된 가격'>"
            	   str += "<p class='discount' aria-label='할인가'><em>"
            	   var p = parseInt(data[0][i].price) * (1 - (parseInt(data[0][i].discount_rate) / 100))
            	   var price = p+(10-(p%10))%10
            	   str += numberWithCommas(parseInt(price))
            	   str += "</em>원"
            	   str += "</p> <em class='rate' aria-label='할인율'>"
            	   str += data[0][i].discount_rate
            	   str += "<i>%</i></em> <del class='normal' aria-label='정상가'>"
            	   str += numberWithCommas(data[0][i].price)
            	   str += "</del></span></div>"
               }
               else{
            	   str += "<div class='pdprice'>"
            	   str += "<span class='rateprice' aria-label='정상가 가격'><p class='discount' aria-label='정상가'><em>"
            	   str += numberWithCommas(data[0][i].price)
            	   str += "</em>원</p></span></div>"
               }
               str += "<div class='pdinfo'><div class='benefits' style='line-height: 20px;'></div>";
  	  		   str += "</div></div></a>";
  	  		   str += "<a href='${app}/p/" + data[0][i].prd_board_id + "' target='_blank' class='hoverview'><i class='icon'></i>새창열기</a>";
               str += "</div></a></li>";
            }
            str += "</ul></div>"
            $(".pdlist-wrap").html(str);
            
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
         },error : function(e) {
            console.log("product list");
         }
         ,complete: function () {                     
        	 $("#div_ajax_load_image").hide();       
         }
      });
   }
   
   // listSize 변경으로 상품 리스트 재조회
   function listSubmit(val){
       var listSize = $(val).val();
       $("form[name='pdeSearchForm']").find("input[name='listSize']").val(listSize);
       $("input[name='amount']").val(listSize);
       $("input[name='pageNum']").val(1);
       setProductList();
   }
   
   //sort 바꾸기
   function searchSort(type) {
		  $("input[name='sort']").val(type);
		  $("input[name='pageNum']").val(1);
		  $("#sort" + type).siblings().removeClass("active");
		  $("#sort" + type).addClass("active");
		  
		  setProductList();
		  
	  }
   
   function goToPageNum(pageNum){
	   $("input[name='pageNum']").val(pageNum);
	   
	   setProductList();
   }
</script>
</head>
<body>
	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"/>
  	<input type="hidden" name="amount" value="${pageMaker.cri.amount}"/>
	<input type="hidden" name="categoryCode" value="${categoryCode}"/>
	<input type="hidden" name="sort" value="1"/>
	
	<div class="wrap display-3depth">
		<main class="cmain main" role="main" id="mainContents">
			<div id="reflashArea" class="container">
				<div class="location">
					<ul class="loction-menu" data-modules-menus>
						<li data-menu class="home">
							<a href="${app}/">홈</a>
						</li>
						<li data-menu class>
							<a href="${app}/p/productlist/?category=${categoryCode}">${category}</a>
						</li>
					</ul>
				</div>
				<div class="gird-l2x">
					<div class="contents" id="pl_main">

						<div class="display-list-wrap" id="itemListArea">

							<h2 class="title30">
								<span id="category-name">${category}</span> 
								<em	id="total-amount">(${pageMaker.total})</em>
							</h2>

							<div class="list-sort-area">
								<div class="sortOption">
									<!--// 활성화시 a태그에 active 클래스 추가 -->
									<a href="javascript://" id="sort1" onclick="searchSort(1);" class="active">최근등록순</a> 
									<a href="javascript://" id="sort2" onclick="searchSort(2);">낮은가격순</a> 
									<a href="javascript://" id="sort3" onclick="searchSort(3);">높은가격순</a>
								</div>

								<div class="sort-form"></div>

								<div class="selectwrap">
									<div id="selectListSize" class="custom-selectbox sm"
										data-modules-selectbox="">
										<select id="listSize" onchange="javascript:listSubmit(this);">
											<option value="15" selected="selected">15개씩 보기</option>
											<option value="30">30개씩 보기</option>
											<option value="60">60개씩 보기</option>
										</select>
									</div>
								</div>
							</div>
								<div class="pdlist-wrap" id="pdListDiv">
									<ul>
										<c:forEach items="${productBoardDTO}" var="list">
											<!-- 상품시작 -->
											<li class="pdthumb">
												<!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
												<a href="${app}/p/${list.prd_board_id}">
													<div class="thumb">
														<img src="${list.prd_board_img}" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
													</div>
													<div class="figcaption">
														<div class="pdname" aria-label="제품명">${list.title}</div>
														<c:if test="${list.discount_rate != 0}">
															<div class="pdprice">
																<span class="rateprice" aria-label="할인율이 적용된 가격">
																	<p class="discount" aria-label="할인가">
																		<c:set var="d_price" value="${list.price * (1 - (list.discount_rate / 100))}" />
																		<em id="discount-price"><fmt:formatNumber value="${d_price+(10-(d_price%10))%10}" pattern="###,###,###" /></em>원
																	</p> <em class="rate" aria-label="할인율">${list.discount_rate}<i>%</i>
																</em> <del class="normal" aria-label="정상가"><fmt:formatNumber value="${list.price}" pattern="###,###,###" /></del>
																</span>
															</div>
														</c:if>
														<c:if test="${list.discount_rate == 0}">
															<div class="pdprice">
																<span class="rateprice" aria-label="정상가 가격">
																	<p class="discount" aria-label="정상가">
																		<em><fmt:formatNumber value="${list.price}" pattern="###,###,###" /></em>원
																	</p>
																</span>
															</div>
														</c:if>
														<div class="pdinfo"><div class="benefits" style="line-height: 20px;"></div></div>
													</div>
											</a>
											<a href="${app}/p/${list.prd_board_id}" target="_blank" class="hoverview"><i class="icon"></i>새창열기</a>
											</li>
											<!-- 상품 끝 -->
										</c:forEach>
									</ul>
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
							</div>
						</div>
					</div>
			</div>
		</main>
	</div>
</body>
</html>