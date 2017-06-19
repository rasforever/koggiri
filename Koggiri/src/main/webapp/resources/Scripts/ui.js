$(function() {
	$(window).load(function() {
		// GNB 보이기/감추기 : s
		var header_wrap = $('.header_wrap');
		var container_wrap = $('.container_wrap');
		var menu1depth = $('.gnb>ul>li');
		var menu2depth = $('.gnb>ul>li>ul>li');
		var menu3depth_wrap = $('.gnb>ul>li>ul>li>div');
		var menu3depth = $('.gnb>ul>li>ul>li>div>ul>li');
		
		// 1Depth 활성화 및 GNB보이기
		menu1depth.on({
			mouseenter: function() {
				$(this).addClass('on').siblings('li').removeClass('on');
				$(this).siblings('li').find('li').removeClass('on');
				gnb_open();
			},
			focusin: function() {
				$(this).addClass('on').siblings('li').removeClass('on');
				$(this).siblings('li').find('li').removeClass('on');
				gnb_open();
			}
		});

		// 2Depth 활성화 및 GNB보이기
		menu2depth.on({
			mouseenter: function() {
				$(this).addClass('on').siblings('li').removeClass('on');
			},
			focusin: function() {
				$(this).addClass('on').siblings('li').removeClass('on');
			}
		});

		// 3Depth 활성화 및 GNB보이기
		menu3depth.on({
			mouseenter: function() {
				$(this).children('div').show();
				$(this).addClass('on').siblings('li').removeClass('on');
			},
			focusin: function() {
				$(this).children('div').show();
				$(this).addClass('on').siblings('li').removeClass('on');
			}
		});
		
		// GNB열기 Animation 함수
		function gnb_open() {
			header_wrap.css({'position':'fixed', 'z-index':'100'}).stop().animate({'height':'345px'}, 300);
			container_wrap.css('padding-top', '144px');
			$('.input_area>input[type="text"], .input_area>input[type="password"]').blur(); // IE에서 로그인 input박스에 포커스가 들어가 있을 때 GNB 위로 커서가 보이는 버그 해결
			
		}
		// GNB닫기 Animation 함수
		function gnb_close() {
			header_wrap.stop().animate({'height':'100px'}, 300, function() {
				$(this).css('position', 'relative');
				container_wrap.css('padding', '42px 0 40px 0');
			});
		}
		// GNB다시 열기 Animation 함수 : 탭키 이동을 했을 경우 순간 GNB가 열려야 하므로 애니메이션을 부여하지 않음.
		function gnb_reverse() {
			header_wrap.css({'position':'fixed', 'height':'345px', 'z-index':'100'});
			container_wrap.css('padding-top', '144px');
			$('.input_area>input[type="text"], .input_area>input[type="password"]').blur(); // IE에서 로그인 input박스에 포커스가 들어가 있을 때 GNB 위로 커서가 보이는 버그 해결
		}

		// 본문영역에 마우스 커서가 들어가거나 포커스가 이동하면 GNB를 닫는다.
		container_wrap.on({
			mouseenter: function() {
				gnb_close();
				menu1depth.removeClass('on');
				menu2depth.removeClass('on');
			},
			focusin: function() {
				gnb_close();
				menu1depth.removeClass('on');
				menu2depth.removeClass('on');
			}
		});

		// GNB영역 왼쪽에 있는 배너에 포커스가 이동하면 GNB를 보인다.
		$('.gnb_banner').on({
			mouseenter: function() {
				gnb_reverse();
			},
			focusin: function() {
				gnb_reverse();
			}
		});
		// GNB 3Depth 메뉴들 중 마지막 항목의 border-bottom을 없앤다. (디자인 시안 참고)
		$('.gnb>ul>li>ul>li>div>ul>li:last-child').css('border-bottom', 'none');

		// GNB 보이기/감추기 : e

		// 관련사이트 목록 보이기/감추기 : s
		$('.relation_site>a').bind('click', function() {
			if(!$(this).hasClass('on')) {
				$(this).addClass('on');
				$(this).siblings('ul').show();
			} else {
				$(this).removeClass('on');
				$(this).siblings('ul').hide();
			}
		});
		$('.relation_site>ul').bind('mouseleave', function() {
			$(this).hide();
			$(this).siblings('a').removeClass('on')
		});
		// 관련사이트 목록 보이기/감추기 : e


		// 관련사이트 이동 구현 : s
		$('.relation_site>ul>li').find('a').bind('click', function(e) {
			var site_url = $(this).attr('href');
			var site_name = $(this).text();
			$(this).closest('ul').hide();
			$('.relation_site_wrap>a').attr('href', site_url);
			$('.relation_site>a').text(site_name);
			e.preventDefault();
			console.log(site_url, site_name);
		});
		// 관련사이트 이동 구현 : e


		// 로그인 아이디, 패스워드 input박스 값 체크 : s
		$('.login_ip input').each(function() {
			$(this).on({
				focusin:function() {
					$(this).css('background', '#fff'); // input 박스에 focus시 배경 흰색 처리
				},
				focusout:function() {
					var val = $(this).val(); // input 박스의 값을 체크하여 값이 있으면 값을 나타내고 없으면 아래의 조건문을 나타낸다.
					if(!val) {
						if($(this).attr('id') == 'txtID') { // 해당 input 박스의 id가 'id'일 경우,
							$(this).css('background', '#fff url(http://s.nx.com/S2/billing/pcbang/stage/homepage/common/bg_txt_id.png) no-repeat 25px center');
						} else { // 해당 input 박스의 id가 'id'가 아닌 다른 값일 경우(즉, password 일 경우)
							$(this).css('background', '#fff url(http://s.nx.com/S2/billing/pcbang/stage/homepage/common/bg_txt_pw.png) no-repeat 25px center');
						}
					}
				}
			});
		});
		// 로그인 아이디, 패스워드 input박스 값 체크 : e


		// 메인 서비스 선택 시 배경 보이기/감추기
		$('.main #content div>a').on({
			mouseenter:function() {
				$(this).parent('div').stop().animate({'background-position-y':'-206px'}, 500, "easeInOutCubic");
			},
			mouseleave:function() {
				$(this).parent('div').stop().animate({'background-position-y':'0px'}, 500, "easeInOutCubic");
			},
		});

		// 롤링배너 : s //
		var slider;
		var startNum = 1;  // 항상 시작하는 숫자는 고정값
		var TotalNum = $('.slider').find('li').size();
		
		// 롤링배너 시작 전에 기본 숫자를 부여한다.
		$('.current_page').html(startNum);
		$('.total_page').html(TotalNum);


		slider = $('.slider').bxSlider({
			auto: true,
			control:false,
			pager:false,
			easing: 'easeInOutQuad',
				speed: 500,
				onSlidePrev: function (){
		        var slide_count = slider.getSlideCount();
	    		var slide_curr = slider.getCurrentSlide();
				$('.total_page').html(slide_count);
	    		$('.current_page').html(slide_curr+1);
	    	},
	    	onSlideAfter: function(){
	    		var slide_count = slider.getSlideCount();
	    		var slide_curr = slider.getCurrentSlide();
	    		// console.log(slide_count, slide_curr);

	    		$('.bx-viewport>ul>li>a').on({
	    			focusin:function() {
	    				if(slide_curr==0) {
	    					slider.goToSlide(slide_curr);
	    					$('.current_page').html(slide_curr+1);
	        				slider.stopAuto();
	    				} else {
		       				slider.goToSlide(slide_curr);
		       				$('.current_page').html(slide_curr);
	        				slider.stopAuto();
	    				}
	    			},
	    			focusout:function() {
						slider.reloadSlider();
	    			},
	    			mouseenter:function() {
	    				slider.stopAuto();
	    			},
	    			mouseleave:function() {
	    				slider.startAuto();
	    			}
	    		});
		    },
		    onSlideNext: function (){
		        var slide_count = slider.getSlideCount();
	    		var slide_curr = slider.getCurrentSlide();
				$('.total_page').html(slide_count);
	    		$('.current_page').html(slide_curr+1);
		    }
		});

		// 롤링배너 prev, next버튼 영역에 마우스 커서를 올렸을 경우 애니메이션이 멈춤
		$('.bx-controls-direction').on({
			mouseenter:function() {
				slider.stopAuto();
			},
			//영역에서 벗어나면 애니메이션 재생
			mouseleave:function() { 
				slider.startAuto();
			}
		});
		// 롤링배너 : e //

		// LNB영역
		$('.lnb01 ul>li:last-child>ul').css({'border-bottom':'none', 'margin':'0px', 'padding':'0px'});  // lnb 2depth의 마지막 ul
		$('.lnb01 ul>li>ul>li:last-child>a').css('margin-bottom', '0px');


		// Tab 선택 활성화 or 비활성화
		$('.tab>ul>li').find('a').bind('click', function() {
			$(this).parent('li').addClass('on').siblings('li').removeClass('on');
		});


		// info_box(서비스 설명) 숨기기/보이기

		$('.btn_info').each(function(){
			$(this).bind('click',function(){
				var posX = $(this).offset().left-10;
				var posY = $(this).offset().top+23;
				var title = $(this).find('img').attr('title');
				if(!$(this).hasClass('on')) {
					$('.btn_info').removeClass('on')
					$(this).addClass('on');
					$('.info_box').show().css({'left':posX+'px','top':posY+'px'}).find('p').text(title);
				} else {
					$(this).removeClass('on');
					$(this).siblings('div').hide();
					$('.info_box').hide();
				}

                return false;
			});

		})

		//대시보드 내 PC방 상품 롤링
//		var n = 0;
//		var prdtName = $('.prdt_name').children('ul');
//		var prdtList = prdtName.children('li').size();
//		$('.prdt_btn').find('a').bind('click',function(){
//			if($(this).hasClass('prev')){
//				if(n>0){
//					n--;
//				}else{
//					return false;
//				}
//			}else if($(this).hasClass('next')){
//				if(n<prdtList-1){
//					n++;
//				}else{
//					return false;
//				}
//			}
//			prdtName.stop().animate({'top':-57*n+'px'},400);
//		});


		// 대시보드 div 3n번째 오른쪽 마진을 0px로 만든다.
		$('.contents_wrap>div:nth-child(3n)').css('margin-right', '0px');
		
		// 대시보드 div 7, 8, 9번째 아래쪽 마진을 0px로 만든다.
		$('.contents_wrap>div:nth-child(6)').css('margin-bottom', '0px');
		$('.contents_wrap>div:nth-child(7)').css('margin-bottom', '0px');
		$('.contents_wrap>div:nth-child(8)').css('margin-bottom', '0px');


		// FAQ 숨김/펼치기
//		var docH = $(document).height();
//		$('.faq_wrap').css('height', docH-100);
//		$('.search_result_wrap').css('height', docH-284);
//		$('.btn_faq').bind('click', function() {
//			if(!$(this).hasClass('on')) {
//				$(this).addClass('on');
//				$('.search_header>div').hide();
//				$('.faq_wrap').stop().animate({'left':'0px'}, 500, 'easeInOutQuad');
//				$('#wrap').stop().animate({'padding-left':'350px'}, 500, 'easeInOutQuad');
//			} else {
//				$(this).removeClass('on');
//				$('.search_header>div').show();
//				$('.faq_wrap').stop().animate({'left':'-340px'}, 500, 'easeInOutQuad');
//				$('#wrap').stop().animate({'padding-left':'0px'}, 500, 'easeInOutQuad');
//			}
//		});



		// 팝업 띄우기 : popup클래스를 선언한 a태그의 href 속성값을 url변수에 담고 window.open으로 새창을 띄운다.
		//             실제로 해당 팝업 페이지 하단의 스크립트를 통해 팝업의 위치값이 정해진다.$('.popup').bind('click', function(e) {
//			e.preventDefault();
//			var url = $(this).attr('href');
//			window.open(url, 'popup', 'width=1, height=1, scrollbars=0');
//		});


//		// 첫번째 레이어 팝업
//		var tg = $('.layer_popup');
//		var layerW = tg.outerWidth();
//		var layerH = tg.outerHeight();
//		var popupPosX = layerW/2;
//		var popupPosY = layerH/2;
//		tg.css({'margin-left':-popupPosX+'px', 'margin-top':-popupPosY+'px'});
//		$('.open_layer').bind('click', function() {
//			$('.layer_popup').show();
//		});
//		$('.btn_layer_close').bind('click', function() {
//			$(this).parent('div').parent('div').hide();
//		});

//		// 두번째 레이어 팝업
//		var tg2 = $('.layer_popup2');
//		var layerW2 = tg2.outerWidth();
//		var layerH2 = tg2.outerHeight();
//		var popupPosX2 = layerW2/2;
//		var popupPosY2 = layerH2/2;
//		tg2.css({'margin-left':-popupPosX2+'px', 'margin-top':-popupPosY2+'px'});
//		$('.open_layer2').bind('click', function() {
//			$('.layer_popup2').show();
//		});
//		$('.btn_layer_close').bind('click', function() {
//			$(this).parent('div').parent('div').hide();
//		});
//		



//		//서비스 이용약관 팝업 
//		$('.service_agreement').bind('click', function(){
//			var url = $(this).attr('href');
//			openPopup(url, 'popup1', '500', '430');
//			return false;
//		});

		//개인정보취급방침 팝업 
		$('.service_agreement1').bind('click', function(){
			var url = $(this).attr('href');
			openPopup(url, 'popup1', '500', '470');
			return false;
		});

		//전자쿠폰 이용 가이드
		$('.coupon_guide').bind('click', function(){
			var url = $(this).attr('href');
			openPopup(url, 'popup1', '900', '700');
			return false;
		});


		// 기존 PC방 팝업페이지 띄우기
		function openPopup(popup_url, name, width, height) {
		    var left = (screen.width - Number(width)) / 2;
		    var top = (screen.height - Number(height)) / 2;

		    window.open(popup_url, name, "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top + ", scrollbars=yes, menubar=no, resizable=no, titlebar=no, toolbar=no").focus();
		    return false;
		}
	});
});