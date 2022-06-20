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
  /* 상품 리스트 */
   function setProductList(){
	  $("#pageform").submit();
   }
  
   //sort 바꾸기
   function searchSort(type) {
		  $("input[name='sort']").val(type);
		  $("input[name='pageNum']").val(1);
		  $("#sort" + type).siblings().removeClass("active");
		  $("#sort" + type).addClass("active");
		  setProductList();
	  }
   // page변경
   function goToPageNum(pageNum){
	   $("input[name='pageNum']").val(pageNum);
	   setProductList();
   }
   //keyword검색
   function search(keyword){
	   $("input[name='keyword']").val(keyword);
	   setProductList();
   }
   
   //category검색
   function changeCategory(category){
	   $("input[name='category']").val(category);
	   setProductList();
   }
   
   $(function () {
	    $("#txtItemNm").keyup(function (e) {
	    	if (e.keyCode == 13) {   		
	    		var keyword = $("input[name='txtItemNm']").val();
	    		search(keyword);
	    	}
	    })
   })
   
   function searchbtn(){
	    var keyword = $("input[name='txtItemNm']").val();
		search(keyword);
   }
   
</script>
<style>
.allView{
	position: absolute;
    right: 0;
    transform: translateY(-50%);
    padding-right: 13px;
    background: url(//image.hmall.com/p/img/co/icon/ico-arrow-sm.png) no-repeat 100% 50%;
    color: #000;
    font-size: 15px;
    margin-bottom : 10px;
}

.side{
	display: inline-block;
    width: 250px;
    font-size: 14px;
}

.side .itemWrap {
    padding-top: 25px;
    margin-bottom: 25px;
    border-top: 1px solid #aaaaaa;
    margin-top: 10px
}

.side .itemWrap dl {
    height: 662px;
    overflow-x: hidden;
    overflow-y: auto;
}
.side .itemWrap dl dt:first-child {
    margin-top: 0;
    margin-bottom: 15px;
}

.side .itemWrap dl dt a {
    display: block;
    color: #333;
    font-size: 16px;
    font-weight: bold;
}

.side .itemWrap dl dd ul li {
    margin-bottom: 15px;
}

.side .itemWrap dl dd ul li a {
    display: block;
}
</style>
</head>
<body>
<form id="pageform" method="get" action="${app}/rental/list">
	<input type="hidden" name="pageNum" value="1"/>
	<input type="hidden" name="category" value="${categoryCode}"/>
	<input type="hidden" name="sort" value="1"/>
	<input type="hidden" name="keyword" value="" />
</form>	
	
	<div class="wrap display-3depth">
		<main class="cmain main" role="main" id="mainContents">
			<div id="reflashArea" class="container">
				<div class="location">
					<ul class="loction-menu" data-modules-menus>
						<li data-menu class="home">
							<a href="${app}/">홈</a>
						</li>
						<li data-menu class="home">
							<a href="${app}/rental/main">기획전</a>
						</li>
					</ul>
				</div>
				<div class="gird-l2x">
					<div class="side">
			                <a href="#allViewLayer" class="btnAllView" data-fn-layer="showAllBrand">기획전</a>
			            <!-- itemWrap -->
			            <div class="itemWrap">
			                <dl>
			                <!-- 좌측영역 LOOP1 -->
			                    <dt><a href="#">카테고리</a></dt>
			                        <!-- ## 상위그룹매장  --
			                        <!-- 좌측영역 LOOP2 -->
			                        <c:forEach items="${categorylist}" var="categorylist">
			                        <dd>
			                            <ul>
				                           <li><a href="javascript://" onclick="changeCategory('${categorylist.category_id}');">${categorylist.category_name}</a></li>   
			                            </ul> 
			                        </dd> 
			                         </c:forEach>
			                         <!-- // 좌측영역 LOOP2 -->
			                <!-- // 좌측영역 LOOP1 -->
			                </dl>
			            </div>
			            <!-- // itemWrap -->
			        </div>
					<div class="contents" id="pl_main">
						
						<div class="visual-wrap" style="background: #7d0ffa; margin-bottom: 104px">
							<div class="tit">
								<img src="${app}/resources/images/rentalevent.png"
									alt="cool한 대여하기"
									onerror="noImage(this, '//image.hmall.com/p/img/co/noimg-thumb.png')" width="800" height="800">
							</div>
						</div>
						<div class="display-list-wrap" id="itemListArea">
							<div class="title30" style="margin-bottom: 15px;margin-top: 15px;">
									<h3>MD강력추천! ${category}</h3>
									<a href="javascript://" id="sort2" onclick="searchSort(1);" class="allView"><em>전체보기</em></a>
							</div>
							
							<div class="list-sort-area" >
							
							</div>
								<div class="pdlist-wrap" id="pdListDiv">
									<ul>
										<c:forEach items="${rentallsit}" var="list">
											<!-- 상품시작 -->
											<li class="pdthumb">
												<!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
												<a href="${app}/rental/${list.prd_id}">
													<div class="thumb">
														<img src="${list.prd_image}" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
													</div>
													<div class="figcaption">
														<div class="pdname" aria-label="제품명">${list.prd_nm}</div>
													</div>
												</a>
														
											</li>
											<!-- 상품 끝 -->
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
					</div>
			</div>
		</main>
	</div>
</body>
</html>