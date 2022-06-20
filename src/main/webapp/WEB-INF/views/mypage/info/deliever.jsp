<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="app" value="${pageContext.request.contextPath}" />
<sec:authentication property="principal.user.user_id" var="principal_user_id" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/common.css"><!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/layout.css"><!-- 공통 Layout css -->
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/popup.css"><!-- 공통 Popup css -->
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/jquery-ui.css"><!-- jQuery UI css -->
    <style>
        .hidden {
            display: none !important;
        }

        div#bannerWrap {
            background: rgb(240, 246, 234);
            padding: 20px;
            margin-bottom: 15px;
            border-radius: 5px;
        }

        p.quickmenu {
            font-size: 20px;
            font-weight: bold;
            margin-left: 15px;
        }

        .quickbtn_group {

            display: inline-flex;
            justify-content: flex-start;
            width: 100%;
            margin-left: 10px;
            align-items: center;
        }

        .quick_btn {
            border: 1px solid #ddd;
            padding: 2px 14px 4px 14px;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            border-radius: 5px;
            background: #fff;
            margin-right: 5px;
        }

        p.quickmenu {
            margin-right: 50px;
        }
        
        img.ic_img {
    	 width: 30px;
    	}

        table {
            width: 500px;
        }

        .hide {
            display: none;
        }

        .show {
            display: table-row;
        }

        .item td {
            cursor: pointer;
        }

        .cus-wrap h3 {
            margin-bottom: 20px;
            color: #333;
            font-size: 22px;
            font-weight: 700;
            line-height: 29px;
        }
        
        .cus-wrap .tblwrap table td {
		    font-size: 15px;
		    line-height: 15px;
		    border-bottom: 1px solid #eee;
		}

        .tblwrap table td {
            color: #333;
            line-height: 22px;
        }

        .basic-border-one {
            border: 1px solid #eee;
            background: white;
            padding: 15px;
            margin-bottom: 15px;
            border-radius: 5px;
            min-height: 45px;
        }

        tr.show {
            background: #f8f8f8;
		}
		
		 p.oneaone-p {
            margin-left: 10px;
            margin-bottom: 21px;
        }

        .oneaone-div {
            text-align: end;
            font-size: 14px;
            margin-bottom: 6px;
            margin-right: 5px;
        }
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <script src="//image.hmall.com/p/js/co/jquery-3.4.1.min.js"></script><!-- jQuery Plugin -->
    <script src="//image.hmall.com/p/js/co/jquery.easing.min.js"></script><!-- jQuery UI Effect -->
    <script src="//image.hmall.com/p/js/co/jquery-ui.1.12.1.min.js"></script><!-- jQuery UI js -->
    
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 카카오 우편번호 -->
    <!-- includeScript -->
    
</head>
		
		<div class="mypage-delivery-wrap">
			<h3 class="title22" style="margin-top:48px">
				배송지 리스트
				<button id="addDstnAdr" class="btn btn-lineblack small34 abs" onclick="modifyAddr(this, 'toadd');">
					<span>배송지 추가</span>
				</button>
			</h3>
		
		
			<div class="delivery-box">
				
			</div>
			
		</div>
	</div>
        <!-- // .contents -->
    </div>
    </div>
    
    
    <!-- 배송지 모달 -->
	<div class="ui-modal pop-pec003" id="pec003" tabindex="-1" role="dialog" aria-label="배송지 입력" style="z-index: 1031; display: none; padding-right: 0px;">
        <div class="ui-modal-dialog" role="document">
            <div class="content">
                <p class="ui-title">배송지 입력</p>
                <div class="content-body">
                    <div>
                        <!-- Nav tabs -->
                        <!-- <ul class="ui-tab ff5340" role="tablist">
                            <li role="presentation" class="ui-active">
                            	<a href="#addresslist" aria-controls="addresslist" role="tab" data-modules-tab="" aria-expanded="true">배송지 목록</a>
                            </li>
                            <li role="presentation" class="">
                            	<a href="#addressadd" aria-controls="addressadd" role="tab" data-modules-tab="" onclick="clearAddrInput();" aria-expanded="false">배송지 추가/수정</a>
                            </li>
                        </ul> -->
                        <!-- Tab panes -->
                        <div class="tab-content">
                        	<!-- 배송지 목록 -->
                            <!-- <div role="tabpanel" class="tab-pane ui-active" id="addresslist">
                                <div class="nodata">
                                	<span class="bgcircle"><i class="icon nodata-type15"></i></span>
                                	<p>지정된 배송지가 없습니다.</p>
                                </div>
                                
                                <div class="btngroup">
                                    <button type="button" class="btn btn-default" onclick="selectDstnAddr();">
                                    	<span>확인</span>
                                    </button>
                                    데이터 전송 후 클릭시 $(element).modal().hide()
                                </div>
                            </div> -->
                            
                            <!-- 배송지 추가/수정 -->
                            <div role="tabpanel" class="tab-pane ui-active" id="addressadd">
                            	<!-- 받은실 분 -->
                                <div class="inputbox">
                                    <input type="hidden" name="" value="" id="selectedDelieverId">
                                    <label class="inplabel">
                                    	<input type="text" onblur="nameChk(this);" name="" value="" placeholder="받으실 분" id="selectedReceiverNm" maxlength="25">
                                    </label>
                                </div>
                                
                                <!-- 주소, 우편찾기 -->
                                <div class="inputbox">
                                    <label class="inplabel btnlabel">
                                    	<input type="text" name="address_f" value="" placeholder="주소" id="selectedAddressF" readonly="">
                                    </label>
                                    <button type="button" class="btn btn-lineblack btn-confirm" onclick="kakaopost();"><span>우편번호 찾기</span></button>
                                </div>
                                
                                <!-- 상세주소 -->
                                <div class="inputbox">
                                    <label class="inplabel">
                                    	<input type="text" name="address_l" value="" placeholder="상세 주소를 입력해주세요." id="selectedAddressL" maxlength="100">
                                    </label>
                                </div>
                                
                                <!-- 전화번호 -->
                                <div class="inputbox">
                                    <label class="inplabel">
                                    	<input type="text" class="onlyNumber" name="" value="" placeholder="전화번호(필수입력) (예 : 01012345678)" id="selectedDelieverHpNo" maxlength="12">
                                    </label>
                                </div>
                                
                                <!-- 기본 배송지 설정여부 -->
                                <label class="chklabel">
                                    <input type="checkbox" name="" id="selectedActiveYn" value="">
                                    <i class="icon"></i>
                                    <span>기본배송지로 지정</span>
                                </label>
                                
                                <div class="btngroup">
                                    <button class="btn btn-linelgray" onclick="$('#pec003').modal('hide');"><span>취소</span></button>
                                    <button class="btn btn-default" id="updateAddrBtn" onclick="modifyAddr('', '');"><span>확인</span></button> <!-- modifyAddr() 인자 비어있는거 두개면 배송지 추가임. -->
                                    <!-- 데이터 전송 후 클릭시 $(element).modal().hide() -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- //.content-body -->

                <button class="btn btn-close" data-dismiss="modal"><i class="icon xico"></i><span class="hiding">레이어 닫기</span></button>
            </div>
            <!-- //.content -->
        </div>
        <!-- //.ui-modal-dialog -->
    </div>


</main>


<script>
	
$(document).ready(function(){
	changeDstn();
});




var token = $("input[name='_csrf']").val();
var header = "X-CSRF-TOKEN";

function changeDstn() {
	var token = $("input[name='_csrf']").val();
	var header = "X-CSRF-TOKEN";
	
	var deliever_id = $("#divDlvInfArea input[name='deliever_id']").val();
	
	
    // 배송지 목록 싹 지워줌 (배송지가 없는경우, 있는경우 둘 다 지움.)
    $('.delivery-box ul.list').remove(); //배송지가 있는 경우에도 지워줌
    $('.delivery-box div.nodata').remove(); //배송지가 없는 경우에도 지워줌
    
    // 유저가 가지고있는 배송지 정보 요청
	$.ajax({
		method : "get",
		url : "${app}/deliever/selectDelieverList",
		dataType:"json",
		async: true,
		contentType: "application/json",
		success : function(data) {
			
			console.log(data);
			var addrHtml = "";
			
			$("#pec003 #selectedDelieverId").val($("#singleDstn input[name=deliever_id]").val());
			if (data.length == 0) {
				addrHtml += "<div class='nodata'>";
                addrHtml += "<span class='bgcircle'><i class='icon nodata-type15'></i></span>";
                addrHtml += "<p>지정된 배송지가 없습니다.</p>";
                addrHtml += "</div>";
			}else {
				addrHtml += "<ul class='list'>";
				for (var i=0; i< data.length; i++) {
					addrHtml += "<li>";
					addrHtml += "<input type='hidden' name='user_id' value='"+data[i].user_id+"'/>";
                    addrHtml += "<input type='hidden' name='deliever_id' value='"+data[i].deliever_id+"'/>";
                    addrHtml += "<input type='hidden' name='receiver_nm' value='"+data[i].receiver_nm+"'/>";
                    addrHtml += "<input type='hidden' name='deliever_hp_no' value='"+data[i].deliever_hp_no+"'/>";
                    addrHtml += "<input type='hidden' name='address_f' value='"+data[i].address_f+"'/>";
                    addrHtml += "<input type='hidden' name='address_l' value='"+data[i].address_l+"'/>";
                    addrHtml += "<input type='hidden' name='active_yn' value='"+data[i].active_yn+"'/>";
                    
                    addrHtml += "		<p class='name'>"+data[i].receiver_nm;
                    if ( data[i].active_yn == "1" ) { //기본 배송지일 경우 추가
                        addrHtml += " <span class='tag red'>기본 배송지</span>";
                    }
                    addrHtml += "		</p>";
                    addrHtml += "        <p class='add'>("+data[i].address_f+") "+data[i].address_l+"</p>";
                    addrHtml += "        <p class='tel'>"+data[i].deliever_hp_no+"</p>";
                    
                    addrHtml += "    <div class='btngroup abs'>";
                    addrHtml += "        <button class='btn btn-linelgray small30' onclick='modifyAddr(this, \"toMod\");'><span>수정</span></button>";
                    if ( data[i].active_yn != "1" ) {
                        addrHtml += "        <button class='btn btn-linelgray small30' onclick='modifyAddr(this, \"delete\");'><span>삭제</span></button>";
                    }
                    addrHtml += "    </div>"; //end btngroup abs
                    addrHtml += "</li>";
				} //end for
				
				addrHtml += "</ul>";
				
			} // end if
			
			$('.delivery-box').prepend(addrHtml); // ul 자식요소로 맨앞에 삽입

			
		} //end success
		,
		error : function(error) {
			alert(error);
		}
		
		
	});
    
}

//배송지 추가/수정 클릭시 창 인풋 클리어(clearAddrInput() 완)
// 배송지 추가/수정에서 취소버튼 누를시 모달을 닫음 (html에서 완)

/* 배송지 추가,수정,삭제 */
function modifyAddr(obj, modType) {
	
	console.log(obj);
	//수정버튼을 통해 들어갈시 확인버튼의 onclick 속성의 파라미터를 modSubmit으로 변경
	if (modType != 'addSubmit') {
		$("#updateAddrBtn").removeAttr("onclick");
		$("#updateAddrBtn").attr("onclick", "modifyAddr('', \"modSubmit\");");
	}
	
	// 수정하기 버튼 클릭시
	if ( modType == "toMod" ) {

        $("#pec003 #selectedDelieverId").val($(obj).parent().siblings("input[name=deliever_id]").val()); //siblings : obj 요소의 형제 요소 중"input[name=deliever_id]" 요소를 반환함.
        $("#pec003 #selectedReceiverNm").val($(obj).parent().siblings("input[name=receiver_nm]").val());
        $("#pec003 #selectedAddressF").val($(obj).parent().siblings("input[name=address_f]").val());
        $("#pec003 #selectedAddressL").val($(obj).parent().siblings("input[name=address_l]").val());
        $("#pec003 #selectedDelieverHpNo").val($(obj).parent().siblings("input[name=deliever_hp_no]").val().replace(/[^0-9]/g,""));
        //기본 배송지 여부
        if ( $(obj).parent().siblings("input[name=active_yn]").val() == "1" ) {
            $("#pec003 #selectedActiveYn").prop("checked", true);
            $("#pec003 #selectedActiveYn").prop("type", "checkbox");
        } else {
            $("#pec003 #selectedActiveYn").prop("checked", false);
            $("#pec003 #selectedActiveYn").prop("type", "checkbox");
        }
        
        $('#pec003').modal("show");
        return;
    }
	
	
	// 배송지 추가 선택시
	if (modType == "toadd") {
		$("#pec003 #selectedDelieverId").val(''); 
        $("#pec003 #selectedReceiverNm").val('');
        $("#pec003 #selectedAddressF").val('');
        $("#pec003 #selectedAddressL").val('');
        $("#pec003 #selectedDelieverHpNo").val('');
        $("#pec003 #selectedActiveYn").prop("checked", false);
        
        $('#pec003').modal("show");
        $("#updateAddrBtn").removeAttr("onclick");
		$("#updateAddrBtn").attr("onclick", "modifyAddr('', \"addSubmit\");");
        return;
	}
	
	
	
	
	//배송지 추가/수정 탭에서 확인버튼을 눌렀을 때 먼저 유효성 검증을 해줌
	if ( modType != "delete" ) {
        if ( isEmpty($("#pec003 #selectedReceiverNm").val()) ) {
            alert("받으실분이 입력되지 않았습니다.");
            $("#pec003 #selectedReceiverNm").focus();
            return;
        }

        if ( isEmpty($("#pec003 #selectedAddressF").val()) ) {
            alert("주소가 입력되지 않았습니다.");
            return;
        }

        if ( isEmpty($("#pec003 #selectedAddressL").val()) ) {
            alert("상세주소가 입력되지 않았습니다.");
            $("#pec003 #selectedAddressL").focus();
            return;
        }

        if ( $("#pec003 #selectedAddressL").val().indexOf('\"') > -1 ) {
            alert("상세주소에 \" 는 입력할 수 없습니다.");
            $("#pec003 #selectedAddressL").focus();
            return;
        }

        if ( !checkMoblie($("#pec003 #selectedDelieverHpNo"), "전화번호") ) {
            return;
        }
    }
	
    //전송할 배송지 데이터
	var delieverId = "";
    var receiverNm = "";
    var addressF = "";
    var addressL = "";
    var delieverHpNo = "";
    var activeYn = "0";
    var url = ""; //배송지 curd 요청 url
    
    // 배송지 삭제요청
    if ( modType == "delete" ) {
    	console.log("배송지 삭제 요청")
    	var isDelete = confirm("삭제하시겠습니까?");
    	if (isDelete == false) {
    		return ;
    	}
    	delieverId = $(obj).parent().siblings("input[name=deliever_id]").val();
        if (delieverId == $("#pec003 #selectedDelieverId").val()) {
        	console.log($("#pec003 #selectedDelieverId").val());
            alert("선택 되어있는 배송지는 삭제 할 수 없습니다.");
            return;
        }
        url = "${app}/deliever/deleteDeliever";
    } else { // 삭제요청이 아닌경우 modType이 modSubmit이면 수정요청, addSubmit이면 생성 요청
    	delieverId = $("#pec003 #selectedDelieverId").val();
    	receiverNm = $("#pec003 #selectedReceiverNm").val();
    	addressF = $("#pec003 #selectedAddressF").val();
    	addressL = $("#pec003 #selectedAddressL").val();
    	delieverHpNo = $("#pec003 #selectedDelieverHpNo").val();
    	activeYn = $("#pec003 #selectedActiveYn").prop("checked")?"1":"0";
    	
    	if (modType == "modSubmit") { //수정 요청인 경우
    		url = "${app}/deliever/updateDeliever";
    	}
    	else if( modType == "addSubmit") { //생성 요청인 경우
    		url = "${app}/deliever/insertDeliever";
    	}
    	
    }
    
    $.ajax({
        type: "post"
        //,url: "/p/oda/updateDstnAdrList.do"
        ,url: url
        ,data : {
        	"deliever_id":delieverId,
        	"receiver_nm":receiverNm,
        	"address_f":addressF,
        	"address_l":addressL,
        	"deliever_hp_no":delieverHpNo,
        	"active_yn":activeYn,
        }
        ,beforeSend : function(xhr) { //post요청은 beforeSend 필수 (csrf)
			xhr.setRequestHeader(header, token);
		}
        ,dataType: "text"
        ,async: true
        ,success : function(data) {
        	//console.log(data);
        	changeDstn();
        	if (modType == "addSubmit") {
        		alert("배송지가 추가되었습니다.");
        	} else if (modType == "modSubmit") {
        		alert("배송지가 수정되었습니다.");
        	} else if(modType == "delete") {
        		alert("배송지가 삭제되었습니다.")
        	}
        	
        	
        	$('#pec003').modal("hide");
        }
        ,error: function(error) {
        	alert(error);
        }
    });
    
    
}

// 배송지 추가/수정 창 인풋 클리어
function clearAddrInput() {
    $("#pec003 #selectedDelieverId").val("");
    $("#pec003 #selectedReceiverNm").val("");
    $("#pec003 #selectedDelieverHpNo").val("");
    $("#pec003 #selectedAddressF").val("");
    $("#pec003 #selectedAddressL").val("");
    
  	//배송지 추가/수정 버튼을 통해 들어갈시 확인버튼의 onclick 속성의 파라미터를 toAdd로 변경
	$("#updateAddrBtn").removeAttr("onclick");
	$("#updateAddrBtn").attr("onclick", "modifyAddr('', \"addSubmit\");");
}

//배송지 목록에서 확인버튼 누르면 selectDstnAddr
function selectDstnAddr() {

	//배송지 선택 안했을 경우
	if ( $("input[name=dstnRadio]:checked").val() != "on" ) {
        alert("주소를 선택해주세요.");
        return;
    }
	
	//모달에 있는 값을 화면에 띄워줘야함/
	$("#pec003 ul.addresslist input[name=dstnRadio]").each(function(index) {
		
		if ( $(this).prop("checked") ) {
			// 모달창에서 체크되어있는 배송지의 정보들
			var user_id = $("#pec003 ul.addresslist input[name=user_id]").eq(index).val();
			var deliever_id = $("#pec003 ul.addresslist input[name=deliever_id]").eq(index).val();
			var receiver_nm = $("#pec003 ul.addresslist input[name=receiver_nm]").eq(index).val();
			var deliever_hp_no =  $("#pec003 ul.addresslist input[name=deliever_hp_no]").eq(index).val();
			var address_f = $("#pec003 ul.addresslist input[name=address_f]").eq(index).val();
			var address_l = $("#pec003 ul.addresslist input[name=address_l]").eq(index).val();
			var active_yn = $("#pec003 ul.addresslist input[name=active_yn]").eq(index).val();
			
			//배송지정보 먼저 초기화 후 모달에 있는값으로 바꿔줌
			$("#singleDstn").empty();
			var addInfoHtml = "";
			addInfoHtml += "<div class='hidden' id='divDlvInfArea'>";
			addInfoHtml += "	<input type='hidden' name='user_id' value="+user_id+">";
			addInfoHtml += "	<input type='hidden' name='deliever_id' value="+deliever_id+">";
			addInfoHtml += "	<input type='hidden' name='receiver_nm' value="+receiver_nm+">";
			addInfoHtml += "	<input type='hidden' name='deliever_hp_no' value="+deliever_hp_no+">";
			addInfoHtml += "	<input type='hidden' name='address_f' value="+address_f+">";
			addInfoHtml += "	<input type='hidden' name='address_l' value="+address_l+">";
			addInfoHtml += "	<input type='hidden' name='active_yn' value="+active_yn+">";
			addInfoHtml += "</div>";
			addInfoHtml += "<a href='javascript:changeDstn();' class='link-box'>";
			addInfoHtml += "	<span class='name'>"+receiver_nm;
			if(active_yn == "1"){
				addInfoHtml += "	<em class='tag'>기본 배송지</em>";
			}
			addInfoHtml += "	</span>";
			addInfoHtml += "	<span class='txt'>"+address_l+"</span>";
			addInfoHtml += "	<ul class='user-info'>";
			addInfoHtml += "		<li>"+deliever_hp_no+"</li>";
			addInfoHtml += "	</ul>";
			addInfoHtml += "</a>";
			$("#singleDstn").append(addInfoHtml);
			
			
			//배송 메시지 초기화
			$("#dlvMsgSelect").find('option:first').prop('selected',true);
			changeDlvMsg($("#dlvMsgSelect")[0] );
			$(".ui-label a").text($("#dlvMsgSelect").find("option:selected").text());
			
		}
	});
	
	$('#singleDstnMsg').show();
	$('#pec003').modal("hide");
	
}

//휴대폰번호 체크
function checkMoblie(obj, name) {
    var inputValue = $(obj).val();
    var mobileDdd = "";
    var mobilePhone1 = "";
    var mobilePhone2 = "";

    var pattern = /\D/g;

    if (pattern.test(inputValue)){
        isValidMobilePhone = false;
        alert("숫자만 입력해주세요.");
        $(obj).focus();
        return false;
    }


    if(inputValue.length < 10 || inputValue.length > 11 ){
        isValidMobilePhone = false;
        alert(name+"을 확인 해주세요.");
        $(obj).focus();
        return false;
    }

    //번호 3등분
    //국번 010/011/016/017/018/019/로 시작하는 3자리
    var numF = inputValue.substring(0,3);
    var numPattern = /01[016789]/;
    if(!numPattern.test(numF)){
        isValidMobilePhone = false;
        alert(name+"을 확인 해주세요.");
        $(obj).focus();
        return false;
    }

    if(inputValue.length == 10){
        mobileDdd  = inputValue.substring(0,3);
        mobilePhone1  = inputValue.substring(3,6);
        mobilePhone2  = inputValue.substring(6,10);

    }else if(inputValue.length == 11){
        mobileDdd  = inputValue.substring(0,3);
        mobilePhone1  = inputValue.substring(3,7);
        mobilePhone2  = inputValue.substring(7,11);

    }else{
        isValidMobilePhone = false;
        alert(name+"을 확인 해주세요.");
        $(obj).focus();
        return false;
    }

    return true;
}

// 이름 공백 체크
function nameChk(obj){
    var pattern1 = /\s{2,}/g;
    var name = $(obj).val();
    var vali_1 = false;
    var vali_2 = false;
    var vali_3 = false;

    if(pattern1.test(name)){
        name = name.replaceAll(pattern1,"");
        vali_1 = true;
    }
    if(name[0]== " " || name[0] == "\t"){
        name = name.slice(1,name.length);
        vali_2 = true;
    }
    if (name[name.length-1] == " " || name[name.length-1] == "\t") {
        name = name.slice(0,name.length-1);
        vali_3 = true;
    }

    if(vali_1){
        alert("공백은 연속해서 입력할 수 없습니다.");
    }else if(vali_2){
        alert("이름은 공백으로 시작할 수 없습니다.");
    }else if(vali_3){
        alert("이름은 공백으로 끝날 수 없습니다.");
    }

    $(obj).val(name);
}


/* 카카오 우편번호 */
function kakaopost() {
    new daum.Postcode({
    	// oncomplete : 주소 선택 후 콜백
        oncomplete: function(data) {
        	// kakaoPost에서 가져온 우편번호, 주소값을 저장
           $("input[name='address_f']").val(data.zonecode);
           $("input[name='address_l']").val(data.address+", ");
           $("input[name='address_f']").attr('readonly', true);
           
           
           $("input[name='address_l']").focus();
        }
    }).open();
}

</script>



</html>