<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="app" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" type="image/x-icon" href="${app}/resources/images/favicon.png">
    <title>반납접수</title>
    <!-- UI/UX Style -->
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/common.css"><!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/layout.css"><!-- 공통 Layout css -->
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/popup.css"><!-- 공통 Popup css -->
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/jquery-ui.css"><!-- jQuery UI css -->
    <style>
        .hidden {
            display: none !important;
        }

        textarea {
            width: 100%;
            height: 135px;
            border: 1px solid #dadada;
            padding: 12px 8px 12px 8px;
            font-size: 14px;
            color: #a9a9a9;
            resize: none;
            margin-top: 10px;
            border-radius: 6px;
        }

        .review-write .ctypo17 {
            margin: 0px;
            padding-top: 20px !important;
            color: #333;
            padding-bottom: 5px;
            font-weight: 700;
            border-top: 1px solid transparent !important;

        }
    </style>
    <script src="//image.hmall.com/p/js/co/jquery-3.4.1.min.js"></script><!-- jQuery Plugin -->
    <script src="//image.hmall.com/p/js/co/jquery.easing.min.js"></script><!-- jQuery UI Effect -->
    <script src="//image.hmall.com/p/js/co/jquery-ui.1.12.1.min.js"></script><!-- jQuery UI js -->
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/mp/mypage.css">
    <script type="text/javascript" src="https://image.hmall.com/pc/js/hmall/co/exif.min.js"></script>
    <script type="text/javascript" src="//image.hmall.com/p/js/co/webeditor.js?052615"></script>
	
	<script type="text/javascript">
	
	$(document).ready(function () {
		setStarRate(5);
    });

      $(document).on("click", "#btnSubmit", function () {
    	  var prd_id =  "${rentalUserDTO.prd_id}";
    	  var chk = confirm("반납접수 하시겠습니까?");
		  var content = $("#content").val();
		  if(chk == true){	
				$.ajax({
					url : "${app}/mypage/rentalflagUpdateR?prd_id=" + prd_id,
					type :  "GET",
					crossDomain: true,
					beforeSend : function(xhr)
					{
						//이거 안하면 403 error
						//데이터를 전송하기 전에 헤더에 csrf값을 설정한다
						var $token = $("#token");
						xhr.setRequestHeader($token.data("token-name"), $token.val());
					},
					success : function(response){
						if(response == "success"){
							// 정상 처리 된 경우	
							alert("반납접수가 완료되었습니다.");
							opener.location.reload();
							self.close(); //팝업창 닫기
						} else {
							alert("반납접수가 불가합니다.");
						}
					}										
				})										
			   
		     }
       }); 
      
      function setStarRate(obj) {
          $(".star-ratingwrap a").removeClass("fix");
          $(".star-ratingwrap a").removeClass("ui-active");
          for (var i = 1; i <= obj; i++) {
              $("#starRate" + i).addClass("ui-active");
          }
          $("#itemEvalAvgScrg").val(obj);
          $("#starRate" + obj).addClass("fix");
      }
      </script>

</head>

<body id="popWin">
<input type="hidden" id="token" data-token-name="${_csrf.headerName}" placeholder="Password" value="${_csrf.token}">
<input type="hidden" id="prd_id" value="${rentalUserDTO.prd_id}" />
    <!-- 상품평 등록하기 -->
    <div class="popup-win wd540 review-write">
        <div class="pop-wrap" tabindex="0">
            <!--pop-content-wrap-->
            <div class="pop-content-wrap">
                <strong class="pop-title">반납 접수</strong>
                <!--pop-content-->
                <div class="pop-content">
                    <div class="content">
                        <div class="pd-list">
                            <figure>
                                <div class="thumb">
                                        <img src="${rentalUserDTO.upload_path}"
                                             alt="${rentalUserDTO.prd_nm}"
                                            onerror="noImage(this, 'https://image.hmall.com/hmall/pd/no_image_600x600.jpg')" />
                                </div>
                                <figcaption>
                                        <div class="pdname" aria-label="제품명">${rentalUserDTO.prd_nm}</div>
                                </figcaption>
                            </figure>
                        </div>
						<h3 class="ctypo17 inline-block">별점</h3>
                            <div class="star-score-box">
                                <span class="star-ratingwrap" data-modules-starrating>
                                    <a href="#" id="starRate1" onclick="setStarRate(1)" class="star ui-active"><strong>아쉬워요</strong></a>
                                    <a href="#" id="starRate2" onclick="setStarRate(2)" class="star ui-active"><strong>보통이에요</strong></a>
                                    <a href="#" id="starRate3" onclick="setStarRate(3)" class="star ui-active"><strong>괜찮아요</strong></a>
                                    <a href="#" id="starRate4" onclick="setStarRate(4)" class="star ui-active"><strong>좋아요</strong></a>
                                    <a href="#" id="starRate5" onclick="setStarRate(5)" class="star ui-active fix"><strong>아주 좋아요</strong></a>
                                </span>
                            </div>
                        <!-- 대여후기 작성 textarea-->
                        <h3 class="ctypo17">대여후기 작성</h3>
                        <dl class="dlwrap">
                            <div>
                                <textarea id = "content" name="content" placeholder="대여후기를 작성해주세요." ></textarea>
                            </div>
                        </dl>
                        <!--
                        <div class="bg-gray-box">
                            <h4 class="ctypo15">확인해주세요</h4>
                            <ul class="dotlist">
                                <li>작성하신 반품 사유는 현대Hmall에 귀속됩니다.</li>
                            </ul>
                            <h4 class="ctypo15">반품 기준</h4>
                            <ul class="dotlist">
                                <li>과장이나 욕설 등 운영원칙에 어긋난 반품 사유는 통보 없이 삭제될 수 있습니다.</li>
                                </li>
                            </ul>
                        </div>
                        -->
                        <div class="btngroup">
                            <button class="btn btn-linelgray medium" onclick="window.close()"><span>취소</span></button>
                            <button class="btn btn-default medium" id="btnSubmit"><span>저장</span></button>
                        </div>
                        
                    </div>
                </div>
                <!--//pop-content-->
            </div>
            <!--//pop-content-wrap-->
        </div>
        <!--//pop-wrap-->
    </div>
</body>

</html>