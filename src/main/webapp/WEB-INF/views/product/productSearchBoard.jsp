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

function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
   
   /* 상품 리스트 생성 */
   function setProductList(){
	   window.scrollTo({ left: 0, top: 0});
	   var pageNum = $("input[name='pageNum']").val();
	   var keyword = $("input[name='keyword']").val();
	   var totalAmount = $("#total-amount");
      $.ajax({
         type : "GET"
         ,url : "${app}" + "/p/search"
         ,dataType: 'json'
         ,data : {
           keyword : keyword,
           pageNum : pageNum
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
           	   str += "<img src='"+ data[0][i].prd_board_img +"'"
   			   str += "alt='제품이미지입니다.' id='2141327733_img' onerror='noImage(this, " + "'" + "https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0" + "'" + ")'></div>"                   
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
               str += "<div class='pdinfo'><div class='benefits' style='line-height: 20px;'><span>현대7%</span></div>";
  	  		   str += "</div></div></a>";
  	  		   str += "<a href='${app}/p/" + data[0][i].prd_board_id + "' target='_blank' class='hoverview'><i class='icon'></i>새창열기</a>";
  	  		   str += "<div class='alimlike' data-slitmcd='2141048469' data-bsitmcd='2141048469'>";
  	  		   str += "<a href='#' class='btn btn-like' onclick=''>";
  	  		   str += "<i class='icon'></i><span class='hiding'>찜</span></a></div></li>";
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
            try {
         	   loading(false);
	         } catch (e) {
	         }
            
         },error : function(e) {
            console.log("product list");
         }
         ,complete: function () {                     
        	 $("#div_ajax_load_image").hide();       
         }
      });
   }
   
   function goToPageNum(pageNum){
	   $("input[name='pageNum']").val(pageNum);
	   
	   setProductList();
   }
</script>
</head>
<body>
<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"/>
<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}"/>
	<div class="wrap display-3depth">
		<main class="cmain results" role="main" id="mainContents">
			<c:if test="${pageMaker.total eq 0}">
			<div class="container">
				<div class="contents">
					<div class="nodata">
						<p class="results-title">
							<strong>${pageMaker.cri.keyword}</strong>검색결과가 없습니다.
						</p>
						<p>검색어가 올바르게 입력 되었는지 확인해 주세요.</p>
						<p>두 단어 이상의 검색어인 경우, 띄어쓰기를 확인해 주세요.</p>
					</div>
				</div>
			</div>
			</c:if>
			<c:if test="${pageMaker.total > 0}"> 
			<div id="reflashArea" class="container">
				<div class="container gird-l2x">
					<div class="contents" id="pl_main">
						<div class="display-list-wrap" id="itemListArea">
							<p class="results-title" id="search_title">
								<strong>${pageMaker.cri.keyword}</strong> 검색결과
                                <em>(${pageMaker.total})</em>
                            </p>
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
			</c:if>
		</main>
	</div>
</body>
</html>