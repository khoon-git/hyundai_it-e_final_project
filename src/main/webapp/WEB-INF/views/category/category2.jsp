<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="display-list-wrap" id="itemListArea">
                                






                                <h2 class="title30"><span>티셔츠</span> <em>(164,125)</em></h2>

								
								<!-- 선택된 탭 표시 -->
								
								<ul class="ui-tab _selectCategory" role="tablist">
									<!-- 전체 -->
									
									
										
									
									<li role="presentation" class="autoCate ui-active"><a onclick="javascript:searchAutoCate(this);" role="tab">전체</a></li>
									<!-- Hmall -->
									
									
									<li role="presentation" class="autoCate "><a onclick="javascript:searchAutoCate(this, 4);" role="tab">Hmall</a></li>
									<!-- 백화점+아울렛 -->
									
									
									<li role="presentation" class="autoCate "><a onclick="javascript:searchAutoCate(this, new Array(1,3));" role="tab">현대백화점</a></li>
									<!-- 홈쇼핑 -->
									
									
									<li role="presentation" class="autoCate "><a onclick="javascript:searchAutoCate(this, 2);" role="tab">홈쇼핑</a></li>
								</ul>
								

                                <div class="list-sort-area">
                                    <div class="sortOption">
                                        <!--// 활성화시 a태그에 active 클래스 추가 REG_DTM@DESC-->
                                        
                                            
                                                <a href="javascript://" onclick="javascript:searchSortProc(this);" class="active">
                                                    <input type="hidden" class="sort" value="REG_DTM@DESC">최근등록순
                                                </a>
                                            
                                            
                                        
                                        
                                            
                                            
                                                <a href="javascript://" onclick="javascript:searchSortProc(this);">
                                                    <input type="hidden" class="sort" value="SELL_QTY@DESC">많이팔린순
                                                </a>
                                            
                                        
                                        
                                            
                                            
                                                <a href="javascript://" onclick="javascript:searchSortProc(this);">
                                                    <input type="hidden" class="sort" value="BASIC@DESC">MD추천순
                                                </a>
                                            
                                        
                                        
                                            
                                            
                                                <a href="javascript://" onclick="javascript:searchSortProc(this);">
                                                    <input type="hidden" class="sort" value="SELL_PRC@ASC">낮은가격순
                                                </a>
                                            
                                        
                                        
                                            
                                            
                                                <a href="javascript://" onclick="javascript:searchSortProc(this);">
                                                    <input type="hidden" class="sort" value="SELL_PRC@DESC">높은가격순
                                                </a>
                                            
                                                                               
                                        
                                            
                                            
                                                <a href="javascript://" onclick="javascript:searchSortProc(this);">
                                                    <input type="hidden" class="sort" value="ITEM_EVAL_CNT@DESC">상품평수순
                                                </a>
                                            
                                                                               
                                    </div>
                                    
                                    <div class="sort-form"> 
                                        
									</div>

                                    <div class="selectwrap"><div id="selectListSize" class="custom-selectbox sm" data-modules-selectbox="">
                                        <select id="listSize" onchange="javascript:listSubmit(this);">
                                            <option value="30">30개씩 보기</option>
                                            <option value="60" selected="selected">60개씩 보기</option>
                                            <option value="120">120개씩 보기</option>
                                        </select>
                                        <input type="hidden" name="f" value="on">
                                    <div class="ui-label"><a href="#2">60개씩 보기</a></div><div class="ui-selectbox"><div class="selectbox_area"><ul><li><a href="#1">30개씩 보기</a></li><li><a href="#2">60개씩 보기</a></li><li><a href="#3">120개씩 보기</a></li></ul></div></div></div></div>
                                </div>

								<!-- 선택필터 노출영역 -->
								<div class="selected-filter-list" style="display:none">
								<ul data-modules-scrollitems="align:center;" class="prev-disabled"></ul>
								<a href="javascript:searchInit();" class="reload"><i class="icon"></i><span>초기화</span></a>
								</div>
	                                
                                
	
	                                <div class="pdlist-wrap" id="pdListDiv">
	                                    <ul>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141100181&amp;sectId=2731740', 'DV0001_U01', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/1/0/10/41/2141100181_0.jpg?RS=300x300&amp;AR=0" alt="[해외배송][핀코] 팔레트 민소매 티셔츠 1G173B Y7SBE2E" id="2141100181_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [해외배송][핀코] 팔레트 민소매 티셔츠 1G173B Y7SBE2E
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="할인율이 적용된 가격">
    <p class="discount" aria-label="할인가"><em>378,000</em>원</p>
    <em class="rate" aria-label="할인율">10<i>%</i></em>
    <del class="normal" aria-label="정상가">420,000</del>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[해외배송][핀코] 팔레트 민소매 티셔츠 1G173B Y7SBE2E','2141100181','검색결과','/p/pda/itemPtc.do?slitmCd=2141100181&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141100181" data-bsitmcd="2141100181">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','013089','121022200142','2141100181', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141100224&amp;sectId=2731740', 'DV0001_U01', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/2/0/10/41/2141100224_0.jpg?RS=300x300&amp;AR=0" alt="[해외배송][핀코] 실크 블라우스 1G17HU ZR64C22" id="2141100224_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [해외배송][핀코] 실크 블라우스 1G17HU ZR64C22
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="할인율이 적용된 가격">
    <p class="discount" aria-label="할인가"><em>230,400</em>원</p>
    <em class="rate" aria-label="할인율">10<i>%</i></em>
    <del class="normal" aria-label="정상가">256,000</del>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[해외배송][핀코] 실크 블라우스 1G17HU ZR64C22','2141100224','검색결과','/p/pda/itemPtc.do?slitmCd=2141100224&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141100224" data-bsitmcd="2141100224">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','013089','121022200159','2141100224', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141100152&amp;sectId=2731740', 'DV0001_U01', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/1/0/10/41/2141100152_0.jpg?RS=300x300&amp;AR=0" alt="[해외배송][핀코] 그래디언트 반팔 티셔츠 1N13KL A0DQSH2" id="2141100152_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [해외배송][핀코] 그래디언트 반팔 티셔츠 1N13KL A0DQSH2
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="할인율이 적용된 가격">
    <p class="discount" aria-label="할인가"><em>230,400</em>원</p>
    <em class="rate" aria-label="할인율">10<i>%</i></em>
    <del class="normal" aria-label="정상가">256,000</del>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[해외배송][핀코] 그래디언트 반팔 티셔츠 1N13KL A0DQSH2','2141100152','검색결과','/p/pda/itemPtc.do?slitmCd=2141100152&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141100152" data-bsitmcd="2141100152">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','013089','121022200130','2141100152', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141100220&amp;sectId=2731740', 'DV0001_U02', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/2/0/10/41/2141100220_0.jpg?RS=300x300&amp;AR=0" alt="[해외배송][엠씨투세인트바스] 미키 마우스 스트라이프 반팔 티셔츠 EMI0001 01485B" id="2141100220_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [해외배송][엠씨투세인트바스] 미키 마우스 스트라이프 반팔 티셔츠 EMI0001 01485B
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="할인율이 적용된 가격">
    <p class="discount" aria-label="할인가"><em>126,900</em>원</p>
    <em class="rate" aria-label="할인율">10<i>%</i></em>
    <del class="normal" aria-label="정상가">141,000</del>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[해외배송][엠씨투세인트바스] 미키 마우스 스트라이프 반팔 티셔츠 EMI0001 01485B','2141100220','검색결과','/p/pda/itemPtc.do?slitmCd=2141100220&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141100220" data-bsitmcd="2141100220">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','013089','121022200151','2141100220', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141100146&amp;sectId=2731740', 'DV0001_U02', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/1/0/10/41/2141100146_0.jpg?RS=300x300&amp;AR=0" alt="UNE[윈] 모던페미닌노칼라블라우스" id="2141100146_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            UNE[윈] 모던페미닌노칼라블라우스
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="할인율이 적용된 가격">
    <p class="discount" aria-label="할인가"><em>62,900</em>원</p>
    <em class="rate" aria-label="할인율">15<i>%</i></em>
    <del class="normal" aria-label="정상가">74,000</del>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>삼성5%
	                                                            </span>
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('UNE[윈] 모던페미닌노칼라블라우스','2141100146','검색결과','/p/pda/itemPtc.do?slitmCd=2141100146&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141100146" data-bsitmcd="2141100146">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','010067','u22_4481','2141100146', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141100133&amp;sectId=2731740', 'DV0001_U01', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/1/0/10/41/2141100133_0.jpg?RS=300x300&amp;AR=0" alt="UNE[윈] 럭셔리핀턱페플럼블라우스" id="2141100133_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            UNE[윈] 럭셔리핀턱페플럼블라우스
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="할인율이 적용된 가격">
    <p class="discount" aria-label="할인가"><em>84,150</em>원</p>
    <em class="rate" aria-label="할인율">15<i>%</i></em>
    <del class="normal" aria-label="정상가">99,000</del>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>삼성5%
	                                                            </span>
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('UNE[윈] 럭셔리핀턱페플럼블라우스','2141100133','검색결과','/p/pda/itemPtc.do?slitmCd=2141100133&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141100133" data-bsitmcd="2141100133">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','010067','u22_4932','2141100133', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141100162&amp;sectId=2731740', 'DV0001_U01', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/1/0/10/41/2141100162_0.jpg?RS=300x300&amp;AR=0" alt="UNE[윈] 언발런스페플럼랩스타일블라우스" id="2141100162_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            UNE[윈] 언발런스페플럼랩스타일블라우스
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="할인율이 적용된 가격">
    <p class="discount" aria-label="할인가"><em>84,150</em>원</p>
    <em class="rate" aria-label="할인율">15<i>%</i></em>
    <del class="normal" aria-label="정상가">99,000</del>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>삼성5%
	                                                            </span>
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('UNE[윈] 언발런스페플럼랩스타일블라우스','2141100162','검색결과','/p/pda/itemPtc.do?slitmCd=2141100162&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141100162" data-bsitmcd="2141100162">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','010067','u22_4101','2141100162', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141100025&amp;sectId=2731740', 'DV0001_U01', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/0/0/10/41/2141100025_0.jpg?RS=300x300&amp;AR=0" alt="[해외배송][알렉산더맥퀸] 크롭 뷔스티에 반팔 티셔츠 653743QLACF 9000" id="2141100025_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [해외배송][알렉산더맥퀸] 크롭 뷔스티에 반팔 티셔츠 653743QLACF 9000
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="할인율이 적용된 가격">
    <p class="discount" aria-label="할인가"><em>778,500</em>원</p>
    <em class="rate" aria-label="할인율">10<i>%</i></em>
    <del class="normal" aria-label="정상가">865,000</del>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[해외배송][알렉산더맥퀸] 크롭 뷔스티에 반팔 티셔츠 653743QLACF 9000','2141100025','검색결과','/p/pda/itemPtc.do?slitmCd=2141100025&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141100025" data-bsitmcd="2141100025">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','013089','120022200066','2141100025', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141099954&amp;sectId=2731740', 'DV0001_U01', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/9/9/09/41/2141099954_0.jpg?RS=300x300&amp;AR=0" alt="UNE[윈] [린넨혼방]레터링포인트린넨블렌드탑" id="2141099954_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            UNE[윈] [린넨혼방]레터링포인트린넨블렌드탑
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="할인율이 적용된 가격">
    <p class="discount" aria-label="할인가"><em>50,150</em>원</p>
    <em class="rate" aria-label="할인율">15<i>%</i></em>
    <del class="normal" aria-label="정상가">59,000</del>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>삼성5%
	                                                            </span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('UNE[윈] [린넨혼방]레터링포인트린넨블렌드탑','2141099954','검색결과','/p/pda/itemPtc.do?slitmCd=2141099954&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141099954" data-bsitmcd="2141099954">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','010067','u22_8121','2141099954', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141099983&amp;sectId=2731740', 'DV0001_U01', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/9/9/09/41/2141099983_0.jpg?RS=300x300&amp;AR=0" alt="[해외배송][알렉산더맥퀸] 레이어드 반팔 티셔츠 659979QLACF 1000" id="2141099983_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [해외배송][알렉산더맥퀸] 레이어드 반팔 티셔츠 659979QLACF 1000
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="할인율이 적용된 가격">
    <p class="discount" aria-label="할인가"><em>986,400</em>원</p>
    <em class="rate" aria-label="할인율">10<i>%</i></em>
    <del class="normal" aria-label="정상가">1,096,000</del>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>삼성5%
	                                                            </span>
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[해외배송][알렉산더맥퀸] 레이어드 반팔 티셔츠 659979QLACF 1000','2141099983','검색결과','/p/pda/itemPtc.do?slitmCd=2141099983&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141099983" data-bsitmcd="2141099983">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','013089','120022200047','2141099983', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141099839&amp;sectId=2731740', 'DV0001_U02', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/8/9/09/41/2141099839_0.jpg?RS=300x300&amp;AR=0" alt="UNE[윈] 럭셔리자수도트시스루퍼프블라우스" id="2141099839_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            UNE[윈] 럭셔리자수도트시스루퍼프블라우스
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="할인율이 적용된 가격">
    <p class="discount" aria-label="할인가"><em>95,200</em>원</p>
    <em class="rate" aria-label="할인율">15<i>%</i></em>
    <del class="normal" aria-label="정상가">112,000</del>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>삼성5%
	                                                            </span>
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('UNE[윈] 럭셔리자수도트시스루퍼프블라우스','2141099839','검색결과','/p/pda/itemPtc.do?slitmCd=2141099839&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141099839" data-bsitmcd="2141099839">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','010067','u22_4127','2141099839', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141099923&amp;sectId=2731740', 'DV0001_U01', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/9/9/09/41/2141099923_0.jpg?RS=300x300&amp;AR=0" alt="[해외배송][디스퀘어드2] 아이콘 크루넥 반팔 티셔츠 S80GC0024S23009 100" id="2141099923_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [해외배송][디스퀘어드2] 아이콘 크루넥 반팔 티셔츠 S80GC0024S23009 100
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="할인율이 적용된 가격">
    <p class="discount" aria-label="할인가"><em>193,500</em>원</p>
    <em class="rate" aria-label="할인율">10<i>%</i></em>
    <del class="normal" aria-label="정상가">215,000</del>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>삼성5%
	                                                            </span>
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[해외배송][디스퀘어드2] 아이콘 크루넥 반팔 티셔츠 S80GC0024S23009 100','2141099923','검색결과','/p/pda/itemPtc.do?slitmCd=2141099923&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141099923" data-bsitmcd="2141099923">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','013089','120022200026','2141099923', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141099917&amp;sectId=2731740', 'DV0001_U02', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/9/9/09/41/2141099917_0.jpg?RS=300x300&amp;AR=0" alt="[해외배송][디스퀘어드2] 아이콘 크루넥 반팔 티셔츠 S80GC0024S23009 900" id="2141099917_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [해외배송][디스퀘어드2] 아이콘 크루넥 반팔 티셔츠 S80GC0024S23009 900
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="할인율이 적용된 가격">
    <p class="discount" aria-label="할인가"><em>193,500</em>원</p>
    <em class="rate" aria-label="할인율">10<i>%</i></em>
    <del class="normal" aria-label="정상가">215,000</del>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>삼성5%
	                                                            </span>
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[해외배송][디스퀘어드2] 아이콘 크루넥 반팔 티셔츠 S80GC0024S23009 900','2141099917','검색결과','/p/pda/itemPtc.do?slitmCd=2141099917&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141099917" data-bsitmcd="2141099917">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','013089','120022200025','2141099917', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141099862&amp;sectId=2731740', 'DV0001_U01', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/8/9/09/41/2141099862_0.jpg?RS=300x300&amp;AR=0" alt="[해외배송][미쏘니] 스트라이프 민소매 티셔츠 DS22SK0H.BR00HB SM86S URBAN MULTIC" id="2141099862_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [해외배송][미쏘니] 스트라이프 민소매 티셔츠 DS22SK0H.BR00HB SM86S URBAN MULTIC
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="할인율이 적용된 가격">
    <p class="discount" aria-label="할인가"><em>484,200</em>원</p>
    <em class="rate" aria-label="할인율">10<i>%</i></em>
    <del class="normal" aria-label="정상가">538,000</del>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>삼성5%
	                                                            </span>
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[해외배송][미쏘니] 스트라이프 민소매 티셔츠 DS22SK0H.BR00HB SM86S URBAN MULTIC','2141099862','검색결과','/p/pda/itemPtc.do?slitmCd=2141099862&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141099862" data-bsitmcd="2141099862">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','013089','103022200188','2141099862', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141098680&amp;sectId=2731740', 'DV0001_U02', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/6/8/09/41/2141098680_0.jpg?RS=300x300&amp;AR=0" alt="[블루페페] 퍼프소매 블라우스 WH_P212MSC010" id="2141098680_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [블루페페] 퍼프소매 블라우스 WH_P212MSC010
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="정상가 가격">
    <p class="discount" aria-label="정상가"><em>44,700</em>원</p>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[블루페페] 퍼프소매 블라우스 WH_P212MSC010','2141098680','검색결과','/p/pda/itemPtc.do?slitmCd=2141098680&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141098680" data-bsitmcd="2141098680">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','002060','P212MSC010_WH','2141098680', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141098688&amp;sectId=2731740', 'DV0001_U02', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/6/8/09/41/2141098688_0.jpg?RS=300x300&amp;AR=0" alt="[블루페페] 퍼프소매 블라우스 BK_P212MSC010" id="2141098688_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [블루페페] 퍼프소매 블라우스 BK_P212MSC010
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="정상가 가격">
    <p class="discount" aria-label="정상가"><em>44,700</em>원</p>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[블루페페] 퍼프소매 블라우스 BK_P212MSC010','2141098688','검색결과','/p/pda/itemPtc.do?slitmCd=2141098688&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141098688" data-bsitmcd="2141098688">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','002060','P212MSC010_BK','2141098688', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141098654&amp;sectId=2731740', 'DV0001_U01', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/6/8/09/41/2141098654_0.jpg?RS=300x300&amp;AR=0" alt="[블루페페] 큐프라 롱 셔츠 NY_P213MSC713" id="2141098654_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [블루페페] 큐프라 롱 셔츠 NY_P213MSC713
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="정상가 가격">
    <p class="discount" aria-label="정상가"><em>119,500</em>원</p>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[블루페페] 큐프라 롱 셔츠 NY_P213MSC713','2141098654','검색결과','/p/pda/itemPtc.do?slitmCd=2141098654&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141098654" data-bsitmcd="2141098654">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','002060','P213MSC713_NY','2141098654', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141098648&amp;sectId=2731740', 'DV0001_U02', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/6/8/09/41/2141098648_0.jpg?RS=300x300&amp;AR=0" alt="[블루페페] 러플 랩 블라우스 OR_P213MSC705" id="2141098648_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [블루페페] 러플 랩 블라우스 OR_P213MSC705
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="정상가 가격">
    <p class="discount" aria-label="정상가"><em>79,500</em>원</p>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[블루페페] 러플 랩 블라우스 OR_P213MSC705','2141098648','검색결과','/p/pda/itemPtc.do?slitmCd=2141098648&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141098648" data-bsitmcd="2141098648">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','002060','P213MSC705_OR','2141098648', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141098693&amp;sectId=2731740', 'DV0001_U01', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/6/8/09/41/2141098693_0.jpg?RS=300x300&amp;AR=0" alt="[블루페페] 퍼프소매 블라우스 YE_P212MSC010" id="2141098693_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [블루페페] 퍼프소매 블라우스 YE_P212MSC010
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="정상가 가격">
    <p class="discount" aria-label="정상가"><em>44,700</em>원</p>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[블루페페] 퍼프소매 블라우스 YE_P212MSC010','2141098693','검색결과','/p/pda/itemPtc.do?slitmCd=2141098693&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141098693" data-bsitmcd="2141098693">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','002060','P212MSC010_YE','2141098693', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141098640&amp;sectId=2731740', 'DV0001_U02', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/6/8/09/41/2141098640_0.jpg?RS=300x300&amp;AR=0" alt="[블루페페] 러플 랩 블라우스 LV_P213MSC705" id="2141098640_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [블루페페] 러플 랩 블라우스 LV_P213MSC705
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="정상가 가격">
    <p class="discount" aria-label="정상가"><em>79,500</em>원</p>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[블루페페] 러플 랩 블라우스 LV_P213MSC705','2141098640','검색결과','/p/pda/itemPtc.do?slitmCd=2141098640&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141098640" data-bsitmcd="2141098640">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','002060','P213MSC705_LV','2141098640', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141098543&amp;sectId=2731740', 'DV0001_U01', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/5/8/09/41/2141098543_0.jpg?RS=300x300&amp;AR=0" alt="[듀엘] 퍼프소매 피케 반소매 셔츠 SB_L222PSC039" id="2141098543_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [듀엘] 퍼프소매 피케 반소매 셔츠 SB_L222PSC039
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="정상가 가격">
    <p class="discount" aria-label="정상가"><em>153,300</em>원</p>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[듀엘] 퍼프소매 피케 반소매 셔츠 SB_L222PSC039','2141098543','검색결과','/p/pda/itemPtc.do?slitmCd=2141098543&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141098543" data-bsitmcd="2141098543">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','002060','L222PSC039_SB','2141098543', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141098456&amp;sectId=2731740', 'DV0001_U02', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/4/8/09/41/2141098456_0.jpg?RS=300x300&amp;AR=0" alt="[듀엘] 배색 니트카라 티셔츠 BK_L222MSM044" id="2141098456_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [듀엘] 배색 니트카라 티셔츠 BK_L222MSM044
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="정상가 가격">
    <p class="discount" aria-label="정상가"><em>97,300</em>원</p>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[듀엘] 배색 니트카라 티셔츠 BK_L222MSM044','2141098456','검색결과','/p/pda/itemPtc.do?slitmCd=2141098456&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141098456" data-bsitmcd="2141098456">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','002060','L222MSM044_BK','2141098456', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141098463&amp;sectId=2731740', 'DV0001_U01', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/4/8/09/41/2141098463_0.jpg?RS=300x300&amp;AR=0" alt="[듀엘] 레이스 빅카라 블라우스 IV_L222MSC035" id="2141098463_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [듀엘] 레이스 빅카라 블라우스 IV_L222MSC035
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="정상가 가격">
    <p class="discount" aria-label="정상가"><em>167,300</em>원</p>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[듀엘] 레이스 빅카라 블라우스 IV_L222MSC035','2141098463','검색결과','/p/pda/itemPtc.do?slitmCd=2141098463&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141098463" data-bsitmcd="2141098463">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','002060','L222MSC035_IV','2141098463', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141098481&amp;sectId=2731740', 'DV0001_U01', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/4/8/09/41/2141098481_0.jpg?RS=300x300&amp;AR=0" alt="[듀엘] 밴딩 핀턱 블라우스 BK_L222PSC040" id="2141098481_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [듀엘] 밴딩 핀턱 블라우스 BK_L222PSC040
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="정상가 가격">
    <p class="discount" aria-label="정상가"><em>181,300</em>원</p>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[듀엘] 밴딩 핀턱 블라우스 BK_L222PSC040','2141098481','검색결과','/p/pda/itemPtc.do?slitmCd=2141098481&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141098481" data-bsitmcd="2141098481">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','002060','L222PSC040_BK','2141098481', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141098486&amp;sectId=2731740', 'DV0001_U02', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/4/8/09/41/2141098486_0.jpg?RS=300x300&amp;AR=0" alt="[듀엘] 튤립넥 쉬폰 블라우스 WH_L222PSC038" id="2141098486_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [듀엘] 튤립넥 쉬폰 블라우스 WH_L222PSC038
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="정상가 가격">
    <p class="discount" aria-label="정상가"><em>153,300</em>원</p>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[듀엘] 튤립넥 쉬폰 블라우스 WH_L222PSC038','2141098486','검색결과','/p/pda/itemPtc.do?slitmCd=2141098486&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141098486" data-bsitmcd="2141098486">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','002060','L222PSC038_WH','2141098486', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141098536&amp;sectId=2731740', 'DV0001_U02', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/5/8/09/41/2141098536_0.jpg?RS=300x300&amp;AR=0" alt="[듀엘] 퍼프소매 피케 반소매 셔츠 VO_L222PSC039" id="2141098536_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [듀엘] 퍼프소매 피케 반소매 셔츠 VO_L222PSC039
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="정상가 가격">
    <p class="discount" aria-label="정상가"><em>153,300</em>원</p>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[듀엘] 퍼프소매 피케 반소매 셔츠 VO_L222PSC039','2141098536','검색결과','/p/pda/itemPtc.do?slitmCd=2141098536&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141098536" data-bsitmcd="2141098536">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','002060','L222PSC039_VO','2141098536', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141098494&amp;sectId=2731740', 'DV0001_U01', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/4/8/09/41/2141098494_0.jpg?RS=300x300&amp;AR=0" alt="[듀엘] 튤립넥 쉬폰 블라우스 PK_L222PSC038" id="2141098494_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [듀엘] 튤립넥 쉬폰 블라우스 PK_L222PSC038
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="정상가 가격">
    <p class="discount" aria-label="정상가"><em>153,300</em>원</p>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[듀엘] 튤립넥 쉬폰 블라우스 PK_L222PSC038','2141098494','검색결과','/p/pda/itemPtc.do?slitmCd=2141098494&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141098494" data-bsitmcd="2141098494">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','002060','L222PSC038_PK','2141098494', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141098498&amp;sectId=2731740', 'DV0001_U02', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/4/8/09/41/2141098498_0.jpg?RS=300x300&amp;AR=0" alt="[듀엘] 튤립넥 쉬폰 블라우스 NY_L222PSC038" id="2141098498_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [듀엘] 튤립넥 쉬폰 블라우스 NY_L222PSC038
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="정상가 가격">
    <p class="discount" aria-label="정상가"><em>153,300</em>원</p>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[듀엘] 튤립넥 쉬폰 블라우스 NY_L222PSC038','2141098498','검색결과','/p/pda/itemPtc.do?slitmCd=2141098498&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141098498" data-bsitmcd="2141098498">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','002060','L222PSC038_NY','2141098498', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141098477&amp;sectId=2731740', 'DV0001_U02', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/4/8/09/41/2141098477_0.jpg?RS=300x300&amp;AR=0" alt="[듀엘] 밴딩 핀턱 블라우스 WH_L222PSC040" id="2141098477_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [듀엘] 밴딩 핀턱 블라우스 WH_L222PSC040
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="정상가 가격">
    <p class="discount" aria-label="정상가"><em>181,300</em>원</p>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[듀엘] 밴딩 핀턱 블라우스 WH_L222PSC040','2141098477','검색결과','/p/pda/itemPtc.do?slitmCd=2141098477&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141098477" data-bsitmcd="2141098477">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','002060','L222PSC040_WH','2141098477', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141098528&amp;sectId=2731740', 'DV0001_U02', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/5/8/09/41/2141098528_0.jpg?RS=300x300&amp;AR=0" alt="[듀엘] 퍼프소매 피케 반소매 셔츠 WH_L222PSC039" id="2141098528_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [듀엘] 퍼프소매 피케 반소매 셔츠 WH_L222PSC039
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="정상가 가격">
    <p class="discount" aria-label="정상가"><em>153,300</em>원</p>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[듀엘] 퍼프소매 피케 반소매 셔츠 WH_L222PSC039','2141098528','검색결과','/p/pda/itemPtc.do?slitmCd=2141098528&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141098528" data-bsitmcd="2141098528">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','002060','L222PSC039_WH','2141098528', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141098520&amp;sectId=2731740', 'DV0001_U02', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/5/8/09/41/2141098520_0.jpg?RS=300x300&amp;AR=0" alt="[듀엘] 볼륨소매 반팔 블라우스 BK_L222MSC036" id="2141098520_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [듀엘] 볼륨소매 반팔 블라우스 BK_L222MSC036
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="정상가 가격">
    <p class="discount" aria-label="정상가"><em>153,300</em>원</p>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[듀엘] 볼륨소매 반팔 블라우스 BK_L222MSC036','2141098520','검색결과','/p/pda/itemPtc.do?slitmCd=2141098520&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141098520" data-bsitmcd="2141098520">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','002060','L222MSC036_BK','2141098520', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141098511&amp;sectId=2731740', 'DV0001_U01', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/5/8/09/41/2141098511_0.jpg?RS=300x300&amp;AR=0" alt="[듀엘] 볼륨소매 반팔 블라우스 BL_L222MSC036" id="2141098511_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [듀엘] 볼륨소매 반팔 블라우스 BL_L222MSC036
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="정상가 가격">
    <p class="discount" aria-label="정상가"><em>153,300</em>원</p>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[듀엘] 볼륨소매 반팔 블라우스 BL_L222MSC036','2141098511','검색결과','/p/pda/itemPtc.do?slitmCd=2141098511&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141098511" data-bsitmcd="2141098511">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','002060','L222MSC036_BL','2141098511', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141098450&amp;sectId=2731740', 'DV0001_U02', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/4/8/09/41/2141098450_0.jpg?RS=300x300&amp;AR=0" alt="[듀엘] 배색 니트카라 티셔츠 CR_L222MSM044" id="2141098450_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [듀엘] 배색 니트카라 티셔츠 CR_L222MSM044
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="정상가 가격">
    <p class="discount" aria-label="정상가"><em>97,300</em>원</p>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[듀엘] 배색 니트카라 티셔츠 CR_L222MSM044','2141098450','검색결과','/p/pda/itemPtc.do?slitmCd=2141098450&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141098450" data-bsitmcd="2141098450">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','002060','L222MSM044_CR','2141098450', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141098504&amp;sectId=2731740', 'DV0001_U01', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/5/8/09/41/2141098504_0.jpg?RS=300x300&amp;AR=0" alt="[듀엘] 볼륨소매 반팔 블라우스 CR_L222MSC036" id="2141098504_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [듀엘] 볼륨소매 반팔 블라우스 CR_L222MSC036
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="정상가 가격">
    <p class="discount" aria-label="정상가"><em>153,300</em>원</p>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[듀엘] 볼륨소매 반팔 블라우스 CR_L222MSC036','2141098504','검색결과','/p/pda/itemPtc.do?slitmCd=2141098504&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141098504" data-bsitmcd="2141098504">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','002060','L222MSC036_CR','2141098504', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141098470&amp;sectId=2731740', 'DV0001_U02', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/4/8/09/41/2141098470_0.jpg?RS=300x300&amp;AR=0" alt="[듀엘] 레이스 빅카라 블라우스 BK_L222MSC035" id="2141098470_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [듀엘] 레이스 빅카라 블라우스 BK_L222MSC035
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="정상가 가격">
    <p class="discount" aria-label="정상가"><em>167,300</em>원</p>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[듀엘] 레이스 빅카라 블라우스 BK_L222MSC035','2141098470','검색결과','/p/pda/itemPtc.do?slitmCd=2141098470&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141098470" data-bsitmcd="2141098470">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','002060','L222MSC035_BK','2141098470', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141098030&amp;sectId=2731740', 'DV0001_U02', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/0/8/09/41/2141098030_0.jpg?RS=300x300&amp;AR=0" alt="[ZOOC] 아일렛 레이스 블라우스 NY_V222MSC938" id="2141098030_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [ZOOC] 아일렛 레이스 블라우스 NY_V222MSC938
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="정상가 가격">
    <p class="discount" aria-label="정상가"><em>114,720</em>원</p>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[ZOOC] 아일렛 레이스 블라우스 NY_V222MSC938','2141098030','검색결과','/p/pda/itemPtc.do?slitmCd=2141098030&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141098030" data-bsitmcd="2141098030">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','002060','V222MSC938_NY','2141098030', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141098099&amp;sectId=2731740', 'DV0001_U02', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/0/8/09/41/2141098099_0.jpg?RS=300x300&amp;AR=0" alt="[하프클럽/디애이치 ]쉬즈 라운드 배색 반팔 꼬임 탑" id="2141098099_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [하프클럽/디애이치 ]쉬즈 라운드 배색 반팔 꼬임 탑
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="정상가 가격">
    <p class="discount" aria-label="정상가"><em>20,800</em>원</p>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[하프클럽/디애이치 ]쉬즈 라운드 배색 반팔 꼬임 탑','2141098099','검색결과','/p/pda/itemPtc.do?slitmCd=2141098099&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141098099" data-bsitmcd="2141098099">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','006789','P323294541','2141098099', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141098037&amp;sectId=2731740', 'DV0001_U02', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/0/8/09/41/2141098037_0.jpg?RS=300x300&amp;AR=0" alt="[ZOOC] 스퀘어넥 볼륨소매 블라우스 BE_V222MSC942" id="2141098037_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [ZOOC] 스퀘어넥 볼륨소매 블라우스 BE_V222MSC942
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="정상가 가격">
    <p class="discount" aria-label="정상가"><em>119,400</em>원</p>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[ZOOC] 스퀘어넥 볼륨소매 블라우스 BE_V222MSC942','2141098037','검색결과','/p/pda/itemPtc.do?slitmCd=2141098037&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141098037" data-bsitmcd="2141098037">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','002060','V222MSC942_BE','2141098037', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141098092&amp;sectId=2731740', 'DV0001_U01', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/0/8/09/41/2141098092_0.jpg?RS=300x300&amp;AR=0" alt="[하프클럽/디애이치 ]하인드 루즈핏 여름 반팔 니트탑" id="2141098092_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [하프클럽/디애이치 ]하인드 루즈핏 여름 반팔 니트탑
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="정상가 가격">
    <p class="discount" aria-label="정상가"><em>18,800</em>원</p>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[하프클럽/디애이치 ]하인드 루즈핏 여름 반팔 니트탑','2141098092','검색결과','/p/pda/itemPtc.do?slitmCd=2141098092&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141098092" data-bsitmcd="2141098092">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','006789','P323296798','2141098092', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141098024&amp;sectId=2731740', 'DV0001_U01', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/0/8/09/41/2141098024_0.jpg?RS=300x300&amp;AR=0" alt="[ZOOC] 아일렛 레이스 블라우스 WH_V222MSC938" id="2141098024_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [ZOOC] 아일렛 레이스 블라우스 WH_V222MSC938
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="정상가 가격">
    <p class="discount" aria-label="정상가"><em>114,720</em>원</p>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[ZOOC] 아일렛 레이스 블라우스 WH_V222MSC938','2141098024','검색결과','/p/pda/itemPtc.do?slitmCd=2141098024&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141098024" data-bsitmcd="2141098024">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','002060','V222MSC938_WH','2141098024', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141097925&amp;sectId=2731740', 'DV0001_U01', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/9/7/09/41/2141097925_0.jpg?RS=300x300&amp;AR=0" alt="[하프클럽/디애이치 ]로즈 물결 배색 러플라운드 반팔 탑" id="2141097925_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [하프클럽/디애이치 ]로즈 물결 배색 러플라운드 반팔 탑
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="정상가 가격">
    <p class="discount" aria-label="정상가"><em>19,800</em>원</p>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[하프클럽/디애이치 ]로즈 물결 배색 러플라운드 반팔 탑','2141097925','검색결과','/p/pda/itemPtc.do?slitmCd=2141097925&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141097925" data-bsitmcd="2141097925">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','006789','P323296089','2141097925', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141097387&amp;sectId=2731740', 'DV0001_U02', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/3/7/09/41/2141097387_0.jpg?RS=300x300&amp;AR=0" alt="[하프클럽/다잇템_패션]여자 슬림핏 반소매 스퀘어넥 블라우스" id="2141097387_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [하프클럽/다잇템_패션]여자 슬림핏 반소매 스퀘어넥 블라우스
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="정상가 가격">
    <p class="discount" aria-label="정상가"><em>96,000</em>원</p>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[하프클럽/다잇템_패션]여자 슬림핏 반소매 스퀘어넥 블라우스','2141097387','검색결과','/p/pda/itemPtc.do?slitmCd=2141097387&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141097387" data-bsitmcd="2141097387">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','006789','P323293382','2141097387', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141097350&amp;sectId=2731740', 'DV0001_U02', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/3/7/09/41/2141097350_0.jpg?RS=300x300&amp;AR=0" alt="[하프클럽/다잇템_패션]여자 카라 수트핏 반소매 블라우스" id="2141097350_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [하프클럽/다잇템_패션]여자 카라 수트핏 반소매 블라우스
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="정상가 가격">
    <p class="discount" aria-label="정상가"><em>50,400</em>원</p>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[하프클럽/다잇템_패션]여자 카라 수트핏 반소매 블라우스','2141097350','검색결과','/p/pda/itemPtc.do?slitmCd=2141097350&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141097350" data-bsitmcd="2141097350">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','006789','P323296166','2141097350', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141097315&amp;sectId=2731740', 'DV0001_U01', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/3/7/09/41/2141097315_0.jpg?RS=300x300&amp;AR=0" alt="[하프클럽/디애이치 ]린즈 스트라이프 라운드 넥 반팔 티셔츠" id="2141097315_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [하프클럽/디애이치 ]린즈 스트라이프 라운드 넥 반팔 티셔츠
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="정상가 가격">
    <p class="discount" aria-label="정상가"><em>16,910</em>원</p>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[하프클럽/디애이치 ]린즈 스트라이프 라운드 넥 반팔 티셔츠','2141097315','검색결과','/p/pda/itemPtc.do?slitmCd=2141097315&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141097315" data-bsitmcd="2141097315">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','006789','P323295770','2141097315', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141097319&amp;sectId=2731740', 'DV0001_U02', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/3/7/09/41/2141097319_0.jpg?RS=300x300&amp;AR=0" alt="[하프클럽/다잇템_패션]여자 솔리드 반소매 여성스러운 블라우스" id="2141097319_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [하프클럽/다잇템_패션]여자 솔리드 반소매 여성스러운 블라우스
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="정상가 가격">
    <p class="discount" aria-label="정상가"><em>59,850</em>원</p>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[하프클럽/다잇템_패션]여자 솔리드 반소매 여성스러운 블라우스','2141097319','검색결과','/p/pda/itemPtc.do?slitmCd=2141097319&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141097319" data-bsitmcd="2141097319">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','006789','P323295961','2141097319', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141097297&amp;sectId=2731740', 'DV0001_U02', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/2/7/09/41/2141097297_0.jpg?RS=300x300&amp;AR=0" alt="[하프클럽/디애이치 ]네츄럴 데일리 4color 소프트 반팔 탑" id="2141097297_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [하프클럽/디애이치 ]네츄럴 데일리 4color 소프트 반팔 탑
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="정상가 가격">
    <p class="discount" aria-label="정상가"><em>18,810</em>원</p>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[하프클럽/디애이치 ]네츄럴 데일리 4color 소프트 반팔 탑','2141097297','검색결과','/p/pda/itemPtc.do?slitmCd=2141097297&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141097297" data-bsitmcd="2141097297">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','006789','P323295199','2141097297', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141097286&amp;sectId=2731740', 'DV0001_U02', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/2/7/09/41/2141097286_0.jpg?RS=300x300&amp;AR=0" alt="[하프클럽/디애이치 ]엘렌 브이넥 소프트 펄링 반팔 탑" id="2141097286_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [하프클럽/디애이치 ]엘렌 브이넥 소프트 펄링 반팔 탑
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="정상가 가격">
    <p class="discount" aria-label="정상가"><em>18,810</em>원</p>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[하프클럽/디애이치 ]엘렌 브이넥 소프트 펄링 반팔 탑','2141097286','검색결과','/p/pda/itemPtc.do?slitmCd=2141097286&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141097286" data-bsitmcd="2141097286">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','006789','P323294860','2141097286', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141097021&amp;sectId=2731740', 'DV0001_U01', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/0/7/09/41/2141097021_0.jpg?RS=300x300&amp;AR=0" alt="[하젤] 오로 카라 스트라이프 반팔 니트티_M0934" id="2141097021_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [하젤] 오로 카라 스트라이프 반팔 니트티_M0934
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="할인율이 적용된 가격">
    <p class="discount" aria-label="할인가"><em>13,410</em>원</p>
    <em class="rate" aria-label="할인율">10<i>%</i></em>
    <del class="normal" aria-label="정상가">14,900</del>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[하젤] 오로 카라 스트라이프 반팔 니트티_M0934','2141097021','검색결과','/p/pda/itemPtc.do?slitmCd=2141097021&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141097021" data-bsitmcd="2141097021">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','020456','0517468619','2141097021', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141097037&amp;sectId=2731740', 'DV0001_U02', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/0/7/09/41/2141097037_0.jpg?RS=300x300&amp;AR=0" alt="[레코브] LU61B7BL531X 플라워크롭BL" id="2141097037_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [레코브] LU61B7BL531X 플라워크롭BL
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="할인율이 적용된 가격">
    <p class="discount" aria-label="할인가"><em>40,140</em>원</p>
    <em class="rate" aria-label="할인율">10<i>%</i></em>
    <del class="normal" aria-label="정상가">44,600</del>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
	                                                                     
		                                                                 
		                                                                   <span class="flag hdshop"> <em>현대백화점</em></span>	
		                                                                 
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>스토어픽</span>
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[레코브] LU61B7BL531X 플라워크롭BL','2141097037','검색결과','/p/pda/itemPtc.do?slitmCd=2141097037&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141097037" data-bsitmcd="2141097037">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','009892','','2141097037', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141096920&amp;sectId=2731740', 'DV0001_U02', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/9/6/09/41/2141096920_0.jpg?RS=300x300&amp;AR=0" alt="H스타일[균일가+무료배송]C_S312/셔츠/블라우스/남방/2종택1" id="2141096920_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            H스타일[균일가+무료배송]C_S312/셔츠/블라우스/남방/2종택1
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="할인율이 적용된 가격">
    <p class="discount" aria-label="할인가"><em>48,640</em>원</p>
    <em class="rate" aria-label="할인율">13<i>%</i></em>
    <del class="normal" aria-label="정상가">55,900</del>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('H스타일[균일가+무료배송]C_S312/셔츠/블라우스/남방/2종택1','2141096920','검색결과','/p/pda/itemPtc.do?slitmCd=2141096920&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141096920" data-bsitmcd="2141096920">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','014944','3649579','2141096920', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141096918&amp;sectId=2731740', 'DV0001_U02', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/9/6/09/41/2141096918_0.jpg?RS=300x300&amp;AR=0" alt="H스타일[2종행사/무료배송]P_S72/빅사이즈/나시블라우스/2종세트" id="2141096918_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            H스타일[2종행사/무료배송]P_S72/빅사이즈/나시블라우스/2종세트
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="할인율이 적용된 가격">
    <p class="discount" aria-label="할인가"><em>68,650</em>원</p>
    <em class="rate" aria-label="할인율">13<i>%</i></em>
    <del class="normal" aria-label="정상가">78,900</del>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>삼성5%
	                                                            </span>
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('H스타일[2종행사/무료배송]P_S72/빅사이즈/나시블라우스/2종세트','2141096918','검색결과','/p/pda/itemPtc.do?slitmCd=2141096918&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141096918" data-bsitmcd="2141096918">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','014944','3649578','2141096918', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141096725&amp;sectId=2731740', 'DV0001_U01', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/7/6/09/41/2141096725_0.jpg?RS=300x300&amp;AR=0" alt="[하프클럽/데이데이]뷰티풀 프린팅 티셔츠" id="2141096725_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [하프클럽/데이데이]뷰티풀 프린팅 티셔츠
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="정상가 가격">
    <p class="discount" aria-label="정상가"><em>7,510</em>원</p>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[하프클럽/데이데이]뷰티풀 프린팅 티셔츠','2141096725','검색결과','/p/pda/itemPtc.do?slitmCd=2141096725&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141096725" data-bsitmcd="2141096725">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','006789','P323293708','2141096725', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141096724&amp;sectId=2731740', 'DV0001_U01', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/7/6/09/41/2141096724_0.jpg?RS=300x300&amp;AR=0" alt="[하프클럽/데이데이]리뉴 레이어 티셔츠" id="2141096724_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [하프클럽/데이데이]리뉴 레이어 티셔츠
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="정상가 가격">
    <p class="discount" aria-label="정상가"><em>11,310</em>원</p>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[하프클럽/데이데이]리뉴 레이어 티셔츠','2141096724','검색결과','/p/pda/itemPtc.do?slitmCd=2141096724&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141096724" data-bsitmcd="2141096724">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','006789','P323293491','2141096724', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141096667&amp;sectId=2731740', 'DV0001_U02', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/6/6/09/41/2141096667_0.jpg?RS=300x300&amp;AR=0" alt="[하프클럽/데이데이]니켈 지브라 티셔츠" id="2141096667_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [하프클럽/데이데이]니켈 지브라 티셔츠
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="정상가 가격">
    <p class="discount" aria-label="정상가"><em>11,310</em>원</p>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[하프클럽/데이데이]니켈 지브라 티셔츠','2141096667','검색결과','/p/pda/itemPtc.do?slitmCd=2141096667&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141096667" data-bsitmcd="2141096667">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','006789','P323293227','2141096667', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141096689&amp;sectId=2731740', 'DV0001_U02', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/6/6/09/41/2141096689_0.jpg?RS=300x300&amp;AR=0" alt="[하프클럽/다잇템_패션]여자 프릴 반소매 에이라인 블라우스" id="2141096689_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [하프클럽/다잇템_패션]여자 프릴 반소매 에이라인 블라우스
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="정상가 가격">
    <p class="discount" aria-label="정상가"><em>96,000</em>원</p>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[하프클럽/다잇템_패션]여자 프릴 반소매 에이라인 블라우스','2141096689','검색결과','/p/pda/itemPtc.do?slitmCd=2141096689&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141096689" data-bsitmcd="2141096689">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','006789','P323293407','2141096689', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141096674&amp;sectId=2731740', 'DV0001_U01', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/6/6/09/41/2141096674_0.jpg?RS=300x300&amp;AR=0" alt="[하프클럽/다잇템_패션]여자 카라넥 셔츠남방 하프 SS 블라우스" id="2141096674_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [하프클럽/다잇템_패션]여자 카라넥 셔츠남방 하프 SS 블라우스
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="정상가 가격">
    <p class="discount" aria-label="정상가"><em>89,000</em>원</p>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[하프클럽/다잇템_패션]여자 카라넥 셔츠남방 하프 SS 블라우스','2141096674','검색결과','/p/pda/itemPtc.do?slitmCd=2141096674&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141096674" data-bsitmcd="2141096674">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','006789','P323293292','2141096674', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141096697&amp;sectId=2731740', 'DV0001_U02', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/6/6/09/41/2141096697_0.jpg?RS=300x300&amp;AR=0" alt="H스타일[2종행사/무료배송]P_S73/여름반팔니트티/2종세트" id="2141096697_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            H스타일[2종행사/무료배송]P_S73/여름반팔니트티/2종세트
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="할인율이 적용된 가격">
    <p class="discount" aria-label="할인가"><em>58,210</em>원</p>
    <em class="rate" aria-label="할인율">13<i>%</i></em>
    <del class="normal" aria-label="정상가">66,900</del>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>삼성5%
	                                                            </span>
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('H스타일[2종행사/무료배송]P_S73/여름반팔니트티/2종세트','2141096697','검색결과','/p/pda/itemPtc.do?slitmCd=2141096697&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141096697" data-bsitmcd="2141096697">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','014944','3649546','2141096697', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141096673&amp;sectId=2731740', 'DV0001_U01', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/6/6/09/41/2141096673_0.jpg?RS=300x300&amp;AR=0" alt="[하프클럽/다잇템_패션]여자 라이트니트 매쉬 딱붙는 티셔츠" id="2141096673_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [하프클럽/다잇템_패션]여자 라이트니트 매쉬 딱붙는 티셔츠
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="정상가 가격">
    <p class="discount" aria-label="정상가"><em>85,000</em>원</p>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[하프클럽/다잇템_패션]여자 라이트니트 매쉬 딱붙는 티셔츠','2141096673','검색결과','/p/pda/itemPtc.do?slitmCd=2141096673&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141096673" data-bsitmcd="2141096673">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','006789','P323293272','2141096673', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141096682&amp;sectId=2731740', 'DV0001_U01', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/6/6/09/41/2141096682_0.jpg?RS=300x300&amp;AR=0" alt="[하프클럽/다잇템_패션]여자 슬리브리스 테일러카라 SS 블라우스" id="2141096682_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [하프클럽/다잇템_패션]여자 슬리브리스 테일러카라 SS 블라우스
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="정상가 가격">
    <p class="discount" aria-label="정상가"><em>51,000</em>원</p>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[하프클럽/다잇템_패션]여자 슬리브리스 테일러카라 SS 블라우스','2141096682','검색결과','/p/pda/itemPtc.do?slitmCd=2141096682&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141096682" data-bsitmcd="2141096682">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','006789','P323293387','2141096682', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                            <!-- 무료배송 2020.11.19 icj 무료배송 세팅 위치 변경 -->
	                                            
	                                            
	                                                
	                                                    
	                                                
	                                            
	                                            
	                                                
	                                                    <!-- 혜택 영역 -->
	                                                    
	                                                    
	
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                    
	                                                        
	                                                        
	                                                    
	                                                    
	                                                    <!-- //혜택 영역 -->
	
	                                                
	                                            
	                                        <li class="pdthumb">
	                                            <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->
	                                            
												<a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141096670&amp;sectId=2731740', 'DV0001_U02', 'A');">
	                                                <div class="thumb">
	                                                    
	                                                    <img src="https://image.hmall.com/static/6/6/09/41/2141096670_0.jpg?RS=300x300&amp;AR=0" alt="[하프클럽/다잇템_패션]여자프릴러카라솔리드블라우스" id="2141096670_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
	                                                </div>
	                                                <div class="figcaption">
	                                                    <div class="pdname" aria-label="제품명">
	                                                        
	                                                            [하프클럽/다잇템_패션]여자프릴러카라솔리드블라우스
	                                                        
	                                                    </div>
	
	                                                    <div class="pdprice">
<span class="rateprice" aria-label="정상가 가격">
    <p class="discount" aria-label="정상가"><em>92,000</em>원</p>
</span>
</div>

	                                                    <div class="pdinfo">
	                                                        <div class="benefits" style="line-height: 20px;">
	                                                            <!-- 상품종류? START -->
	                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            
		                                                            　
	                                                            
	                                                            <!-- 상품종류? END -->
	                                                            
	                                                                 <span>무료배송</span>
	                                                            
	                                                        </div>
	                                                        <p class="like-count">
	                                                            
	                                                                
	                                                                
	                                                                    
	                                                                
	                                                            
	                                                        </p>
	                                                        <!-- 2020.11.26 icj : weightYn에 따른 가중치 표기 추가 -->
	                                                        
	                                                    </div>
	                                                </div>
	                                            </a>
	                                            <a href="javascript://" onclick="sendSlitmClickNewWin('[하프클럽/다잇템_패션]여자프릴러카라솔리드블라우스','2141096670','검색결과','/p/pda/itemPtc.do?slitmCd=2141096670&amp;overL=nw');" class="hoverview">
	                                                <i class="icon"></i>새창열기
	                                            </a>
	                                            <div class="alimlike" data-slitmcd="2141096670" data-bsitmcd="2141096670">
	                                                                                                
	                                                <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','006789','P323293420','2141096670', event);">
	                                                <i class="icon"></i><span class="hiding">찜</span></a>
	                                            </div>
	                                        </li>
	                                        
	                                    </ul>
	                                </div>
	                                <!-- //.pdlist-wrap -->                                
	
	                                <div class="paging"> 
	                                    




    <div class="page-prevarea">
    
    
        
    

    
        
        
            <strong aria-label="현재 선택페이지">1</strong>
        
    
        
            <a href="/p/dpa/searchSectItem.do?sectId=2731740&amp;page=2&amp;sort=REG_DTM%40DESC">2</a>
        
        
    
        
            <a href="/p/dpa/searchSectItem.do?sectId=2731740&amp;page=3&amp;sort=REG_DTM%40DESC">3</a>
        
        
    
        
            <a href="/p/dpa/searchSectItem.do?sectId=2731740&amp;page=4&amp;sort=REG_DTM%40DESC">4</a>
        
        
    
        
            <a href="/p/dpa/searchSectItem.do?sectId=2731740&amp;page=5&amp;sort=REG_DTM%40DESC">5</a>
        
        
    
        
            <a href="/p/dpa/searchSectItem.do?sectId=2731740&amp;page=6&amp;sort=REG_DTM%40DESC">6</a>
        
        
    
        
            <a href="/p/dpa/searchSectItem.do?sectId=2731740&amp;page=7&amp;sort=REG_DTM%40DESC">7</a>
        
        
    
        
            <a href="/p/dpa/searchSectItem.do?sectId=2731740&amp;page=8&amp;sort=REG_DTM%40DESC">8</a>
        
        
    
        
            <a href="/p/dpa/searchSectItem.do?sectId=2731740&amp;page=9&amp;sort=REG_DTM%40DESC">9</a>
        
        
    
        
            <a href="/p/dpa/searchSectItem.do?sectId=2731740&amp;page=10&amp;sort=REG_DTM%40DESC">10</a>
        
        
    

    
        <a href="/p/dpa/searchSectItem.do?sectId=2731740&amp;page=11&amp;sort=REG_DTM%40DESC" class="page-next" aria-label="다음페이지 이동"><i class="icon"></i><span class="hiding">다음페이지 이동</span></a>
    
    
    
        <a href="/p/dpa/searchSectItem.do?sectId=2731740&amp;page=2736&amp;sort=REG_DTM%40DESC" class="page-last" aria-label="마지막페이지 이동"><i class="icon"></i><span class="hiding">마지막페이지 이동</span></a>
    
    </div>



	                                </div>
                                
                                
                                
                                <input id="ajaxSearchCnt" type="hidden" value="(164,125)">

                            </div>