<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<style>
.product-detail-wrap {
    margin: 0 0 40px !important;
}
.container {
    width: 100%;
    min-height: calc(100vh - 505px) !important;
}
.pdr_wrap {
    margin-top: 65px !important;
}


</style>
<c:set var="app" value="${pageContext.request.contextPath}" />
<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
<input type="hidden" name="pageNum" value="${reviewpageMaker.cri.pageNum}"/>
<input type="hidden" name="amount" value="${reviewpageMaker.cri.amount}"/>
<input type="hidden" name="prd_board_id" value="${prd_board_id}"/>
<input type="hidden" name="categoryCode" value="${categoryCode}"/>
<input type="hidden" name="sort" value="1"/>

<div class="product-detail-wrap">
	<div class="pdr_wrap">
		<div class="product-info-wrap">

			<!--.left-info-->
			<!-- 좌측메뉴 -->
			<div class="left-info">
				<!-- 상품 이미지 영역 시작 -->
				<!--20200902 ui 변경-->
				<div class="product-banner-wrap">
					<div data-modules-imageviewer="">
						<div
							class="product-mainbanner slick-initialized slick-slider slick-single"
							data-modules-slick="draggable:false; dots:false; infinite:true; thumbnaiList:.slider-thumbnaii;thumbnailsToShow:1;">
							<div class="slick-list">
								<div class="slick-track"
									style="opacity: 1; width: 520px; transform: translate(0px, 0px);">
									<div class="slick-slide slick-current slick-active"
										data-slick-index="0" aria-hidden="false" style="width: 520px;">
										<div>
											<div class="item" data-item=""
												data-outputsrc="${rentalProductDTO.prd_image}?RS=520x520&AR=0"
												onerror="this.src='https://image.hmall.com/hmall/pd/no_image_600x600.jpg'"
												style="width: 100%; display: inline-block; vertical-align: top;">
												<a href="javascript:;" onclick="goGaEvent('상품상세','상단_이미지확대','')" tabindex="0">
													<img id="image-detail" src="${rentalProductDTO.prd_image}" alt="2140365970_0.jpg"
													onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=520x520&amp;AR=0')"></a>
											</div>
											
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="ui-angle"
							style="display: none; width: 260px; height: 260px; top: 0px; left: 230.5px;">
						</div>
					</div>
				</div>
				<!-- // 상품 이미지 영역 끝 -->

				<!-- 사은품 있을 경우 -->

				<!-- // 사은품 끝 -->
			</div>
			<!--// 좌측메뉴 -->

			<!-- 우측메뉴 -->
			<div class="right-info">
				<div data-viewercontent="" class="">
	                <p class="guide-txt">마우스 휠을 움직이면 상품 이미지를 더욱 상세히 보실 수 있습니다.</p>
	            </div>
				<!-- 상품 기본 정보 시작 -->
				<div class="basic-info">
					<!--prduct-title-info-->
					<div class="prduct-title-info">
						<strong class="prduct-name">${rentalProductDTO.prd_nm}</strong>
					</div>
					<!--//prduct-title-info-->
					<!-- pdinfo 플래그 -->
					<div class="pdinfo">
					</div>
					<!--//pdinfo-->
				</div>
				<div class="delivery-info">
					<dl>
						<dt>배송정보</dt>
						<dd class="deliver-save"><p><strong>무료배송</strong></p></dd>
						<dt>배송불가지역</dt>
						<dd>도서/산간지역 불가</dd>
					</dl>
				</div>
				<div class="rental-info" style="margin-top: 18px;">
					<div class="tblwrap">
				         <table>
				            <caption>테이블 제목</caption>
				            <colgroup>
				               <col style="width: 140px">
				               <col style="width: 160px">
				               <col style="width: auto">
				            </colgroup>
				            <tbody>
				               <tr>
				                  <th scope="row" rowspan="2">상품대여</th>
				                  <td>7일권</td>
				                  <td><fmt:formatNumber value="${rentalProductDTO.prd_price_7}" pattern="###,###,###" /></td>
				               </tr>
				               <tr>
				                  <td>14일권</td>
				                  <td><fmt:formatNumber value="${rentalProductDTO.prd_price_14}" pattern="###,###,###" /></td>
				               </tr>            
				            </tbody>
				         </table>
				      </div>
				</div>
				<!-- // 상품 기본 정보 끝 -->
				<div class="product-option-wrap">
                    <div class="ui-dropdown-group">
                      <div class="ui-dropdown sel-prduct">
                         <div class="drop" href="#" data-modules-dropdown="" aria-expanded="true">
                              <a class="defaultVal" href="javascript:;">대여권을 선택하세요.</a>
                          </div>
                          <div class="dropdown-menu" role="menu">
                              <div class="item-box-list">
                                    <a href="javascript://" onclick="insertPrd('${rentalProductDTO.prd_id}', '${rentalProductDTO.prd_nm}', '${rentalProductDTO.prd_price_7}', '7');" class="">
                                        <div class="figcaption">
                                            <div class="pdname" aria-label="제품명"><em class="choose-num">[7일권]&nbsp;</em>${rentalProductDTO.prd_nm}</div>    
                                            <div class="pdprice"><ins aria-label="가격"><em><fmt:formatNumber value="${rentalProductDTO.prd_price_7}" pattern="###,###,###" /></em><b>원</b></ins></div>
                                        </div>
                                    </a>
                                    <a href="javascript://" onclick="insertPrd('${rentalProductDTO.prd_id}', '${rentalProductDTO.prd_nm}', '${rentalProductDTO.prd_price_14}', '14');" class="">
                                        <div class="figcaption">
                                            <div class="pdname" aria-label="제품명"><em class="choose-num">[14일권]&nbsp;</em>${rentalProductDTO.prd_nm}</div>    
                                            <div class="pdprice"><ins aria-label="가격"><em><fmt:formatNumber value="${rentalProductDTO.prd_price_14}" pattern="###,###,###" /></em><b>원</b></ins></div>
                                        </div>
                                    </a>
                              </div>
                          </div>
                      </div>
                    </div>
                    <!-- stock-item -->
                    <div class="stock-item select-product-list" style="">
                        <input type="hidden" name="ItemCnt" value="0">
                        
                    </div>
                    
                    <!--// stock-item -->
                </div>
                <div class="sum-price" style="">
                    <div class="sum-title">
                        <strong>대여 금액
                           <a href="#tooltipCont3" data-modules-tooltip="" class=""><i class="icon que-mark"></i></a>
                        </strong>
                        <div class="tooltip-box" id="tooltipCont3">
                        	<p class="txt">반품이 필수인 상품입니다.<br>사용하신 후에는 반납신청을 통해 반납을 해주시기 바랍니다.<br>반납이 기한 후에 이뤄질 경우 추가금액이 청구될 수 있습니다.</p>
                            <button class="btn-close"><i class="icon"></i><span class="hiding">닫기</span></button>
                        <button class="btn-close"><i class="icon"></i><span class="hiding">닫기</span></button></div>
                        <!--//tooltip-box-->
                    </div>
                    <div class="price-wrap">
                    	<input type="hidden" name="total-price-int" value="0" />
                        <p class="total-price">   
                            <strong>0</strong>원              
                        </p>
                    </div>
                </div>
				<div class="btngroup prdBtnBoxGroup type00"></div>
				<!-- btngroup -->
				<div class="btngroup prdBtnBoxGroup pd_shipping_type_nomral type04">

					<button class="btn btn-default large btn-buy"
						onclick="rentalProductCore(this);" style="position: absolute; right:0; background-color:#f4b417;">
						<span>대여하기</span>
					</button>

				</div>

			</div>
		</div>
	</div>
</div>

<script>

	// 대여하기
	function rentalProductCore(obj) {
		var token = $("input[name='_csrf']").val();
		var header = "X-CSRF-TOKEN";
		var prd_id = "${productboadDTO.prd_id }";
		var prd_id_length = $("input[name='sel_prd_id']").length;
		if(prd_id_length == '0'){
			alert("대여권을 선택해주세요.");
			return false;
		}
		var prd_id = $("input[name='sel_prd_id']").val();
		var ticket = $("input[name='sel_ticket']").val();
		
		var order = {
			prd_id : prd_id,
			ticket : ticket
		};
		
		$.ajax({
			url : "${app}/rental/rentalOrder",
			method : "POST",
			data : JSON.stringify(order),
			contentType : "application/json",
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(data) {
				console.log("success");
				if(data.orderSuccess=='True'){
					location.href = '${app}/rental/rentalOrder';
				}else{
					location.href ='${app}/login';
				}
			},
			error:function(request,status,error){        
				location.href ='${app}/login';
			}
		});

	}
	
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	function insertPrd(prd_id, prd_nm, prd_price, ticket){
		var str = "";
		var prd_id_length = $("input[name='sel_ticket']").length;
		var prd_id_arr = new Array(prd_id_length);
		
		for(var i = 0; i < prd_id_length; i++){
			prd_id_arr[i] = $("input[name='sel_ticket']").eq(i).val();
		}
		if( prd_id_arr.includes(ticket)){
			alert("동일대여권이 선택되었습니다.\n아래에서 확인해주세요.");
		}
		else{
			str += "<div class='pditem'>"
			str += "<div class='product-info'>"
			str += "<div class='figcaption'>"
			str += "<div class='pdname' aria-label='제품명'>[" + ticket + "일권] " + prd_nm + "</div>"
			str += "<div class='quantity'>"
	        str += "<div class='pdprice'><ins aria-label='가격'><em>" + numberWithCommas(prd_price) +"</em><b>원</b></ins></div></div></div>"
	        str += "<button class='btn-delete btn-delete-sel-item' onclick='delItem(this)'><i class='icon'></i><span class='hiding'>삭제</span></button>"
	        str += "<input type='hidden' name='sel_ticket' value='" + ticket + "' >"
	        str += "<input type='hidden' name='sel_prd_id' value='" + prd_id + "' >"
	        str += "<input type='hidden' name='sel_prd_price' value='" + prd_price + "' >"
	        str += "</div>"
	        $(".select-product-list").html(str);
	        $(".sum-price .total-price strong").text(numberWithCommas(prd_price));
		}
        $(".sel-prduct").removeClass("ui-active");
	}
	
	function delItem(obj){
		var targetPditem = $(obj).closest(".pditem");
        $(".sum-price .total-price strong").text('0');
        
		$(targetPditem).remove();
		
	}

</script>