<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="app" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>

<html lang="ko">

<head>
<!-- favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="${app}/resources/images/favicon.png">
<title>Hmall & SHARE</title>

<!-- ? -->
<meta name="title" content="현대홈쇼핑 - 현대Hmall">
<meta name="description" content="백화점, 브랜드, 홈쇼핑까지- 당신의 모든 취향을 읽다.">
<meta name="keywords"
	content="현대홈쇼핑, 현대몰, 현대Hmall, 현대H몰, Hmall, H몰, 에이치몰, 현대홈쇼핑편성표, 현대에이치몰, 현대쇼핑몰, 쇼핑라이브, HPoint, dpdlclahf, hahf, showppinglive, shoppinglive, 쇼핑live, show핑live, 불금데이, 현대백화점, H펫샵, 펫클럽, HPoint, H.Point, 에이치포인트, COS, 코스, 고비, gobi, 제이바이, jby, 이상봉, 아이디, id, 에이앤디, andy, 라씨엔토, laciento, 꼬에, coe, 밀라노스토리, milanostory, &otherstoies, 앤아더스토리즈, 안나수이, 아이디, 뷰벨, 유리드, URID, 주식회사꼬르륵, 꼬르륵, 메이크썸굿, 히츠폼즈, 엠비티아이, 드고떼, MBTI, 브라텐, braten">


<!-- includeScript -->
<script src="https://www.googleoptimize.com/optimize.js?id=OPT-NBGRL7P"></script>

<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, height=device-height">
<meta name="HandheldFriendly" content="true">
<meta name="format-detection"
	content="telephone=no, email=no, address=no">
<meta name="apple-mobile-web-app-capable" content=" yes">
<meta name="robots" content="index,follow">
<meta name="author" content="@Hmall">
<meta http-equiv="imagetoolbar" content="no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />


<script type="application/ld+json">
{
"@context": "http://schema.org",
"@type": "Organization",
"name": "hmall",
"url": "https://www.hmall.com",
"sameAs": [
"https://www.facebook.com/hyundaiHmall",
"https://www.youtube.com/c/%ED%9B%85%ED%8B%B0%EB%B9%84",
"https://www.instagram.com/hyundai.homeshopping/",
"https://itunes.apple.com/kr/app/id870397981",
"https://play.google.com/store/apps/details?id=com.hmallapp&hl=ko",
"http://myhmall.tistory.com"
]
}
</script>

<style>
.hidden {
	display: none !important;
}
</style>
<script src="//image.hmall.com/p/js/co/jquery-3.4.1.min.js"></script>
<!-- jQuery Plugin -->
<script src="//image.hmall.com/p/js/co/jquery.easing.min.js"></script>
<!-- jQuery UI Effect -->
<script src="//image.hmall.com/p/js/co/jquery-ui.1.12.1.min.js"></script>
<!-- jQuery UI js -->
<script src="//image.hmall.com/p/js/co/ukDetect.min.js"></script>
<!-- UI에 사용하는 Detect -->
<script src="//image.hmall.com/p/js/co/slick.min.js"></script>
<!-- 공통 Slide 플러그인 -->
<script src="//image.hmall.com/p/js/co/common.js"></script>
<!-- UI에 사용하는 기본 js  -->
<script src="//image.hmall.com/p/js/co/co.js"></script>
<!-- UI에 사용하는 기본 js  -->
<script src="//image.hmall.com/p/js/co/jquery.cookie.js"></script>
<script src="//image.hmall.com/p/js/co/commonFunction.js"></script>
<!-- as-is common.js 상속  -->
<script src="//image.hmall.com/p/js/co/reDirectExceptUrlList.js"></script>
<!-- 로그인버튼 click 리다이렉트 예외 url리스트  -->


<script>
	
	$.fn.size = function() {
	    return this.length;
	}

    /**
     * 팝업 관련  함수(아래 링크를 참고하고 있음)
     * as-is https://image.hmall.com/pc/js/hmall/co/common.js
     * serverHost indexof local이 없어 추가-> 추후 as-is js 생성 필요
     * 2020.09.21 http -> https 로 던지도록 변경
     */
    document.domain = "hmall.com";
    var locationHref = document.location.href;
    var imageServer = "https://image.hmall.com";
    var serverHost = (location.href.indexOf("final") > 0 || location.href.indexOf("stg") > 0 || location.href.indexOf("dev") > 0 || location.href.indexOf("local") > 0) ? "https://" + location.host : "https://www.hmall.com";
    var serverHostForSSL = (location.href.indexOf("final") > 0 || location.href.indexOf("stg") > 0 || location.href.indexOf("dev") > 0 || location.href.indexOf("local")>0) ? "https://" + location.host : "https://www.hmall.com";
    var switch_serverHost;

    if (locationHref.indexOf("https") > -1) {
        switch_serverHost = serverHostForSSL;
        imageServer = "https://image.hmall.com";
    } else if (locationHref.indexOf("http") > -1) {
        switch_serverHost = serverHost;
        imageServer = "https://image.hmall.com";
    }



    try{
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());
      gtag('config', 'AW-1066206974');
      gtag('config', 'AW-937000404');
  }catch(e){}

  //Google Analytics
  var init_Obj = new Object();

  $(window).on("load",function() {
      // $("body").prepend('hello new UI');

      //GA 맞춤측정 데이터 전송 및 클릭이벤트 초기화
      console.log("setDimension and useWindload 호출");
      setDimension();
      useWinload();
      
  });


    // GNB - 바로가기 링크
    function setQuicklink(jsonData){
        var _data = jsonData;
        var _html = "";

        $(_data).each(function(_idx){
            var _label = this.dispNm.toString();
            var _dispUrl = this.dispUrl.toString();
            var _item = "";

            if(_idx == 0) _item = "<li class='first'>";
            else _item = "<li>";

            var _bizParam = _dispUrl.indexOf("?") >= 0 ? "&_IC_=tab"+(_idx+1) : "?_IC_=tab"+(_idx+1);

            _item += "<a href='" + _dispUrl + _bizParam + "' class='gp_className' ga-category='메인 홈' ga-action='상단탭' ga-label='" + _label + "'>" + _label + "</a>" + "</li>";

            _html += _item;
        });

        $('.quicklink.ql-left').empty().append(_html);
    }
/*    
    function gaTagging(obj_GA, msg1, msg2, msg3){
    	location.href = msg1;    	
    }
*/
    function getClickUrl(url){
        if(url == ''){
            return false;       
        }else{
            document.location.href = url;
            
        }
    }

</script>

<script type="text/javascript">
$(document).ready(function() {
	jjimList();
	listAlrimiWithItem();
});


var rgx1 = /\D/g;
var rgx2 = /(\d+)(\d{3})/;

// 금액 타입 체크
function getNumber(obj) {
  var num01, num02;
  num01 = obj.value;
  num02 = num01.replace(rgx1,"");
  num01 = setComma(num02);
  obj.value =  num01;
}

// 콤마 입력 변환
function setComma(inNum) {     
  var outNum;
  outNum = inNum;
  while (rgx2.test(outNum)) {
       outNum = outNum.replace(rgx2, '$1' + ',' + '$2');
   }
  return outNum;
}

//개인화 찜, 알리미 
var personalJJimData;
var personalAlrimiData;

/**
 * 로그인 사용자 찜 리스트 조회 및 처리
 */
function jjimList(){
    if(isLogin() == 'true') {
        $.ajax({
            type: "post"
            ,url: "/p/mpc/selectWishList.do"
            ,dataType: "json"
            ,async: true
            ,success : function(data) {
                personalJJimData = data.result;
                personalJJimSet();
            },
            error : function(){
            }
        });
    }
}

/*
 * 로그인 사용자 알림 리스트 조회 및 처리
 */
function listAlrimiWithItem(){	
	if(isLogin() == 'true') {
        $.ajax({
            type: "post"
            ,url: "/p/bma/listAlrimiWithItem.do"
            ,dataType: "json"
            ,async: true
            ,success : function(data) {
                personalAlrimiData = data.result;
                personalAlrimiSet();
            },
            error : function(){
            }
        });
    }
}

/*
 * 로그인 사용자 찜 처리
 */
function personalJJimSet(){

    var $alimlike = $('div.alimlike');
    $alimlike.find('a.btn-like.on').removeClass('on');
    
    if(!personalJJimData){
        return;
    }
    
    var jjimCnt = personalJJimData.length;
    
    if(jjimCnt > 0){
        for(var i=0; i < jjimCnt ; i++){
            // 찜. 알리미
            $alimlike.each(function(){
                var $btnlike = $($(this).find('a.btn-like')[0]);                
                var slitmCd =  $(this).data('slitmcd');
                
                if(!$btnlike.hasClass('on') && slitmCd == personalJJimData[i]){
                    $btnlike.addClass('on');
                }
            });
        }
    }
}

/*
 * 로그인 사용자 알림 처리
 */
function personalAlrimiSet(){
   var $alimlike = $('div.alimlike');

   // clean
   $alimlike.find('a.btn-alim.on').removeClass('on');

   if(!personalAlrimiData){
      return;
   }
  
   var alrimiCnt = personalAlrimiData.length;  

   /* 일반 상품 알림 처리 */
   if($alimlike.length > 0 && alrimiCnt > 0){
      for(var i=0; i < alrimiCnt ; i++){
          // 찜. 알리미
          $alimlike.each(function(){
              var bsitmCd =  $(this).data('bsitmcd');
              var $btnalim = $($(this).find('a.btn-alim')[0]);

              if(null != bsitmCd && bsitmCd == personalAlrimiData[i].bsitmCd){
                  $btnalim.addClass('on');
              }    
          });
      }
   }

   /* PC 편성표 특화 알림 처리 */
   // clean
   $alimlike.find('button.on').removeClass('on');

   if($alimlike.find('button').length > 0 && alrimiCnt > 0){
      for(var i=0; i < alrimiCnt ; i++){

          if(null == personalAlrimiData[i].bsitmCd)
              continue;

    	  // console.log('알림 활성화 할 내 구독 : ' + personalAlrimiData[i].bsitmCd);
          
          // 찜. 알리미
          $alimlike.each(function(ti, tv){
              var bsitmCd =  $(tv).attr('data-bsitmcd');
              var $btnalim = $($(tv).find('button')[0]);

              if(null != bsitmCd && bsitmCd == personalAlrimiData[i].bsitmCd){
                  $btnalim.addClass('on');
              }    
                  
          });
      }
   }
}

/*
 * 호출 URL에 따른 _trk_clickTrace 처리
 */
function dp_clickTrace(type) {
	try {        
        // 특정 URL 포함이면 필요시 추가
        if(loca_contain('pde/search.do')){
        	trk_title('검색결과_상품리스트_찜', '검색결과_상품리스트_알리미', type);
        }        
    } catch(e) {}
}
/*
 *  url에 포함여부
 */
function loca_contain(url){
	return location.href.indexOf(url) > -1;
}

/*
 * @ggimTitle 찜
 * @alimiTitle 알리미
 */
function trk_title(ggimTitle, alimiTitle, type){
	var title;
	if(type == 'ggim'){
       title = ggimTitle;             
    }else if(type == 'alimi'){
    	title = alimiTitle;
    }	
    console.log('trk_title', title);
    _trk_clickTrace('EVT', title);
}


/*
 * 2020.12.04 icj 찜하기
 */
var goActionCnt = 0; // 두번 클릭 방지
function goChioceProcess(itemType, venCd, venItemCd, slitmCd, event, obj) {
    goActionCnt++;
    
    dp_clickTrace('ggim');    

    if(event.stopPropagation) {
        event.stopPropagation(); // FF
    } else {
        event.cancelBubble=true; // IE
    }
    if(!event.preventDefault){
        event.returnValue = false; //IE
    } else {
        event.preventDefault();
    }

    if((venCd != null && venCd == '009741' && venItemCd != null)){
        alert("기프티콘 상품은 찜하기에 담을 수 없습니다!!");
        return;
    }

    if((venCd != null && venCd == '008117' && venItemCd != null)){
        alert("기프티쇼 상품은 찜하기에 담을 수 없습니다!!");
        return;
    }

    if((venCd != null && venCd == '009014' && venItemCd != null)){
        alert("큐피콘 상품은 찜하기에 담을 수 없습니다!!");
        return;
    }

    if((venCd != null && venCd == '009428' && venItemCd != null)){
        alert("멀티콘 상품은 찜하기에 담을 수 없습니다!!");
        return;
    }

    if(itemType == '04'){
        alert("이 상품은 전문상담원과 상담 후 구매하실 수 있습니다.\n상담을 원하시면 080-000-0000으로 문의하여 주시기 바랍니다.\n전문상담원이 친절히 안내해 드리겠습니다.");
        return;
    }

    if(isLogin() != 'true') {
        if(confirm("찜을 하기 위해 로그인이 필요합니다.\n로그인 하시겠습니까?")){
            openLoginPopup(location.href);
        }
        return false;
    }
    
    if(goActionCnt > 1) return;
    
    var params = "chkedSlitmCdUitmCds=" + slitmCd;
              
    //파라미터 sectId 가 존재 할경우 sectId 전달
    var sectId = "";
    if (sectId == "" || sectId == "0") {
        sectId = "";
    }
    
    // 2020.11.19 icj PDAItemPtcMst.jsp zzimDone 참조. 2020.12.03 삭제기능 포함
    $.ajax({
        url: "/p/mpc/insertGgim.do"
        ,dataType: "json"
        ,data: params
        ,success : function(data) {
             goActionCnt = 0;
             jjimList();
             var gaAction;
             if(data.insertResult != 'undefined' && data.insertResult == '0'){
                  alert("찜하기가 불가능한 상품입니다.");
                  //alert("판매중인 단품이 없어 찜하지 못했습니다.");
                  return true;
             }else if(data.insertResult != 'undefined' && data.insertResult == '1'){
                  $(event.target).removeClass("on");   
                  alert("찜목록에서 삭제 되었습니다.");
                  try {
                      var jjimTag = data.slitmCd + "_" + data.slitmNm;
                                    
                      gaAction = '찜취소';
                      var $slitmInfo = null;
                      if($(obj).length > 0) {
                      	 $slitmInfo = $(obj).closest('figure');
                      	 setGaPromotion($slitmInfo.attr("ga-custom-title"), $slitmInfo.attr("ga-custom-name"), $slitmInfo.attr("ga-custom-position"), gaAction, jjimTag);
                      }else {
                    	 GA_Event('검색결과','상품리스트_찜취소', jjimTag);
                      }
                      
                  } catch (e) {alert(e); }
                  return true;
             }else if(data.custGGimCnt >= 200){
                  alert("더 이상 찜 할 수 없습니다. 찜리스트에서 오래된 상품을 삭제 후 다시 이용해 주세요.");  
                  return true;
             }else {            	 
            	 if(data != null && data.needLogin){
            		 // 세션 로그인이 풀려서 로그인이 안된 경우
            		 if(confirm("찜을 하기 위해 로그인이 필요합니다.\n로그인 하시겠습니까?")){
	                      openLoginPopup(location.href);
	                 }
	                 return false;
            	 }
                  $(event.target).addClass("on");                        
                  alert("찜 목록에 추가 되었습니다.");
                  try {
                      var jjimTag = data.slitmCd + "_" + data.slitmNm;
                      
                      gaAction = '찜';
                      var $slitmInfo = null;
                      if($(obj).length > 0) {
                    	  $slitmInfo = $(obj).closest('figure');
                          setGaPromotion($slitmInfo.attr("ga-custom-title"), $slitmInfo.attr("ga-custom-name"), $slitmInfo.attr("ga-custom-position"), gaAction, jjimTag);
                      }else {
                    	  GA_Event('검색결과','상품리스트_찜', jjimTag);  
                      }
                      
                  } catch (e) {}
             }                   
        },
        error : function(){
             console.log("json error");
             goActionCnt = 0;
         }
    });               
}

/*
 * 2020.12.01 icj 방송 알리미    
 * PDAItemPtcMst.jsp bitemAlrimPopupNew 참조
 */
function bitemAlrimPopupTrk(slitmNm, slitmCd, bsitmCd) {
    if(isLogin() != 'true') {
        openLoginPopup(location.href);
        return false;
    }               
    
    dp_clickTrace('alimi');
    
    
    // 방송 알리미 팝업
    // addBitemAlrimCommonPopupNew(slitmNm, slitmCd, bsitmCd);  //AS-IS
        alimPopup(slitmNm, slitmCd, bsitmCd, function(w){
    	listAlrimiWithItem();
    });
}

function alimPopup(slitmNm, slitmCd, bsitmCd, callback) {
    var w = openPopup("/p/bma/editBitmAlrimNewPup.do?slitmNm=" + encodeURIComponent(slitmNm) + "&slitmCd="+slitmCd + "&bsitmCd="+bsitmCd,
    		"", 600, 700, "yes", $(window).width(), $(window).height());
    
    var wInterval = setInterval(function(){
        if(w.closed){
//             console.log('닫힘');
            callback(w);
            clearInterval(wInterval);
        }else {
//             console.log('열림')
        }
    },1000);
}


function alimLayer() {
	$.ajax({
        type: "POST"
        ,url: "/p/bma/editBitmAlrimNewPup.do"
        ,data: {
            returnUrl : location.href,
            slitmCd : slitmCd,
            slitmNm : slitmNm
        }
        ,dataType: "html"
        ,async: false
        ,success : function(data) {
            if($("#bitmAlrimLayer").length == 0){
                var html = '<div class="layer-popup brand" id="bitmAlrimLayer">';
                html += '<div class="pop-wrap">';
                html += '<div class="pop-content-wrap">';
                html += '<strong class="pop-title">방송 알리미</strong></div>';
                html += '<div class="pop-content" id="bitmAlrimBody"></div>';
                html += '<button class="btn-close" id="bitmAlrimCloseBtn"><span>팝업 닫기</span></button>';    
                html += '</div>';
                $('body').append(html);
                
                $('#bitmAlrimCloseBtn').click(function(){
                    $("#bitmAlrimLayer").hide();
                });
            }
            $("#bitmAlrimBody").html(data);
            $("#bitmAlrimLayer").show();
        }
        ,
        error : function() {
            alert('방송알리미 신청시 오류가 발생했습니다. 잠시후 다시 시도하세요.');
            console.log("json error");
        }
    });
}

//상품상세이동
function goItemDetail(url, obj, target) {
    var $slitmInfo = $(obj).closest('.pdthumb');
    if($slitmInfo){
        if($slitmInfo.hasClass('comingsoon')){
            alert('아직 판매중이 아닙니다.');
            return false;
        } 
        /*
        if($slitmInfo.hasClass('soldOut')){
            alert('품절입니다.');
            return false;
        }
        */
    }
    
    /* ga tagging */
    try{
        if($slitmInfo && $slitmInfo.attr("ga-custom-title")){
            setGaPromotion($slitmInfo.attr("ga-custom-title"), $slitmInfo.attr("ga-custom-name"), $slitmInfo.attr("ga-custom-position"), $slitmInfo.attr("ga-custom-creative"), $slitmInfo.attr("ga-custom-id"))    
        }
    } catch(e) {
        console.log(e);
    }
    
    if(target){
        window.open(url,target);
    }else{
        window.location.href = url;
    }
    
}

function personalSet(){
    personalJJimSet();
    personalAlrimiSet();
}

// 방송톡
function brodChatCheck(){

    //방송톡 가능여부
    $.ajax({
        type: "GET",
        //url: "https://marsheg.sweettracker.net:4443/user/api/is_aviliable_chat/format/json",
        url: "https://broadeg.happytalk.io/user/api/is_aviliable_chat/format/json",
        success: function(result) {                     
                if(result.code == 'success'){                
                    // 로그인 체크 및 팝업창 열기
                    if(isLogin() == 'true'){
                        var screenWidth = $(window).width();
                        var screenHeight = $(window).height();
                        var width = 480;     
                        var height = 700;    
                        var left = (screenWidth - width) / 2;
                        var top = (screenHeight - height) / 2;
                        var url = "https://www.hmall.com/p/bmc/brodChatPup.do";                     
                        var popName = "brodChatPup";
                        var popOption = "height="+ height +", width="+ width +", left="+left+", top="+top+", fullscreen=no, location=no, scrollbars=no, menubar=no, toolbar=no, titlebar=no, directories=no, resizable=no";
                        window.open(url, popName, popOption);
                    }else{
                        openLoginPopup("/p/bmc/brodPordPbdv.do"); return false;
                    }               
                }else{
                     //채팅방 상태가 좋지 않으면 오류메시지 표시.
                     alert(result.results);                     
                }            
        },
        async: false,
        dataType: 'jsonp',
        crossDomain: true
    });
}

// 기획전 템플릿 다운로드 쿠폰 적용
var roulette_flag = 0; //계속 클릭 방지
function DirectCopnDownload(prmoNo){
	
	var now_urls = location.href;
    var returnUrl = now_urls.split('hmall.com');
    
	if(isLogin() == 'true'){
		
		if(roulette_flag != 0){
	        return false;
	    }
		roulette_flag = 1;
		
		$.ajax({
			type: "post"
			,url: "/pevent/eva/evntSectCopnDownLoad.do"
			,dataType: "json"
			,data:{prmoNo:prmoNo}
			,async: false
			,success : function(data) {
				if(data.save){
					roulette_flag = 0;
					alert("쿠폰이 발행되었습니다.");
				}else{
					roulette_flag = 0;
					if( data.errorMsg == "UPNT_REGISTER" ){
						if(confirm("H.Point 통합회원 가입 후 이벤트 응모 가능합니다.\nH.Point 전환가입 하시겠습니까?")) {
                             window.location.href = "/p/cua/registUpnt.do";
                        }else{
                        	return false;	
                        }
					}else{
						if(data.otp == "no"){
                            openPopup("/pevent/eva/evaEvntSmsSelfCertPup.do?btn=agree&returnUrl="+returnUrl[1], 'smsSendPup', "500", "611", null, $(window).width(), $(window).height());
                        }else{
                            alert(data.errorMsg);   
                            return false;
                        }
					}
				}
			}
			,error : function(request,status,error){
				if(confirm('응모시 오류가 발생했습니다.')){
				}
				roulette_flag = 0;
			}
			});
			return false;
	}else{
		openLoginPopup(returnUrl[1]);
		return false;
	}
}    

//for chrome debugger
//# sourceURL=script-for-main-dprenew.js
</script>

<!-- includeScript -->
<script type="text/javascript"
	src="//image.hmall.com/p/js/co/intersectionObserver.js?ver=050417"></script>

<script type="text/javascript">

    var isScrollDown = false;
	var itemPage = 1;
	if ("0" == "0") {
		itemPage = 0;
	}
	var itemArea = ""; 
	//var curPageTemplate = "";
	var preLoadData = "";
	
	// 뒤로가시시 처리
	var pageScrollTop;
	var reloadPage;
	
	$(function () {
		// 뒤로가기를 위한 세션 스토리지 초기화
		if(window.sessionStorage != null)  {
		    var storedMainPage = sessionStorage.getItem('mainPage');
		    if(isEmpty(storedMainPage) || storedMainPage != 'bordEtv') {
		        sessionStorage.setItem('mainPage', 'bordEtv');
		        sessionStorage.setItem('mainPageAjax', 1);
		        sessionStorage.setItem('mainPageScrollTop', $(window).scrollTop());
		        pageScrollTop = $(window).scrollTop();
		        reloadPage = itemPage;
		    } else {
		        pageScrollTop = new Number(sessionStorage.getItem('mainPageScrollTop'));
		        reloadPage = new Number(sessionStorage.getItem('mainPageAjax'));
		    }
		}
		
	
	    // 뒤로가기시 로딩        
	    if(reloadPage > 1) {
	        for(var i=0; i < reloadPage -1; i++){
	            loadReviewList(false, false);
	        }
	
	        //alert(pageScrollTop)
	        $(window).scrollTop(pageScrollTop);
	        
	        // 
	        //alert($(window).scrollTop())
	        
	        setTimeout(function () {
	            //alert(pageScrollTop)
	            $(window).scrollTop(pageScrollTop);
	        }, 1000);
	        
	        
	        $('body').commonUi('initLibrary');
	        personalSet();
	
	        // 이미지 로딩 
	        initObserver();
	        
	    } else {
	    	
	    	if (itemPage == 0) {
                // 다음페이지 데이터 먼저 로딩
                loadReviewList(true, false);
	    	} else {
	    	    // 다음페이지 데이터 먼저 로딩(실제 추가하지는 안음)
		        loadReviewList(true, true);
	    	}
	    }
	
	    $(window).scroll(function(e) {
	
	        if(window.sessionStorage != null){
	            //console.log("isScroll :: " +$(this).scrollTop());
	            sessionStorage.setItem('mainPageScrollTop', $(this).scrollTop());
	        }
	        
	        //console.log("isScroll :: " +isScrollDown);
	        if(isScrollDown) return false;
	        
	
	        
	        var dh = $(document).height();
	        var wh = $(window).height();
	        var wt = $(window).scrollTop();
	        var actionPoint = (dh / 4) * 3; 
	
	        //console.log("actionPoint :: " +actionPoint + " (wh + wt) :: " +(wh + wt));
	
	        if (actionPoint <= (wh + wt)) {
	            loadReviewList(true, true)
	        }
	    });
	});


    function loadReviewList(async, preload) {

        if(isScrollDown) return false;
        isScrollDown = true;
        
        var dispTrtyNmCd = "bordEtv";
        var mainDispSeq = "3";
        var itemArea = "";
        var isLoadingBar = false;
        
        try {
            var url = "";             
            var param = new Object();

            //console.log("dispTrtyNmCd-->"+dispTrtyNmCd)
            
            if (dispTrtyNmCd == "home") { //메인홈                            
                
                url = "/p/homePage.do";
                itemArea = "div.home-wrap"; 
                itemPage++;
                isLoadingBar = true;
                if(window.sessionStorage != null){
                    sessionStorage.setItem('mainPageAjax', itemPage);
                }

                // 이전에 로드한 데이터 추가
                if (preload && !isEmpty(preLoadData)) {
                    $(itemArea).append(preLoadData);
                    
                    $('body').commonUi('initLibrary');
                    personalSet();

                    // 이미지 로딩 
                    initObserver();
                }
                 
                if (itemPage > 5)
                    return;
                
                param = { mainDispSeq : mainDispSeq
                        , itemPage : itemPage
                        , loginCheck : 'false'
                        , EHAdltCertYn : ''
                        , preView : ''
                };
                
            } else if (dispTrtyNmCd == "bordEtv") { //홈쇼핑                            
                
                url = "/p/tvMainRPage.do";
                itemArea = "div.homeshoping-wrap"; 
                itemPage++;
                isLoadingBar = true;
                if(window.sessionStorage != null){
                    sessionStorage.setItem('mainPageAjax', itemPage);
                }

                // 이전에 로드한 데이터 추가
                if (preload && !isEmpty(preLoadData)) {
                    $(itemArea).append(preLoadData);
                    
                    $('body').commonUi('initLibrary');
                    personalSet();

                    // 이미지 로딩 
                    initObserver();
                }
                 
                if (itemPage > 5)
                    return;
                
                param = { mainDispSeq : mainDispSeq
                        , itemPage : itemPage
                        , loginCheck : 'false'
                        , EHAdltCertYn : ''
                        , preView : ''
                };
                
            } else if (dispTrtyNmCd == "bordDtv") { //미리TV                            
                
                url = "/p/tvPlusShopMainRPage.do";
                itemArea = "div.main-contents-area"; 
                itemPage++;
                isLoadingBar = true;
                if(window.sessionStorage != null){
                    sessionStorage.setItem('mainPageAjax', itemPage);
                }

                // 이전에 로드한 데이터 추가
                if (preload && !isEmpty(preLoadData)) {
                    $(itemArea).append(preLoadData);
                    
                    $('body').commonUi('initLibrary');
                    personalSet();

                    // 이미지 로딩 
                    initObserver();
                }
                 
                if (itemPage > 2)
                    return;
                
                param = { mainDispSeq : mainDispSeq
                        , itemPage : itemPage
                        , preView : ''
                };
                
            } else if (dispTrtyNmCd == "dptsMain") { // 백화점                            
            	
                url = "/p/dsMainRPage.do";
                itemArea = "div.body-hdpdwrap"; 
                itemPage++;
                if(window.sessionStorage != null){
                    sessionStorage.setItem('mainPageAjax', itemPage);
                }

                // 이전에 로드한 데이터 추가
                if (preload && !isEmpty(preLoadData)) {
                    $(itemArea).append(preLoadData);
                    
                    $('body').commonUi('initLibrary');
                    personalSet();

                    // 이미지 로딩 
                    initObserver();
                }
                 
                if (itemPage > 3)
                    return;
                
                param = { mainDispSeq : mainDispSeq
                        , itemPage : itemPage
                        , preView : ''
                };
                
            } else {
                isScrollDown = false;
                return;
            }
 
            //console.log("ajax call page=" + itemPage);
            //alert(itemPage);
            
            if (isLoadingBar) {
                $(itemArea).append("<div id='mainLoadingArea'><ul>로딩중...</ul></div>");
                moreLoading(true, $("#mainLoadingArea ul"),true);
            }                    
                    
            $.ajax({
                type: "get"
                ,url: "https://wwwca.hmall.com" + url
                ,dataType: "html"
                ,data: param
                ,async: async
                ,success : function(data) {
                	
                   if (preload == false) {
                       $(itemArea).append(data);

                       if (async) {
                           $('body').commonUi('initLibrary');
                           personalSet();

                           // 이미지 로딩 
                           initObserver();
                       }
                       
                   } else {
                       preLoadData = data;
                   }


                   if (isLoadingBar) {
                       moreLoading(false, $("#mainLoadingArea ul"));
                       $("#mainLoadingArea").remove();
                   }
                   isScrollDown = false;
                   

                   // 현재 로딩한 페이지가 화면을 꽉 채우지 못하면 추가 로딩
                   if ($("main").height() < $(window).height()) {
                       loadReviewList(true, true)
                   }
                }
                ,
                error : function(e) {   
                	
                	// CA 가 아니면 중지
                	if (isEmpty("https://wwwca.hmall.com")) {

                        if (isLoadingBar) {
                            moreLoading(false, $("#mainLoadingArea ul"));
                            $("#mainLoadingArea").remove();
                        }
                        
                        isScrollDown = false;
                        return;
                	}
                		
                	
                    // 실패시 원래 URL
                	$.ajax({
                        type: "get"
                        ,url: url
                        ,dataType: "html"
                        ,data: param
                        ,async: false
                        ,success : function(data) {
                            
                           if (preload == false) {
                               $(itemArea).append(data);

                               if (async) {
                                   $('body').commonUi('initLibrary');
                                   personalSet();

                                   // 이미지 로딩 
                                   initObserver();
                               }
                               
                           } else {
                               preLoadData = data;
                           }


                           if (isLoadingBar) {
                               moreLoading(false, $("#mainLoadingArea ul"));
                               $("#mainLoadingArea").remove();
                           }
                           isScrollDown = false;
                        }
                        ,
                        error : function(e) {   

                           if (isLoadingBar) {
                               moreLoading(false, $("#mainLoadingArea ul"));
                               $("#mainLoadingArea").remove();
                           }
                           isScrollDown = false;
                        }
                    });
                }
            });
        } catch(e) {}
    }
</script>

<!-- Main Contents css = Contents css부분은 각페이지마다 다르게 해당되는 css가 호출 됨(폴더 구조별)  -->
<link rel="stylesheet" type="text/css"
	href="//image.hmall.com/p/css/co/main.css">
<link href="//image.hmall.com/p/css/co/video-js.css" rel="stylesheet">
<script src="//image.hmall.com/p/js/co/video.js"></script>
<script src="//image.hmall.com/p/js/co/videojs-http-streaming.js"></script>
</head>
<!--head_stop_flag-->



<body>

	<tiles:insertAttribute name="header" />
	
			<tiles:insertAttribute name="body" />
		
	<tiles:insertAttribute name="footer" />

</body>
</html>