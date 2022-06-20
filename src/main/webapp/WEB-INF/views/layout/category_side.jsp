<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="side">

	<a href="#allViewLayer" class="btnAllView" data-fn-layer="showAllBrand">브랜드
		전체보기</a>


	<!-- itemWrap -->
	<div class="itemWrap">
		<dl>
			<!-- 좌측영역 LOOP1 -->

			<dt>
				<a href="#">카테고리</a>
			</dt>

			<!-- ## 상위그룹매장  -->


			<!-- 좌측영역 LOOP2 -->

			<dd>
				<ul>



					<li><a href="/p/dpa/searchSectItem.do?sectId=2731740">티셔츠</a></li>


				</ul>
			</dd>

			<dd>
				<ul>



					<li><a href="/p/dpa/searchSectItem.do?sectId=2731741">셔츠/블라우스</a></li>


				</ul>
			</dd>

			<dd>
				<ul>



					<li><a href="/p/dpa/searchSectItem.do?sectId=2731742">맨투맨/후드</a></li>


				</ul>
			</dd>

			<dd>
				<ul>



					<li><a href="/p/dpa/searchSectItem.do?sectId=2731743">원피스</a></li>


				</ul>
			</dd>

			<dd>
				<ul>



					<li><a href="/p/dpa/searchSectItem.do?sectId=2731744">스커트</a></li>


				</ul>
			</dd>

			<dd>
				<ul>



					<li><a href="/p/dpa/searchSectItem.do?sectId=2731745">팬츠</a></li>


				</ul>
			</dd>

			<dd>
				<ul>



					<li><a href="/p/dpa/searchSectItem.do?sectId=2731746">트레이닝</a></li>


				</ul>
			</dd>

			<dd>
				<ul>



					<li><a href="/p/dpa/searchSectItem.do?sectId=2731747">정장</a></li>


				</ul>
			</dd>

			<dd>
				<ul>



					<li><a href="/p/dpa/searchSectItem.do?sectId=2731748">니트/가디건/베스트</a></li>


				</ul>
			</dd>

			<dd>
				<ul>



					<li><a href="/p/dpa/searchSectItem.do?sectId=2731749">자켓/코트</a></li>


				</ul>
			</dd>

			<dd>
				<ul>



					<li><a href="/p/dpa/searchSectItem.do?sectId=2731750">점퍼/패딩</a></li>


				</ul>
			</dd>

			<dd>
				<ul>



					<li><a href="/p/dpa/searchSectItem.do?sectId=2731751">가죽</a></li>


				</ul>
			</dd>

			<dd>
				<ul>



					<li><a href="/p/dpa/searchSectItem.do?sectId=2731752">모피</a></li>


				</ul>
			</dd>

			<!-- // 좌측영역 LOOP2 -->


			<!-- // 좌측영역 LOOP1 -->
		</dl>
	</div>
	<!-- // itemWrap -->

	<!-- 매장내검색 -->
	<div class="inputbox">
		<label class="inplabel icon-find"><input type="text"
			id="sect-search" name="searchTerm" value=""
			onkeydown="javascript:if(event.keyCode==13){searchSect();}"
			placeholder="여성의류 상품 검색"></label>
		<button class="btn btn-find" onclick="javascript:searchSect();">
			<i class="icon find"></i><span class="hiding">검색</span>
		</button>
		<button class="btn ico-clearabled" onclick="javascript:searchClear();">
			<i class="icon"></i><span class="hiding">지우기</span>
		</button>
	</div>
	<!-- // 매장내검색 -->
</div>