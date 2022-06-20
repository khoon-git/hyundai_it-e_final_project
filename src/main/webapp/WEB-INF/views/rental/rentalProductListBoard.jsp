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
	   $("input[name='pageNum']").val(1);
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
   
   function beingRented(){
	   alert("해당 상품은 대여중입니다.");
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
    margin-top: 10px;
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

.nodata {
    margin-top: 154px;
}
</style>
</head>
<body>
<form id="pageform" method="get" action="${app}/rental/list">
	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"/>
	<input type="hidden" name="category" value="${categoryCode}"/>
	<input type="hidden" name="sort" value="${sort}"/>
	<input type="hidden" name="keyword" value="" />
</form>	
	<div class="wrap display-3depth">
		<main class="cmain main" role="main" id="mainContents">
			<c:if test="${pageMaker.total eq 0}">
			<div id="reflashArea" class="container">
				<div class="location">
					<ul class="loction-menu" data-modules-menus>
						<li data-menu class="home">
							<a href="${app}/">홈</a>
						</li>
						<li data-menu class="home">
							<a href="${app}/rental/main">기획전</a>
						</li>
						<li data-menu class>
							<a href="javascript://" onclick="changeCategory(${categoryCode})">${category}</a>
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
						<div class="nodata">
							<span class=" bgcircle"><i class="icon nodata-type7"></i></span>
							<p class="results-title">
								원하시는 대여물품이 없습니다.
							</p>
						</div>
					</div>
				</div>
			</div>
			</c:if>
			<c:if test="${pageMaker.total > 0}">
			<div id="reflashArea" class="container">
				<div class="location">
					<ul class="loction-menu" data-modules-menus>
						<li data-menu class="home">
							<a href="${app}/">홈</a>
						</li>
						<li data-menu class="home">
							<a href="${app}/rental/main">기획전</a>
						</li>
						<li data-menu class>
							<a href="javascript://" onclick="changeCategory('${categoryCode}')">${category}</a>
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
						<div class="display-list-wrap" id="itemListArea">
							<h2 class="title30">
								<c:if test="${pageMaker.cri.keyword == ''}">
									<span id="category-name">${category}</span> 
									<em	id="total-amount">(${pageMaker.total})</em>
								</c:if>
								<c:if test="${pageMaker.cri.keyword != ''}">
									<strong>${pageMaker.cri.keyword}</strong> 검색결과
                                	<em>(${pageMaker.total})</em>
								</c:if>
							</h2>
							<div class="list-sort-area">
								<div class="sortOption">
									<!--// 활성화시 a태그에 active 클래스 추가 -->
									<c:if test="${sort == 1}">
										<a href="javascript://" id="sort1" onclick="searchSort(1);" class="active">대여가능</a> 
										<a href="javascript://" id="sort2" onclick="searchSort(2);">전체보기</a> 
									</c:if>
									<c:if test="${sort == 2}">
										<a href="javascript://" id="sort1" onclick="searchSort(1);">대여가능</a> 
										<a href="javascript://" id="sort2" onclick="searchSort(2);" class="active">전체보기</a> 
									</c:if>
								</div>
								<div class="sort-form"></div>
								<div class="selectwrap" style="width: 238px;">
									<div class="inputbox sm">
									<label class="inplabel icon-find"><input type="text" name="txtItemNm" id="txtItemNm"
											value="" placeholder="상품명 검색"></label>
									<button class="btn btn-find" type="button" id="serach" onclick="searchbtn()">
										<i class="icon find"></i><span class="hiding">검색</span>
									</button>
									<button class="btn ico-clearabled">
										<i class="icon"></i><span class="hiding">지우기</span>
									</button>
								</div>
								</div>
							</div>
								<div class="pdlist-wrap" id="pdListDiv">
									<ul>
										<c:forEach items="${rentallsit}" var="list">
											<c:if test="${list.rental_yn}">
											<!-- 상품시작 -->
											<li class="pdthumb">
												<!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
												<a href="${app}/rental/${list.prd_id}">
													<div class="thumb">
														<img src="${list.prd_image}" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
													</div>
													<div class="figcaption">
														<div class="pdname" aria-label="제품명">${list.prd_nm}</div>
														<div class="pdinfo">
						                                    <div class="benefits">
						                                         <span style="color: #f4b417">대여가능</span>
						                                    </div>
						                                </div>
													</div>
												</a>
												<a href="${app}/rental/${list.prd_id}" target="_blank" class="hoverview"><i class="icon"></i>새창열기</a>		
											</li>
											<!-- 상품 끝 -->
											</c:if>
											<c:if test="${!list.rental_yn}">
											<!-- 상품시작 -->
											<li class="pdthumb">
												<!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
												<a href="javascript://" onclick="beingRented()">
													<div class="thumb">
														<img src="${list.prd_image}" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
													</div>
													<div class="figcaption">
														<div class="pdname" aria-label="제품명">${list.prd_nm}</div>
														<div class="pdinfo">
						                                    <div class="benefits">
						                                         <span style="color: #ff0000">대여중</span>
						                                    </div>
						                                </div>
													</div>
												</a>
												<a href="javascript://" onclick="beingRented()" class="hoverview"><i class="icon"></i>새창열기</a>		
											</li>
											<!-- 상품 끝 -->
											</c:if>
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