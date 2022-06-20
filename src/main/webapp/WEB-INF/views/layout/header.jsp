<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="app" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<spring:eval expression="@chatbotProperties['Api.key']" var="apiKey"/>
<!-- header -->
<script type="text/javascript" src="//image.hmall.com/gen/js/searchPopKeyWordList.js?ver=050417"></script>
<script type="text/javascript" src="//image.hmall.com/gen/js/searchADTextList.js?ver=050417" charset="UTF-8"></script>
<script type="text/javascript" src="//image.hmall.com/gen/js/searchADLinkList.js?ver=050417" charset="UTF-8"></script>
<script type="text/javascript" src="//image.hmall.com/gen/js/searchSpecialShopLinkList.js?ver=050417" charset="UTF-8"></script>
<script type="text/javascript" src="//image.hmall.com/gen/js/searchBrndShopLinkList.js?ver=050417" charset="UTF-8"></script>

<script type="text/javascript"
   src="<c:url value="/webjars/jquery/3.6.0/dist/jquery.js" />"></script>
<script type="text/javascript" src="${app}/resources/js/common-pub.js"></script>
<script type="text/javascript" src="${app}/resources/js/common.js"></script>
<script type="text/javascript" src="${app}/resources/js/common-pub.js"></script>
<script type="text/javascript" src="${app}/resources/js/commonFunction.js"></script>

<script type="text/javascript">
         $(function(){
             commonPub.common();
         })
</script>   

<link rel="shortcut icon" href="https://www.hmall.com/favicon.ico" />
<!-- UI/UX Style -->
<link rel="stylesheet" type="text/css" href="${app}/resources/css/common.css"><!-- 공통 css -->
<link rel="stylesheet" type="text/css" href="${app}/resources/css/layout.css"><!-- 공통 Layout css -->
<link rel="stylesheet" type="text/css" href="${app}/resources/css/popup.css"><!-- 공통 Popup css -->
<link rel="stylesheet" type="text/css" href="${app}/resources/css/jquery-ui.css"><!-- jQuery UI css -->
<style>
.header_wrap {
    max-width: 1081px;;
    margin: 0 auto;
    position: relative;
    height: 35px;
    margin-bottom: 23px;
}


.header_top {
    background: #f6d159;
}

.top_intro {
    float: right;
    font-size: 0;
}

a {
    color: #ed5c22;
    text-decoration: none;
}
.top_intro_ko {
    margin-right: 5px;
}
.top_menu {
    float: right;
}
ol, ul {
    list-style: none;
}

.signup-event {
    font-size: 12px;
    color: #fff;
    border-radius: 5px;
    background: #231916;
    padding: 5px;
    position: absolute;
    top: 40px;
    right: 100px;
    animation-name: signupbox;
    animation-duration: 2s;
    animation-iteration-count: infinite;
}
.header_wrap:after {
    content: '';
    display: table;
    clear: both;
}


::selection {
    background: rgba(255, 164, 128, .35);
    color: #666;
}
.header_top ::selection {
    color: #fff;
}
.top_menu > li {
    float: left;
    position: relative;
}
.top_menu > li > a:hover {
    color: #fff;
}
.top_menu > li > a {
    display: block;
    padding: 8px 10px 9px;
    position: relative;
    font-size: 12px;
    letter-spacing: -0.025em;
    font-weight: 400;
    color: #333;
    -webkit-transition: color 300ms;
    transition: color 300ms;
}

ol:after, ul:after {
    content: '';
    clear: both;
    display: table;
}
ol, ul {
    list-style: none;
}
.search .field:hover {
opacity : 1;
border : solid 1px;
color: #ed5c22;
}


.signup-event::after {
    content: "";
    width: 0;
    height: 0;
    border-left: 7px solid transparent;
    border-right: 7px solid transparent;
    border-bottom: 7px solid #fff;
    display: block;
    position: absolute;
    top: -7px;
    left: 36px;
    z-index: 990;
}
.signup-event::before {
    content: "";
    width: 0;
    height: 0;
    border-left: 5px solid transparent;
    border-right: 5px solid transparent;
    border-bottom: 5px solid #231916;
    display: block;
    position: absolute;
    top: -5px;
    left: 38px;
    z-index: 1000;
}
.quick-menu-wrap .quick-menu-list ul li > sup {
    position: absolute;
    top: 4px;
    width: 67%;
    font-size: 11px;
    color: #ff5340;
    text-align: center;
    line-height: 22px;
    letter-spacing: -0.4px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    opacity: 0.8;
}

@keyframes signupbox {
  0% {top:40px;}
  50% {top:35px;}
  100% {top:40px;}
}

.signup-event_rog::after {
    content: "";
    width: 0;
    height: 0;
    border-left: 7px solid transparent;
    border-right: 7px solid transparent;
    border-bottom: 7px solid #fff;
    display: block;
    position: absolute;
    top: -7px;
    left: 23px;
    z-index: 990;
}
.signup-event_rog::before {
    content: "";
    width: 0;
    height: 0;
    border-left: 5px solid transparent;
    border-right: 5px solid transparent;
    border-bottom: 5px solid #231916;
    display: block;
    position: absolute;
    top: -5px;
    left: 25px;
    z-index: 1000;
}
.signup-event_rog {
    font-size: 12px;
    color: #fff;
    border-radius: 5px;
    background: #231916;
    padding: 5px;
    position: absolute;
    top: 40px;
    right: 70px;
    animation-name: signupbox;
    animation-duration: 2s;
    animation-iteration-count: infinite;
}



</style>
<script src="http://code.jquery.com/jquery-3.5.1.js"
   integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
   crossorigin="anonymous"></script>

<script>
$(document).ready(function(){
   setCategory();
   var formObj = $("form[role='form']");
   var logoutForm = $("#logoutForm");
   
   $("#logoutBtn").on("click", function(e) {
     e.preventDefault();
     logoutForm.submit();
   });
    

});
   
    $('#popupBtn').on("click", function() {
       var make_date = $("#make_date").val(); //화면의 파라미터 가져오기
        window.open(app + "/loginpopup", "_blank", "toolbar=yes, menubar=yes, width=540, height=700").focus();
    });
   
    function Logout(){
       logoutForm.submit();
    }
     //이외 영역 클릭 시 카테고리 메뉴 숨김 처리
   $(document).on("click", function() {
      if($('.category-menu-wrap').is(':visible')){
         $('.category-menu-wrap').hide();
      }
   });
  
   function cate_f_add(data){
      var category_menu_wrap = $(".category-menu-wrap"); // 세부카테고리 생성을 위해 그 위에 있는 div 잡기
      var cate_id = data.category_id; // 카테고리 n-key
      var cate_code = data.cate_detail_lev; //카테고리 디테일 숫자
      var cate_name = data.category_name; //입력할 글씨
      var ul_list = $("#cate-f"); //ul_list선언
      ul_list.append("<li data-catecode="+cate_code+">"+"<a href=#>"+cate_name+"</a></li>"); //ul_list안쪽에 li추가
   }    
   
   /* GNB - 카테고리 vs008 */
   function setCategory(){
       var str = "";
      $.ajax({
         type : "get"
         //,url : "/p/coe/getSectCtgr.do"
         ,url : "${app}" + "/category"
         ,crossDomain: true
         ,success : function(data){
            var parentCategory = [];   
            var chCategory = [];
            for(let i = 0; i < data.length; i++){
               if(data[i].parent_lev == '0'){
                  parentCategory.push(data[i]);
               }
               else{
                  chCategory.push(data[i]);
               }
            }
            var ul_list = $("#cate-f"); //ul_list선언
            for (i in parentCategory) {
               cate_f_add(parentCategory[i]);
            }
            
            for (let i = 0; i < parentCategory.length; i++) {
               str += "<div class='category-list-contents' data-catecode='" + parentCategory[i].cate_detail_lev +"' style='display:none; height: auto;'>"
               str += "<div class='center-area'>"
               str += "<strong class='depth1-title'>" + parentCategory[i].category_name + "</strong>";
               str += "<div class='sub-category-area'><div class='sub-category'><ul>";
               for (let j = 0; j < chCategory.length; j++) {
                  if (parentCategory[i].cate_detail_lev == chCategory[j].parent_detail_lev) {
                     str += "<li><a href='${app}/p/productlist?category=" + chCategory[j].category_id + "'>" + chCategory[j].category_name + "</a></li>";
                  }
               }
               str += "</ul></div></div></div></div>";
            }
            
            $(".category-list li:first, .category-list-contents:first").addClass("on");
            $(".category-menu-wrap").append(str);
            cateNavigation();
         },error : function(e) {
            console.log("카테고리에러");
         }
      });
   }
   /* GNB - 카테고리 공통 common 동작 추가 (category append 이후 동작 처리) */
    function cateNavigation(option) {
      var $selector = $('#categoryArea');
      var _default = {
         menuWrap : '.category-menu-wrap',
         btn : '.btn-category',
         mainList : '.category-list',
         contents : '.category-list-contents',
         index : 0,
      }
      var _option = $.extend({}, _default, option)
      var $menuWrap = $(_option["menuWrap"])
      var $mainMenu = $menuWrap.find(_option.mainList)
      var $menuList = $menuWrap.find(_option.mainList + ' li')
      var $contents = $(_option["contents"])
      var _index = _option["index"]
      var init_renew = function(){
         if(!$selector.length){
            console.log('No elements. "' + _selector + '"')
         }
         onClickHandler_renew()
         onMenuOverHandler_renew()
      }
      var onClickHandler_renew = function(){
         $selector.on('click', _option.btn, function(e){
            e.stopPropagation()
            if($menuWrap.is(':visible')){
               $menuWrap.hide()
            } else {
               $menuWrap.show()
               showMenuByIndex_renew(_index)
               equalizeHeight_renew(_index)
               
               //검색창 숨김 처리
               $('#search-autowrap').hide();
               $("#search-popup").hide();
               $(".header .search").removeClass("selected");
               
               //퀵 메뉴 숨김 처리
               $('.quick-menu-more').removeClass('on');
            }
         })
      }
      var onMenuOverHandler_renew = function(){
         $menuList.on('mouseenter', function(e){
            var index = $(e.target).closest('li').index()
            showMenuByIndex_renew(index)
            equalizeHeight_renew(index)
         })
      }
      var showMenuByIndex_renew = function(index){
         _index = index
         $menuList.removeClass('on').eq(_index).addClass('on')
         $contents.hide().closest("[data-catecode='"+$menuList.eq(_index).data('catecode')+"']").show()
      }
      var equalizeHeight_renew = function(index){
         var $currentContents = $contents.hide().closest("[data-catecode='"+$menuList.eq(_index).data('catecode')+"']").show()
         var maintHeight = $mainMenu.outerHeight()
         var currentContentsHeight = $currentContents.outerHeight()
         if(maintHeight > currentContentsHeight){
            $currentContents.height(maintHeight-2)
         } else if(currentContentsHeight > maintHeight){
            $mainMenu.height(currentContentsHeight)
         }
      }
      init_renew()
      return this;
      
   }
$("input[name='searchTerm']").on("keyup",function(key){         
	if(key.keyCode==13) {       
		var keyword = $("input[name='searchTerm']").val();
		location.href = "${app}/p/search?keyword=" + keyword;   
	}     
});       
function doSearch(){
	var keyword = $("input[name='searchTerm']").val();
	location.href = "${app}/p/search?keyword=" + keyword;
}
function LoginPopup(){
   var make_date = $("#make_date").val(); //화면의 파라미터 가져오기
     window.open("${app}" + "/loginpopup", "_blank", "toolbar=yes, menubar=yes, width=600, height=700").focus();
}

</script>
<div class="header_top">
    <div class="header_wrap">
        <div class="top_intro">
            <a lang="en" class="top_intro_ko" href="../service/company.php">
                <b>회사소개</b>
            </a>        
        </div>
       <!-- 로그인 전 -->       
       <sec:authorize access="isAnonymous()">       
        <ul class="top_menu">
            <li><a href="javascript://" onclick="LoginPopup()"><span class ="headerspan">로그인</span></a></li>
            <li><a href="${app}/signUp/signUpStart"><span class ="headerspan" >회원가입</span></a></li>
            <li><a href="${app}/cs/main.do"><span class ="headerspan" >고객센터</span></a></li>
       </ul>
       <div class="signup-event">
			 대여 서비스 오픈 !
		</div>
        </sec:authorize>
        <!-- 로그인 후 -->
        <sec:authorize access="isAuthenticated()">
         <ul class="top_menu">
             <li>
             <form id="logoutForm" action="${app}/customLogout" method="post">
             	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
             </form> 
             <a href="javascript://" id = "logoutBtn"><span class ="headerspan">로그아웃</span></a></li>
			<li><a href="${app}/cs/main.do"><span class ="headerspan" >고객센터</span></a></li>
          </ul><!-- .top_menu -->
          <div class="signup-event_rog">
			 Welcome!
		</div>
          
        </sec:authorize>
		

    </div><!-- .header_wrap -->
</div>
<header class="header">
    <div class="extra_bannerWrap">
        <iframe id="parent_iframe" src="/extra_banner.html" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" style="width:100%; height:0;"></iframe>
    </div>
    <div class="header-top">
        <h1 class="logo"><a href="${app}/" title="현대Hmall">Hmall</a></h1>
        <div class="search" role="search">
            <div class="field">
                <form name="gnbPdeSearchForm" method="get" accept-charset="UTF-8" class="main-search" onsubmit="event.preventDefault();">
                    <div class="inputbox">
                        <label class="inplabel">
                            <input type="text" id="gnbSearchKeyword" name="searchTerm"
                                    value=""
                                    autocomplete="off" title="검색어" size="88"/>
                        </label>
                        <button class="btn ico-clearabled" type="button" onclick="javascript:clearWord();"><i id="searchDeleteX" class="icon"></i><span class="hiding">지우기</span></button>
                        <button class="btn btn-search" onclick="doSearch();"><span>검색</span></button>
                        <input type="hidden" name="gnbSearchYn" value="Y">
                    </div>
                </form>
            </div>
            <!-- //.field -->
        </div>
        <!-- // 검색 영역 -->

        <!-- 개인화 메뉴 -->
        <div class="personal-menu">
            <ul>
                <li>
                    <a class="cart" ga-category="헤더" ga-action="장바구니" href="${app}/basktList">
                        <span>장바구니</span>
                    </a>
                </li>
                <li><a class="mypage" href="${app}/mypage/mymain"><span>마이페이지</span></a></li>
                <li>
                    <a href="${app}/mypage/retalListgo" class="recently" id="recentlyImg">
                        <span>나의 대여</span>
                        <!-- 최근 본 상품 썸네일 이미지 -->
                        <em class="thumb-recent"></em>
                    </a>
                </li>
            </ul>
        </div>
        <!-- // 개인화 메뉴 -->
    </div>

    <div class="header-menu-wrap">
        <div class="header-menu-in">
            <!-- 카테고리 메뉴 -->
            <div class="category-area" id="categoryArea">
                <a href="javascript:;" class="btn-category">카테고리</a>
                <!-- 카테고리 메뉴 시작 -->
            
               <div class="category-menu-wrap" style="display: none;">
                  <!-- 카테고리 메뉴 depth1-->
                  <div class="category-list" style="height: 266px;">
                     <ul id = "cate-f">
                     </ul>
                  </div>
               </div>
            
            </div>
            <!-- // 카테고리 메뉴 -->
            <!-- 퀵메뉴 -->
            <div class="quick-menu-wrap">
                <div class="quick-menu-list">
                    <ul class="quicklink ql-left222" id="main_tab">
                        
                            <li class=" ">
                            <a href="${app}/" class="gp_className" ga-category="메인 홈" ga-action="상단탭" ga-label="편성표">홈</a></li>
                             
                            <li class=" ">
                            <sup style="color:#FF7566">Today 오픈!</sup>
                            <a href="${app}/rental/main" class="gp_className" ga-category="메인 홈" ga-action="상단탭" ga-label="오늘추천">오늘의 대여</a></li>
                        

                    </ul>
                </div>
            </div>
            <!-- // 퀵메뉴-->
            <!-- 유틸메뉴 -->

        </div>
        
    </div>
    
<!-- Channel Plugin Scripts -->
<script>
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "${apiKey}"
  });
</script>
<!-- End Channel Plugin -->

</header>
<!--//header -->