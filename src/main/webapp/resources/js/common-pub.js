var popName;
var mql = window.matchMedia("screen and (max-width: 768px)");
var mql2 = window.matchMedia("screen and (max-width: 1024px)");
var commonPub = {
	common : function(){
		setTimeout(function(){
			$(window).off('scroll').on('scroll', commonPub.scrollEvent);
			$(window).trigger('scroll');

			$(window).off('resize').on('resize', commonPub.resizeEvent);
			$(window).trigger('resize');

			commonPub.readonlyBackspaceOff();
			commonPub.inputBundle();
			commonPub.accordianList();
			commonPub.goTop();
			commonPub.layerPopDimClose();

			commonPub.gnbMenuHeight();
			commonPub.pcGnbFunc();
			commonPub.moLnbFunc();
			commonPub.quickMenu();
			commonPub.addQuick();
			commonPub.bottomBanner();
			
		} , 0);
		
		setTimeout(function(){
			commonPub.pageTopBnr();

		}, 300)

	},
	
	gnb1depthPoint : function(pageId) {
		$('#gnb .'+ pageId +' .depth1').addClass('on');
		$('#mobileGnb .'+ pageId +' .depth1').addClass('on').next('.depth2').css('display','block');
	},	

	gnbMenuHeight : function(){
		var menuLength = $('#gnb > ul > li').length;
		var menuHeight = [];

		for (var i = 0; i < menuLength; i++) {
			var dept2Height = $('#gnb > ul > li').eq(i).find('.depth2').innerHeight();
			menuHeight.push(dept2Height);

			var maxNum = Math.max.apply(null, menuHeight);
			var longestHeight = maxNum + 53;
		}

		// console.log(longestHeight)
		$('.gnb_menu_layer .menu_bg').css({'height' : longestHeight });
	},

	// PC GNB
	pcGnbFunc : function(){

		// 메뉴 여닫기
		$('#gnb').on('mouseenter', function(){
			

			$('#headerDim').stop().fadeIn(200);
			$('.gnb_menu_layer').stop().slideDown(200);
			$('#gnb .depth2').stop().slideDown(200);
		});
		$('#header').on('mouseleave', function(){
			$('#headerDim').stop().fadeOut(200);
			$('.gnb_menu_layer').stop().slideUp(200);
			$('#gnb .depth2').stop().slideUp(200);
		});
		
		// 1뎁스 메뉴 강조
		var pageId = $('#contents > div').attr('id');
		if ( pageId == 'introduce' ) {
			commonPub.gnb1depthPoint('introduce');
		}
		else if ( pageId == 'collect' ) {
			commonPub.gnb1depthPoint('collect');
		}
		else if ( pageId == 'use' ) {
			commonPub.gnb1depthPoint('use');
		}
		else if ( pageId == 'benefit' ) {
			commonPub.gnb1depthPoint('benefit');
		}
		else if ( pageId == 'club' ) {
			commonPub.gnb1depthPoint('club');
		}
		else if ( pageId == 'hpay' ) {
			commonPub.gnb1depthPoint('hpay');
		}
		else if ( pageId == 'hmagazine' ) {
			commonPub.gnb1depthPoint('hmagazine');
		}
		else if ( pageId == 'customer' ) {
			commonPub.gnb1depthPoint('customer');
		}
		$('#gnb > ul > li').on('mouseenter', function(){
			$(this).find('.depth1').addClass('on');
		}).on('mouseleave', function(){
			$('#gnb .depth1').removeClass('on');
			commonPub.gnb1depthPoint(pageId);
		});

		
		// gnb 배너 2개일때
		var gnbBnrLength = $('.gnb_banner .img').length;
		if ( gnbBnrLength > 1 ) {
			$('.gnb_banner .img').eq(0).css({'background-position' : 'right center'});
			$('.gnb_banner .img').eq(1).css({'background-position' : 'left center'});
		}


		//회원가입 유도 배너
		if($('#wrapper').hasClass('mainWrapper')){
			$('.bnr_sign').fadeIn(200);
		}
		else {
			$('.bnr_sign').hide();
		}
		$('.bnr_sign .btn_close').off('click').on('click',function(){
			$('.bnr_sign').fadeOut(200);
		})

	},

	// Mobile LNB
	moLnbFunc : function(){

		// 모바일 메뉴 버튼
		$('.btn_hd_menu').on('click', function(){
			if (!$(this).hasClass('on')) {
				$('body').css({'overflow': 'hidden'});
				$(this).addClass('on');
				commonPub.moLnbOpen();
			} 
			else {
				$('body').css({'overflow': ''});
				$(this).removeClass('on');
				commonPub.moLnbClose();
			}
		});

		// 모바일 2뎁스 메뉴 노출
		$('#mobileGnb .depth1').on('click', function(){
			$('#mobileGnb .depth1').removeClass('on');
			$('#mobileGnb .depth2').hide();
			$(this).addClass('on').next('.depth2').show();
		});

		// lnb 배너
		var lnbBnrLength = $('#lnb .swiper-slide').length;
		if ( lnbBnrLength > 1 ) {
			var lnbBnrSwiper = new Swiper("#lnb .swiper-container", {
				loop: true,
				autoplay: {
					delay: 5000,
					disableOnInteraction: false,
				},
				observer: true,
    			observeParents: true,
				pagination: {
					el: $('#lnb .swiper-container').find('.swiper-pagination'),
					clickable : true
				},
			});

			// lnbBnrSwiper();
		}
		
		// lnb열린 상태로 브라우저 PC크기로 늘렸을때 lnb 닫기		
		mql2.addListener(function(e) {
			if(!e.matches) {
				commonPub.moLnbClose();	
				$('.btn_hd_menu').removeClass('on');
			} 
		});
	},
	
	// 모바일 메뉴 열기
	moLnbOpen : function(){
		// console.log('open');
		$('#lnb').show();
		$('#lnb .dim').fadeIn(300);
		$('#lnb .container').animate({
			scrollTop : 0
		}, 0).animate({
			'right' : 0
		}, 300);
		$('#lnb .top_area').animate({
			'right' : 0,
		}, 300);
	},

	// 모바일 메뉴 닫기
	moLnbClose : function(){
		// console.log('close');
		$('#lnb .dim').fadeOut(300, function(){
			$('#lnb').hide();			
			$('html, body').removeClass('scrollHide');
		});
		$('#lnb .container, #lnb .top_area').animate({
			'right' : '-100%',
		}, 300);
	},

	
	headerScrollAction : function(){
		
		// 스크롤 시 body에 클래스 추가
		if ($(window).scrollTop() >= 1) {
			$('body').addClass('scrollOn');
		} else {
			$('body').removeClass('scrollOn');
		}

	},

	scrollEvent : function(){
		commonPub.headerScrollAction();
		// bottom fixed 요소 푸터위에 고정
		// var scrollBottom = $('body').height() - $('.stnd_bar').height() - $(window).scrollTop();
		
		// if (scrollBottom >= $('#footer').innerHeight()){
		// 	$('.bottom_fix_bar').removeClass('meetFooter');
		// }else {
		// 	$('.bottom_fix_bar').addClass('meetFooter');
		// }

		var win_h = $(window).height();
		if ($(window).scrollTop() > win_h) {
			$('.pageTop').fadeIn();
			$('#quickMenu').addClass('withTop');
		} else {
			$('.pageTop').fadeOut();
			$('#quickMenu').removeClass('withTop');
		}

		// 플로팅 퀵메뉴가 열려있는 경우
		if($('#quickMenu .quick_list').is(':visible') && $('#quickMenu .quick_list').hasClass('mo_quick')){
			// if($('#quickMenu .quick_list').hasClass('quickOpen')) {
			// 	$('#quickMenu .quick_list').slideDown(0);	
			// }
			// else {
			// 	$('#quickMenu .quick_list').slideUp(200);
			// }
			// $('#quickMenu .quick_list').removeClass('quickOpen');

			$('#quickMenu .quick_list').slideUp(200);
		}

		//메인비쥬얼 스크롤유도 버튼
		if ($(window).scrollTop() > 0) {
			$('#main .scroll_down').fadeOut(200);
		} else {
			$('#main .scroll_down').fadeIn(200);
		}
	},
	
	resizeEvent : function(){
		if ($('.popup_ui.type_modal').hasClass('active')) {
			commonPub.setLayerPopHeight(popName);
		}

		commonPub.pageTopBnr();
		commonPub.addQuick();
	},

	// 탑배너 노출시 배너 높이 값에 따라 헤더 위치 조정
	pageTopBnr : function(){
		
		if ($('body').hasClass('hasTopBnr')) {
			commonPub.withTopBnr();
		}
		else {
			commonPub.withoutTopBnr();
		}

	},

	withTopBnr : function(){
		var topBnr_h = $('.page_top_banner').height();
		var header_h = $('#header').outerHeight();		
		$('#header').css({'top' : topBnr_h});
		$('#lnb').css({'top' : topBnr_h});
		$('#lnb .top_area').css({'top' : topBnr_h});
		$('#lnb .container').css({'height' : 'calc(100% - ' + topBnr_h + 'px)'});
		$('.btn_hd_menu').css({'top' : topBnr_h});
		$('.hd_util_mo').css({'top' : topBnr_h});
		$('#contents').css({'padding-top' : topBnr_h + header_h});
		$('#hmagazine .viewpageTitle').css({'top' : topBnr_h});
	},

	withoutTopBnr : function(){
		var header_h = $('#header').outerHeight();
		$('#header').css({'top' : 0});
		$('#lnb').css({'top' : 0});
		$('#lnb .container').css({'height' : '100%'});
		$('#lnb .top_area').css({'top' : 0});
		$('.btn_hd_menu').css({'top' : 0});
		$('.hd_util_mo').css({'top' : 0});
		$('#contents').css({'padding-top' : header_h});
		$('#hmagazine .viewpageTitle').css({'top' : 0});
	},

	
	// input 클래스 add/remove
	inputBundle : function(){
		$('.inp_bundle').each(function(){
			var _input = $(this).find('input[type!="hidden"]');
			var _select = $(this).find('.select');

			// input
			_input.on('focus', function(){
				
				if (!$(this).attr('readonly')) {
					$(this).closest('.inp_bundle').addClass('focus');
					$(this).closest('.inp_bundle').removeClass('error');
					console.log('readonly 아님')
				}

			}).on('blur', function(){
				// 값이 없으면
				if (!$(this).val()) {
					// console.log("값 없음")
					$(this).closest('.inp_bundle').removeClass('focus');
				}
			});

			// select
			_select.on('change', function(){
				$(this).addClass('changed');
			});
			_select.on('focus', function(){
				$(this).closest('.inp_bundle').addClass('focus');
				$(this).closest('.inp_bundle').removeClass('error');
			}).on('blur', function(){
				// 값이 없으면
				if (!$(this).hasClass('changed')) {
					// console.log("값 없음")
					$(this).closest('.inp_bundle').removeClass('focus');
				}
			});
		});

		// 전화번호
		$('.tel_bundle').each(function(){
			var _inSelect = $(this).find('select');
			var _inInput = $(this).find('input[type!="hidden"]');
			_inSelect.on('focus', function(){
				$(this).closest('.inp_bundle').addClass('focus');
				$(this).closest('.inp_bundle').removeClass('error');
			});
			_inInput.on('focus', function(){
				$(this).closest('.inp_bundle').prev().addClass('focus');
				$(this).closest('.inp_bundle').prev().removeClass('error');

			}).on('blur', function(){
				// 전화번호 인풋에 blur될때 값이 없으면
				if (!$(this).val()) {
					// 전화번호 셀렉트에 focus 제거
					$(this).closest('.inp_bundle').prev().removeClass('focus');
				}
			});
		});

		// textarea 
		$('.textarea_ui').each(function(){
			var _textarea = $(this).find('textarea');

			_textarea.on('focus', function(){
				$(this).addClass('focus');
				$(this).removeClass('error');

			}).on('blur', function(){
				// 값이 없으면
				if (!$(this).val()) {
					$(this).removeClass('focus');
				}
			});

		});

	},

	// IE input text readonly일때 백스페이스 눌러도 이전페이지로 이동하지 않도록
	readonlyBackspaceOff : function(){
		$(document).keydown(function(e) {
			if(e.target.nodeName != "INPUT" && e.target.nodeName != "TEXTAREA"){
				if(e.keyCode == 8){
					return false;
			   }
			}
			if(e.target.readOnly){ // readonly일 경우 true
				if(e.keyCode == 8){
					return false;
			   }
			}
		});
	},


	
	// accordian list
	accordianList : function(){
		$('.acodiList .ac_head').each(function(){
			$(this).click(function(){
				//조건 제거
				//if (!$(this).closest('.ac_item').hasClass('on') && !$(this).hasClass('ing') && !$(this).hasClass('ing2')) {
				if (!$(this).closest('.ac_item').hasClass('on')) {
					$('.ac_item').removeClass('on');
					$(this).closest('.ac_item').addClass('on');
					$('.ac_panel').stop().slideUp(200);
					$(this).next().stop().slideDown(200);

				} else {
					$(this).closest('.ac_item').removeClass('on');
					$(this).next().stop().slideUp(200);
				}
			});
		});
	},
	

	//// 팝업
	// 버튼을 통해 모달팝업 오픈
	modalPopOpen : function(_this){
		$('body, html').css('overflow','hidden');
		popName = $(_this).data('pop');
		// console.log(popName)
		$('.popup_ui.'+ popName).fadeIn(200, function(){
			$(this).addClass('active');
		})

		// 쿠폰 상세 팝업 내의 app이동하기 팝업 띄울 때
		if($(_this).parents('.popup_ui').hasClass('pop_coupon_detail')){
			commonPub.layerPopClose(_this);
		}

		commonPub.setLayerPopHeight(popName);
		return false;
	},

	// 버튼을 통해 풀페이지팝업 오픈
	fullPopOpen : function(_this){
		$('body, html').css('overflow','hidden');
		popName = $(_this).data('pop');
		// console.log(popName)
		$('.popup_ui.'+ popName).fadeIn(200, function(){
			$(this).addClass('active');
		})
		return false;
	},

	// 모달팝업 디폴트로 오픈
	modalPopOpenSelf : function(target){
		$('body, html').css('overflow','hidden');
		popName = target;
		console.log(popName)
		$('#'+ popName).fadeIn(200, function(){
			$(this).addClass('active');
		})
		commonPub.setLayerPopHeight(popName);
	},


	// 버튼을 통해 해당 팝업 닫기
	layerPopClose : function(_this){
		$(_this).closest('.popup_ui').fadeOut(200, function(){
			$(this).removeClass('active');
			if (!$('.popup_ui').hasClass('active')) {
				$('body, html').css('overflow','auto');
			}
		});
	},

	// 레이어팝업 외부 클릭시 팝업닫기
	layerPopDimClose : function() {
		$('.dimCloseArea').on('click', function(e){

			var thisPop = $(this).closest('.popup_ui');
			var thisPopClass = thisPop[0].classList[2];

			$('.popup_ui.'+ thisPopClass).fadeOut(200, function(){
				$(this).removeClass('active');
				if (!$('.popup_ui').hasClass('active')) {
					$('body, html').css('overflow','auto');
				}
			})

		});
	},
	
	
	// 팝업이 브라우저보다 작을 때 가운데 노출
	setLayerPopHeight : function(popName){
		var winHeight = $(window).height();
		var popHeight = $('.popup_ui.'+ popName + ' .pop_layer').innerHeight();
		var popHeightHalf = parseInt(popHeight/2 - 50);
		
		if (popHeight < winHeight){
			// console.log(winHeight, popHeight, popName);
			$('.popup_ui.'+ popName +' .pop_layer').css({
				'left':'50%',
				'top':'50%',
				'transform':'translateX(-50%)',
				'margin-top': -popHeightHalf + 'px',
			});

			// 모바일 사이즈에서 메인 모달 배너 위치 고정
			if (mql.matches) {
				if (popName == 'pop_mobal_banner') {
					// console.log('메인 모달 배너!!!')
					$('.popup_ui.'+ popName +' .pop_layer').css({
						'left':'50%',
						'top':'50%',
						'transform':'translateX(-50%)',
						'margin-top': '-190px',
					});
				}
			}
		}
		else {
			$('.popup_ui.'+ popName +' .pop_layer').css({
				'left':'50%',
				'top':'70px',
				'transform':'translateX(-50%)',
				'margin-top': '0px',
				'transition':'0.3s'
			});
		}
	},

	
	goTop : function(){
		
		$('.btn_top').off('click').on('click', function () {
			$('body,html').animate({scrollTop: 0}, 300);
			return false;
		});
	},


	// 퀵메뉴
	quickMenu : function(){
		$('#quickMenu .btn_quick').off('click').on('click', function(){
			$('#quickMenu .quick_list').slideToggle(200);
		});
		// $('#quickMenu .quick_list').addClass('quickOpen');
	},

	addQuick : function(){
		if($(window).width() > 1007) {
			$('#quickMenu .quick_list').css({'display': 'block'});
			$('#quickMenu .quick_list').removeClass('mo_quick');
		} 
		else{
			$('#quickMenu .quick_list').addClass('mo_quick');
		}
	},


	// 하단 플로팅 배너
	bottomBanner : function(){

		var pcBottomBnrLengh = $('.btm_float_banner .wrap_banner_pc .img').length;
		if ( pcBottomBnrLengh > 1 ) {
			$('.btm_float_banner .img').eq(0).css({'background-position' : 'right center'});
			$('.btm_float_banner .img').eq(1).css({'background-position' : 'left center'});
		}

		var moBottomBnrLengh = $('.btm_float_banner .wrap_banner_mo .swiper-slide').length;
		if ( moBottomBnrLengh > 1 ) {
			var bottomBnrSwiper = new Swiper('.btm_float_banner .swiper-container', {
				loop: true,
				autoplay: {
					delay: 5000,
					disableOnInteraction: false,
				},
				observer: true,
				observeParents: true,
				pagination: {
					el: '.btm_float_banner .swiper-pagination',
				},
			});
		}

	},


	// gnb 배너 2개일때
	hasTwoBanner : function(){
		var gnbBnrLength = $('.gnb_banner .img').length;
		if ( gnbBnrLength > 1 ) {
			$('.gnb_banner .img').eq(0).css({'background-position' : 'right center'});
			$('.gnb_banner .img').eq(1).css({'background-position' : 'left center'});
		}
	},

	moreview : function(_this){
		var moreCon = $(_this).data('view');
		$('.'+moreCon).slideToggle();
		if($(_this).text() == '더보기'){
			$(_this).text('닫기').addClass('on');
		}else{
			$(_this).text('더보기').removeClass('on');
		}
	},

	// 전체약관동의
	checkall : function(_this){
		var allcheckbox = $(_this).parents('.wrap_terms_agree').find('.agree_part input[type="checkbox"]');
		if($(_this).prev('input[type="checkbox"]').prop('checked') == true){
			allcheckbox.prop('checked',false);
		}else{
			allcheckbox.prop('checked',true);
		}
	},

	// 마케팅약관
	checkall2 : function(_this){
		var allcheckbox = $(_this).parent().siblings('.box_type2').find('input[type="checkbox"]');
		if($(_this).prev('input[type="checkbox"]').prop('checked') == true){
			allcheckbox.prop('checked',false);
		}else{
			allcheckbox.prop('checked',true);
		}
	},

	// pc,mo 다른링크
	openlink : function(_this){
		console.log('ddd');
		var pc_link = $(_this).data('pclink');
		var mo_link = $(_this).data('molink');
		if($(window).width()< 767){
			window.open(mo_link,'_blank');
		}else{
			window.open(pc_link,'_blank');
		}
		return false;
	}
}