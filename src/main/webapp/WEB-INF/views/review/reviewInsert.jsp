<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="app" value="${pageContext.request.contextPath}" />
    
<!DOCTYPE html>
<html lang="ko">
<head>

    <meta charset="UTF-8">
    <meta name="viewport"
        content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, height=device-height">
    <meta name="HandheldFriendly" content="true">
    <meta name="format-detection" content="telephone=no, email=no, address=no">
    <meta name="apple-mobile-web-app-capable" content=" yes">
    <meta name="robots" content="index,follow">
    <meta name="title" content="https://hmall.com">
    <meta name="author" content="@Hmall">
    <meta name="description"
        content="백화점, 브랜드, 홈쇼핑까지- 당신의 모든 취향을 읽다. Korean Online Shopping Mall, Worldwide Shipping available, Hyundai Department Store Group in Korea. 韩国现代百货店的线上购物网站正品保障, 海外配送.">
    <meta name="keywords" content="">
    <meta http-equiv="imagetoolbar" content="no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>상품평등록 - 현대Hmall</title>

    <!-- includeScript -->

    <link rel="shortcut icon" href="https://www.hmall.com/favicon.ico" />
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
    </style>
    <script src="//image.hmall.com/p/js/co/jquery-3.4.1.min.js"></script><!-- jQuery Plugin -->
    <script src="//image.hmall.com/p/js/co/jquery.easing.min.js"></script><!-- jQuery UI Effect -->
    <script src="//image.hmall.com/p/js/co/jquery-ui.1.12.1.min.js"></script><!-- jQuery UI js -->
    <script src="//image.hmall.com/p/js/co/ukDetect.min.js"></script><!-- UI에 사용하는 Detect -->
    <script src="//image.hmall.com/p/js/co/slick.min.js"></script><!-- 공통 Slide 플러그인 -->
    <script src="//image.hmall.com/p/js/co/common.js"></script><!-- UI에 사용하는 기본 js  -->
    <script src="//image.hmall.com/p/js/co/co.js"></script><!-- UI에 사용하는 기본 js  -->
    <script src="//image.hmall.com/p/js/co/jquery.cookie.js"></script>
    <script src="//image.hmall.com/p/js/co/commonFunction.js"></script><!-- as-is common.js 상속  -->
    <script src="//image.hmall.com/p/js/co/reDirectExceptUrlList.js"></script><!-- 로그인버튼 click 리다이렉트 예외 url리스트  -->

    <!-- Google analytics -->
    <script type="text/javascript" src="//image.hmall.com/p/js/co/GoogleAnalyticsBuilder.js?ver=052615"></script>
    <script type="text/javascript" src="//image.hmall.com/p/js/co/ScreenNameObj.js?ver=052615"></script>
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/mp/mypage.css">


    <!-- includeScript -->
    <script type="text/javascript" src="https://image.hmall.com/pc/js/hmall/co/exif.min.js"></script>
    <script type="text/javascript" src="//image.hmall.com/p/js/co/webeditor.js?052615"></script>

    <script type="text/javascript">
        jQuery.browser = {};
        (function () {
            jQuery.browser.msie = false;
            jQuery.browser.version = 0;
            if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
                jQuery.browser.msie = true;
                jQuery.browser.version = RegExp.$1;
            }
        })();

        $(document).ready(function () {
            $("#hdnItemEvalScrg1").val("26;0;0");
            $("#hdnItemEvalScrg2").val("25;0;0");
            $("#hdnItemEvalScrg3").val("17;0;0");
            $("#rad1-1").click();
            $("#rad2-1").click();
            $("#rad3-1").click();

            if ("5000" == "") {
                $("#svmtBsicAmt").val(0);
            }
            // 별점 선택
            setStarRate(5);

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
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
	
    <!-- 상품평 등록하기 -->
    <div class="popup-win wd540 review-write">
            <input type="hidden" name="slitmCd" value="2137807436" />
            <input type="hidden" name="itemLCsfCd" value="S5" />
            <!--  <input type="hidden" id="itemEvalAtclNo" name="pDCItemEvalAtclVO.itemEvalAtclNo" value="0"/>  -->
            <input type="hidden" name="pDCItemEvalAtclVO.ordNo" value="20220513296480" />
            <input type="hidden" name="pDCItemEvalVO.ordNo" value="20220513296480" />
            <input type="hidden" name="pDCItemEvalAtclVO.uitmCd" value="00008" />
            <input type="hidden" name="pDCItemEvalAtclVO.venCd" value="013817" />
            <input type="hidden" name="pDCItemEvalAtclVO.slitmCd" value="2137807436" />
            <input type="hidden" name="itemEvalTypeGbcd" />
            <input type="hidden" id="qaYn" value="N" />
            <input type="hidden" id="qnaYn" value="N" />

            <input type="hidden" name="pDCItemEvalAtclVO.itemEvalSavePath" value="" />
            <input type="hidden" name="itemEvalAtclNo" value="" />
            <input type="hidden" name="wrtItntId" value="" />
            <!-- 
	        <input type="hidden" name="slitmCd" value=""/>
	        <input type="hidden" name="uitmCd" value=""/>   
	        <input type="hidden" name="itemEvalTitl" value=""/>
	        <input type="hidden" name="itemEvalCntn" value=""/>
	       -->

            <input type="hidden" name="pDCItemEvalAtclVO.itemEvalTitl" />
            <input type="hidden" name="pDCItemEvalAtclVO.itemEvalCntn" />

            <input type="hidden" id="itemEvalAvgScrg" name="pDCItemEvalAtclVO.itemEvalAvgScrg" value="5" />

            <input type="hidden" name="attach_image" id="hiddenImg1" />
            <input type="hidden" name="attach_image" id="hiddenImg2" />
            <input type="hidden" name="attach_image" id="hiddenImg3" />
            <input type="hidden" name="attach_image" id="hiddenImg4" />
            <input type="hidden" name="modify_image" id="hiddenModifyImg1" value="I,0" />
            <input type="hidden" name="modify_image" id="hiddenModifyImg2" value="I,0" />
            <input type="hidden" name="modify_image" id="hiddenModifyImg3" value="I,0" />
            <input type="hidden" name="modify_image" id="hiddenModifyImg4" value="I,0" />


            <input type="hidden" name="itemEvalScrg" id="hdnItemEvalScrg1" value="0" />
            <input type="hidden" name="itemEvalScrg" id="hdnItemEvalScrg2" value="0" />
            <input type="hidden" name="itemEvalScrg" id="hdnItemEvalScrg3" value="0" />

            <input type="hidden" name="pDCItemEvalAtclVO.uitmPtcDescExpsYn">

            <input type="hidden" name="pDCItemEvalAtclVO.svmtBsicAmt" id="svmtBsicAmt" value="5000" />
            <!--pop-wrap-->
            <div class="pop-wrap" tabindex="0">
                <!--pop-content-wrap-->
                <div class="pop-content-wrap">
                    <strong class="pop-title">상품평 쓰기</strong>
                    <!--pop-content-->
                    <div class="pop-content">
                        <div class="content">
                            <div class="pd-list">
                                <figure>
                                    <div class="thumb">
                                        <a href="javascript:;">
                                            <img src="${prdImgUrl }"
                                                onerror="noImage(this, 'https://image.hmall.com/hmall/pd/no_image_600x600.jpg')" />
                                        </a>
                                    </div>
                                    <figcaption>
                                        <a href="javascript:;">
                                            <div class="pdname" aria-label="제품명">${prdNm }</div>
                                        </a>
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

                            <!-- 리뷰작성 textarea-->
                            <h3 class="ctypo17">내용</h3>
                            <dl class="dlwrap">
                                <div>
                                    <textarea id="evalMsgCntn" name="content" placeholder="내용을 입력해주세요." required></textarea>
                                </div>
                            </dl>

							<div class="picmov-add" id="attachImageD1">
								<div class="picmov-aligner">
									<div class="upload">
										<label class="filelabel cs-photo pic" id="attachImg1" style="cursor: pointer;">
										<span class="upfile"></span>
										</label>
										<button class="btn btn-close cs-photo pic" type="button" id="1" onclick="deleteImg(this);" style="display: none">
											<i class="icon close"></i><span class="hiding">파일 삭제</span>
										</button>
									</div>
									<div class="upload">
										<label class="filelabel cs-photo pic" id="attachImg2" style="cursor: pointer;">
										<span class="upfile"></span>
										</label>
										<button class="btn btn-close" type="button" id="2" onclick="deleteImg(this);" style="display: none">
											<i class="icon close"></i><span class="hiding">파일 삭제</span>
										</button>
									</div>
									<div class="upload">
										<label class="filelabel cs-photo pic" id="attachImg3" style="cursor: pointer;"> <span class="upfile">
										</span>
										</label>
										<button class="btn btn-close" type="button" id="3" onclick="deleteImg(this);" style="display: none">
											<i class="icon close"></i><span class="hiding">파일 삭제</span>
										</button>
									</div>
									
									<input type="file" id="getfile_1" accept="image/*" title="파일 업로드" style="display: none;" multiple="">
									<input type="file" id="getfile_2" accept="image/*" title="파일 업로드" style="display: none;" multiple="">
									<input type="file" id="getfile_3" accept="image/*" title="파일 업로드" style="display: none;" multiple="">
								</div>
							</div>

							<div class="bg-gray-box">
                                <h4 class="ctypo15">확인해주세요</h4>
                                <!-- [12/15]_수정(위키 383 내용 - 문구 추가 및 버튼 추가로 인한 레이어 팝업 생성) -->
                                <ul class="dotlist">

                                    <li>작성하신 상품평은 현대Hmall에 귀속됩니다.</li>

                                    <!-- <li>과장이나 욕설 등 운영원칙에 어긋난 상품평은 통보 없이 삭제될 수 있습니다.</li> -->
                                </ul>
                                <!-- //[12/15]_수정(위키 383 내용 - 문구 추가 및 버튼 추가로 인한 레이어 팝업 생성) 바꿀거면 미리 말 좀 해주던가 ^^..-->



                                <h4 class="ctypo15">지급기준</h4>
                                <ul class="dotlist">
                                    <li>작성하신 상품평은 현대Hmall에 귀속됩니다.</li>
                                    <li>운영원칙에 어긋난 상품평은 통보없이 전시 제외될 수 있으며 3회 이상 발생 시 <br>작성 및 H.Point 혜택이 제한될 수 있습니다.
                                    </li>
                                    <!-- <li>과장이나 욕설 등 운영원칙에 어긋난 상품평은 통보 없이 삭제될 수 있습니다.</li> -->
                                </ul>

                            </div>

                            <div class="btngroup">
                                <button class="btn btn-linelgray medium" onclick="window.close()"><span>취소</span></button>
                                <button class="btn btn-default medium" onclick="insertReview()"><span>저장</span></button>
                            </div>
                        </div>
                    </div>
                    <!--//pop-content-->
                </div>
                <!--//pop-content-wrap-->
            </div>
            <!--//pop-wrap-->
    </div>
    <!--popup-win-->

    <!-- [12/15]_수정(위키 383 내용 전시제외 기준 자세히 보기 레이어 팝업 추가) -->
    <div class="ui-modal" id="excludingView" tabindex="-1" role="dialog" aria-label="전시제외 기준 자세히 보기">
        <div class="ui-modal-dialog collect-perInfo" role="document">
            <div class="content">
                <p class="ui-title">전시제외 기준 자세히 보기</p>
                <!-- //.content-head -->
                <div class="content-body">
                    <ul class="dotlist">
                        <li>상품평 전시가 법적으로 금지된 품목(식품/의료기기등)</li>
                        <li>과장광고/허위광고성 표현을 사용한 경우</li>
                        <li>미풍양속을 해치는 단어 및 내용을 사용한 경우</li>
                        <li>내용과 무관한 의성어/자음/기호/특정단어 등을 반복적으로 사용한 경우</li>
                        <li>타 사이트 또는 타 판매처로 유도하는 표현을 사용한 경우</li>
                        <li>다른 고객의 상품평을 복사해서 사용한 경우</li>
                        <li>이미지 동영상 등을 무단으로 사용하여 제 3자의 권리를 침해하는 경우</li>
                        <li>해당 상품에 대한 내용이 아닌 경우</li>
                        <li>상품과 관련없는 비방 및 도배글, 허위글인 경우</li>
                    </ul>
                    <div class="btngroup">
                        <button class="btn btn-default" data-dismiss="modal"><span>확인</span></button>
                    </div>
                </div>
                <!-- //.content-body -->

                <button class="btn btn-close" data-dismiss="modal"><i class="icon xico"></i><span class="hiding">레이어
                        닫기</span></button>
            </div>
            <!-- //.content -->
        </div>
        <!-- //.ui-modal-dialog -->
    </div>
    <!-- //.ui-modal -->
    <!-- //[12/15]_수정(위키 383 내용 전시제외 기준 자세히 보기 레이어 팝업 추가) -->
	
	<!-- iamhere -->
</body>

<script>

$(document).on("click", '#attachImg1, #attachImg2, #attachImg3', function(e) {
	e.preventDefault();
	//uploadImg($(this));
	//uploadImgCh($(this));
	uploadImChCore($(this));
});


/*
 * 웹 이미지 업로드 ; thumnail )
 *  - 업로드 전에 HTML에서 이미지 압축까지해서 서버로 전송하던 것을
 *    이미지 압축까지만 하고, 그 다음은 review 작성시점에 서버로 전송 2분할
 */

	function uploadImChCore(obj) {
		var imgSeq = Number(obj.attr('id').replace("attachImg", ""));
		var imgId = "#getfile_" + imgSeq;
		var file = document.querySelector(imgId);

		var max_size = 0;
		var width = 0;
		var height = 0;
		var orientation = 0;
		var dataURIRotate;

		$(imgId).trigger('click');

		file.onchange = function() {
			$("#attachImg" + imgSeq).addClass("attach"); // upload 내부 라벨에 attach가 붙어서 파일이 첨부됨을 표기
			var fileList = file.files;

			// 읽기
			var reader = new FileReader();
			reader.readAsDataURL(fileList[0]);

			//로드 한 후
			reader.onload = function() {
				if (imgSeq < 4) {

					if (fileList[0].size > 10000000) {
						alert('10MB 이하크기의 사진(들)만 등록이 가능합니다.');
						return false;
					}

					//썸네일 이미지 생성
					var tempImage = new Image(); //drawImage 메서드에 넣기 위해 이미지 객체화
					tempImage.src = reader.result; //data-uri를 이미지 객체에 주입

					tempImage.onload = function() {

						//사진 EXIF 정보 가져오기
						window.EXIF.getData(tempImage, function() {
							orientation = window.EXIF.getTag(this,
									"Orientation");
						});

						//리사이즈를 위해 캔버스 객체 생성
						var canvas = document.createElement('canvas');
						max_size = 800;
						width = tempImage.width;
						height = tempImage.height;

						if (width < 300 || height < 300) {
							alert("300x300 사이즈 이상 이미지로 등록해주세요.");
							$("#getfile_" + imgSeq).val("");
							$("#attachImg" + imgSeq).removeClass("attach");
							return false;
						}

						if (width > height) {
							if (width > max_size) {
								height *= max_size / width;
								width = max_size;
							}
						} else {
							if (height > max_size) {
								width *= max_size / height;
								height = max_size;
							}
						}

						canvas.width = width;
						canvas.height = height;
						canvas.getContext('2d').drawImage(tempImage, 0, 0,
								width, height);
						//var dataUrl = canvas.toDataURL('image/jpeg', 0.90);   // 이미지 퀄리티 조절도 가능...

						//캔버스에 그린 이미지를 다시 data-uri 형태로 변환
						var dataURI = canvas.toDataURL("image/jpeg");

						// store current data to an image
						myImage = new Image();
						myImage.src = dataURI;

						myImage.onload = function() {
							// reset the canvas with new dimensions

							switch (orientation) {
							case 6:
							case 8:
								canvas.width = height;
								canvas.height = width;
								width = canvas.width;
								height = canvas.height;

								canvas.getContext('2d').save();
								if (orientation == 6) {
									canvas.getContext('2d').translate(width, 0);
									canvas.getContext('2d').rotate(
											90 * Math.PI / 180);
								} else {
									canvas.getContext('2d')
											.translate(0, height);
									canvas.getContext('2d').rotate(
											-90 * Math.PI / 180);
								}
								break;

							case 1:
							case 3:
								canvas.width = width;
								canvas.height = height;
								width = canvas.height;
								height = canvas.width;

								if (orientation == 3) {
									canvas.getContext('2d').translate(height,
											width);
									canvas.getContext('2d').rotate(
											180 * Math.PI / 180);
								}
							}

							// draw the previows image, now rotated
							canvas.getContext('2d').drawImage(myImage, 0, 0);
							canvas.getContext('2d').restore();

							dataURIRotate = canvas.toDataURL("image/jpeg");

							var imgId = "thumbnail" + imgSeq;
							//var srcImg = "<img class='addImg' src='' style='width:56px;height:56px;' id=" + imgId +" />";
							var srcImg = "<img src='' id=" + imgId +" />";

							var thumnailId = "attachImg" + imgSeq;
							$("#" + thumnailId + ">.upfile").append(srcImg);
							//$("#"+ thumnailId).find("a._delimg").show();

							//썸네일 이미지 보여주고, 전송은 review 등록과 함께
							document.querySelector('#' + imgId).src = dataURIRotate;
							$("#" + imgSeq).css("display", "block");
						};
					} //tempImage.onload
				}
			}; //reader.onload
		}
	}

	function deleteImg(target) {
		console.log('deleteImg start');
		//$("#attachImg" + target.id).trigger("click"); 
		var thumbnailSize = $("img[id^='thumbnail']").length;
		if (target.id == "1") {

			if (thumbnailSize == 3) {
				$("#thumbnail1")[0].src = $("#thumbnail2")[0].src;
				$("#thumbnail2")[0].src = $("#thumbnail3")[0].src;

				$("#thumbnail1")[0].title = $("#thumbnail2")[0].title;
				$("#thumbnail2")[0].title = $("#thumbnail3")[0].title;

				$("#attachImg3").removeClass("attach");
				$("#thumbnail3").remove();
				$("#3").hide();
			} else if (thumbnailSize == 2) {
				$("#thumbnail1")[0].src = $("#thumbnail2")[0].src;
				$("#thumbnail1")[0].title = $("#thumbnail2")[0].title;

				$("#attachImg2").removeClass("attach");
				$("#thumbnail2").remove();
				$("#2").hide();
			} else {
				$("#attachImg1").removeClass("attach");
				$("#thumbnail1").remove();
				$("#1").hide();
			}

		} else if (target.id == "2") {

			if (thumbnailSize == 3) {
				$("#thumbnail2")[0].src = $("#thumbnail3")[0].src;
				$("#thumbnail2")[0].title = $("#thumbnail3")[0].title;

				$("#attachImg3").removeClass("attach");
				$("#thumbnail3").remove();
				$("#3").hide();
			} else if (thumbnailSize == 2) {
				$("#attachImg2").removeClass("attach");
				$("#thumbnail2").remove();
				$("#2").hide();
			}
		} else {
			$("#attachImg3").removeClass("attach");
			$("#thumbnail3").remove();
			$("#3").hide();
		}
	}
 
	// 댓글과 별개로 사진등록마다 s3 업로드
	function callAjaxCore(file, imgId, imgSeq, filename) {
		var token = $("input[name='_csrf']").val();
		var header = "X-CSRF-TOKEN";

		// 파일을 담아보낼 formData
		var formData = new FormData();
		// 수업방식과 달리, 추가로 Blob으로 변환함, 어떤 이득이 있을 것을 예상하나 지금은 생략
		//var blob = dataURItoBlob(dataURIRotate);

		var val_prd_board_id = '${prd_board_id}';
		var val_user_id = '${user_id}';
		// only review and image, i
		var val_board_flag = 'review';
		var val_file_nm = 'image';
		var val_file_type = 'i';

		console.log(file);
		formData.append('uploadfile', file);
		formData.append('prd_board_id', val_prd_board_id);
		formData.append('user_id', val_user_id);
		formData.append('board_flag', val_board_flag);
		formData.append('file_nm', val_file_nm);
		formData.append('file_type', val_file_type);

		loading(true);
		$.ajax({
			type : "post",
			url : "${app}/aws/uploadS3",
			processData : false,
			contentType : false,
			data : formData,
			//async : false,
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(data, textStatus, jqXHR) {
				//var returnPath = data.returnPath;
				//document.querySelector('#' + imgId).src = returnPath;

				loading(false); // hmall mark
				$("#attachImg" + imgSeq).addClass("attach");
				$("#" + imgSeq).css("display", "block");

			},
			error : function(jqXHR, textStatus, errorThrown) {
				loading(false);
				alert('사진 업로드에 실패하였습니다. error');
				location.reload();
				if (imgSeq == 4) {
					$(".marginB15").hide();
				}
			}
		});
	}


</script>


<script>

function insertReview(){
	var token = $("input[name='_csrf']").val();
	var header = "X-CSRF-TOKEN";
	
	var val_prd_board_id = '${prd_board_id}';
	var val_prd_id = '${prd_id}';
	var val_user_id = '${user_id}';
	
	
	var content= $("#evalMsgCntn").val();
	var val_star = $('#itemEvalAvgScrg').val();
	
	var val_file_yn=0;
	
    if(isEmpty(content)){
        alert("내용을 입력해 주세요.");
        return false;
    }
    
    /*
     * UX-2412 상품평 입력 화면에서 엔터 눌러도 줄바꿈 되지 않는 현상 개선
     */
    // -------------------------------------------------
    var comp = content.replace(/(\r\n|\n|\r)/gm, "\n");
    var regexp = /(\n\n|\s\n|\n\s)/gm;
    
    comp = comp.replace(regexp, "\n");
    var compmatch = comp.match(regexp);
    
    while (compmatch != null) {
        comp = comp.replace(regexp, "\n");
        compmatch = comp.match(regexp);
    }
    
    content = comp;
    // -------------------------------------------------
       
       
    if(content.toLowerCase().indexOf('<script') > -1){
        alert("상품평 내용에 script 태그를 등록할 수 없습니다.");
        return false;
    }else if(content.toLowerCase().indexOf('&lt;script') > -1){
        alert("상품평 내용에 script 태그를 등록할 수 없습니다.");
        return false;
    }else if(content.toLowerCase().indexOf('<style') > -1){
        alert("상품평 내용에 style 태그를 등록할 수 없습니다.");
        return false;
    }else if(content.toLowerCase().indexOf('&lt;style') > -1){
        alert("상품평 내용에 style 태그를 등록할 수 없습니다.");
        return false;
    }

    //console.log($("#attachImg1").find("img").length);
    //console.log($("#attachImg2").find("img").length);
    //console.log($("#attachImg3").find("img").length);

    // 3개의 이미지 업로드 탭 중 1개라도 입력되면 file_yn=1
    if($("#attachImg1").find("img").length != 0){
        $("#hiddenImg1").val($("#attachImg1").find("img").attr("src"));
        val_file_yn=1;
    }
   
    if($("#attachImg2").find("img").length != 0){
        $("#hiddenImg2").val($("#attachImg2").find("img").attr("src"));
        val_file_yn=1;
    }
   
    if($("#attachImg3").find("img").length != 0){
        $("#hiddenImg3").val($("#attachImg3").find("img").attr("src"));
        val_file_yn=1;
    }
    // 각 칸마다 사진업로드 시, 각 1씩 증가함을 확인함
    //console.log($("#attachImg1").find("img").length);
    //console.log($("#attachImg2").find("img").length);
    //console.log($("#attachImg3").find("img").length);
   
   	$("input[name='pDCItemEvalAtclVO.itemEvalCntn']").val(content);

	console.log('prd_board_id AND prd_id AND user_id',val_prd_board_id,val_prd_id,val_user_id);
	console.log('content AND star',content,val_star);
	console.log('file_yn',val_file_yn);


	var formData = new FormData();
	// image limit is 3
	if(val_file_yn){
		for (var imgSeq = 1; imgSeq < 4; imgSeq++){
			var imgId = "#getfile_" + imgSeq;
			var file = document.querySelector(imgId);
			//console.log(file);
			console.log(file.files);
			formData.append('uploadfiles', file.files[0]);
		}
	}
	
	formData.append('prd_board_id', val_prd_board_id);
	formData.append('prd_id', val_prd_id);
	formData.append('user_id', val_user_id);
	formData.append('content', content);
	formData.append('star', val_star);
	formData.append('file_yn', val_file_yn);
	
	loading(true);
	$.ajax({
		type : "post",
		url : "${app}/r/insertReview",
		processData : false,
		contentType : false,
		data : formData,
		//async : false,
		beforeSend : function(xhr) {
			xhr.setRequestHeader(header, token);
		},
		success : function(data, textStatus, jqXHR) {
			//var returnPath = data.returnPath;
			//document.querySelector('#' + imgId).src = returnPath;

			loading(false); // hmall mark
			window.close();
		},
		error : function(jqXHR, textStatus, errorThrown) {
			loading(false);
			//window.close();
		}
	});

}

</script>

</html>