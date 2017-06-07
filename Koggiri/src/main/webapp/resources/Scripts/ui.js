$(function() {
	$(window).load(function() {
		// GNB 蹂댁씠湲�/媛먯텛湲� : s
		var header_wrap = $('.header_wrap');
		var container_wrap = $('.container_wrap');
		var menu1depth = $('.gnb>ul>li');
		var menu2depth = $('.gnb>ul>li>ul>li');
		var menu3depth_wrap = $('.gnb>ul>li>ul>li>div');
		var menu3depth = $('.gnb>ul>li>ul>li>div>ul>li');
		
		// 1Depth �쒖꽦�� 諛� GNB蹂댁씠湲�
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

		// 2Depth �쒖꽦�� 諛� GNB蹂댁씠湲�
		menu2depth.on({
			mouseenter: function() {
				$(this).addClass('on').siblings('li').removeClass('on');
			},
			focusin: function() {
				$(this).addClass('on').siblings('li').removeClass('on');
			}
		});

		// 3Depth �쒖꽦�� 諛� GNB蹂댁씠湲�
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
		
		// GNB�닿린 Animation �⑥닔
		function gnb_open() {
			header_wrap.css({'position':'fixed', 'z-index':'100'}).stop().animate({'height':'345px'}, 300);
			container_wrap.css('padding-top', '144px');
			$('.input_area>input[type="text"], .input_area>input[type="password"]').blur(); // IE�먯꽌 濡쒓렇�� input諛뺤뒪�� �ъ빱�ㅺ� �ㅼ뼱媛� �덉쓣 �� GNB �꾨줈 而ㅼ꽌媛� 蹂댁씠�� 踰꾧렇 �닿껐
			
		}
		// GNB�リ린 Animation �⑥닔
		function gnb_close() {
			header_wrap.stop().animate({'height':'100px'}, 300, function() {
				$(this).css('position', 'relative');
				container_wrap.css('padding', '42px 0 40px 0');
			});
		}
		// GNB�ㅼ떆 �닿린 Animation �⑥닔 : ��궎 �대룞�� �덉쓣 寃쎌슦 �쒓컙 GNB媛� �대젮�� �섎�濡� �좊땲硫붿씠�섏쓣 遺��ы븯吏� �딆쓬.
		function gnb_reverse() {
			header_wrap.css({'position':'fixed', 'height':'345px', 'z-index':'100'});
			container_wrap.css('padding-top', '144px');
			$('.input_area>input[type="text"], .input_area>input[type="password"]').blur(); // IE�먯꽌 濡쒓렇�� input諛뺤뒪�� �ъ빱�ㅺ� �ㅼ뼱媛� �덉쓣 �� GNB �꾨줈 而ㅼ꽌媛� 蹂댁씠�� 踰꾧렇 �닿껐
		}

		// 蹂몃Ц�곸뿭�� 留덉슦�� 而ㅼ꽌媛� �ㅼ뼱媛�嫄곕굹 �ъ빱�ㅺ� �대룞�섎㈃ GNB瑜� �ル뒗��.
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

		// GNB�곸뿭 �쇱そ�� �덈뒗 諛곕꼫�� �ъ빱�ㅺ� �대룞�섎㈃ GNB瑜� 蹂댁씤��.
		$('.gnb_banner').on({
			mouseenter: function() {
				gnb_reverse();
			},
			focusin: function() {
				gnb_reverse();
			}
		});
		// GNB 3Depth 硫붾돱�� 以� 留덉�留� ��ぉ�� border-bottom�� �놁븻��. (�붿옄�� �쒖븞 李멸퀬)
		$('.gnb>ul>li>ul>li>div>ul>li:last-child').css('border-bottom', 'none');

		// GNB 蹂댁씠湲�/媛먯텛湲� : e

		// 愿��⑥궗�댄듃 紐⑸줉 蹂댁씠湲�/媛먯텛湲� : s
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
		// 愿��⑥궗�댄듃 紐⑸줉 蹂댁씠湲�/媛먯텛湲� : e


		// 愿��⑥궗�댄듃 �대룞 援ы쁽 : s
		$('.relation_site>ul>li').find('a').bind('click', function(e) {
			var site_url = $(this).attr('href');
			var site_name = $(this).text();
			$(this).closest('ul').hide();
			$('.relation_site_wrap>a').attr('href', site_url);
			$('.relation_site>a').text(site_name);
			e.preventDefault();
			console.log(site_url, site_name);
		});
		// 愿��⑥궗�댄듃 �대룞 援ы쁽 : e


		// 濡쒓렇�� �꾩씠��, �⑥뒪�뚮뱶 input諛뺤뒪 媛� 泥댄겕 : s
		$('.login_ip input').each(function() {
			$(this).on({
				focusin:function() {
					$(this).css('background', '#fff'); // input 諛뺤뒪�� focus�� 諛곌꼍 �곗깋 泥섎━
				},
				focusout:function() {
					var val = $(this).val(); // input 諛뺤뒪�� 媛믪쓣 泥댄겕�섏뿬 媛믪씠 �덉쑝硫� 媛믪쓣 �섑��닿퀬 �놁쑝硫� �꾨옒�� 議곌굔臾몄쓣 �섑��몃떎.
					if(!val) {
						if($(this).attr('id') == 'txtID') { // �대떦 input 諛뺤뒪�� id媛� 'id'�� 寃쎌슦,
							$(this).css('background', '#fff url(http://s.nx.com/S2/billing/pcbang/stage/homepage/common/bg_txt_id.png) no-repeat 25px center');
						} else { // �대떦 input 諛뺤뒪�� id媛� 'id'媛� �꾨땶 �ㅻⅨ 媛믪씪 寃쎌슦(利�, password �� 寃쎌슦)
							$(this).css('background', '#fff url(http://s.nx.com/S2/billing/pcbang/stage/homepage/common/bg_txt_pw.png) no-repeat 25px center');
						}
					}
				}
			});
		});
		// 濡쒓렇�� �꾩씠��, �⑥뒪�뚮뱶 input諛뺤뒪 媛� 泥댄겕 : e


		// 硫붿씤 �쒕퉬�� �좏깮 �� 諛곌꼍 蹂댁씠湲�/媛먯텛湲�
		$('.main #content div>a').on({
			mouseenter:function() {
				$(this).parent('div').stop().animate({'background-position-y':'-206px'}, 500, "easeInOutCubic");
			},
			mouseleave:function() {
				$(this).parent('div').stop().animate({'background-position-y':'0px'}, 500, "easeInOutCubic");
			},
		});

		// 濡ㅻ쭅諛곕꼫 : s //
		var slider;
		var startNum = 1;  // ��긽 �쒖옉�섎뒗 �レ옄�� 怨좎젙媛�
		var TotalNum = $('.slider').find('li').size();
		
		// 濡ㅻ쭅諛곕꼫 �쒖옉 �꾩뿉 湲곕낯 �レ옄瑜� 遺��ы븳��.
		$('.current_page').html(startNum);
		$('.total_page').html(TotalNum);


		/*slider = $('.slider').bxSlider({
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

		// 濡ㅻ쭅諛곕꼫 prev, next踰꾪듉 �곸뿭�� 留덉슦�� 而ㅼ꽌瑜� �щ졇�� 寃쎌슦 �좊땲硫붿씠�섏씠 硫덉땄
		$('.bx-controls-direction').on({
			mouseenter:function() {
				slider.stopAuto();
			},
			//�곸뿭�먯꽌 踰쀬뼱�섎㈃ �좊땲硫붿씠�� �ъ깮
			mouseleave:function() { 
				slider.startAuto();
			}
		});*/
		// 濡ㅻ쭅諛곕꼫 : e //

		// LNB�곸뿭
		$('.lnb01 ul>li:last-child>ul').css({'border-bottom':'none', 'margin':'0px', 'padding':'0px'});  // lnb 2depth�� 留덉�留� ul
		$('.lnb01 ul>li>ul>li:last-child>a').css('margin-bottom', '0px');


		// Tab �좏깮 �쒖꽦�� or 鍮꾪솢�깊솕
		$('.tab>ul>li').find('a').bind('click', function() {
			$(this).parent('li').addClass('on').siblings('li').removeClass('on');
		});


		// info_box(�쒕퉬�� �ㅻ챸) �④린湲�/蹂댁씠湲�

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

		//���쒕낫�� �� PC諛� �곹뭹 濡ㅻ쭅
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


		// ���쒕낫�� div 3n踰덉㎏ �ㅻⅨ履� 留덉쭊�� 0px濡� 留뚮뱺��.
		$('.contents_wrap>div:nth-child(3n)').css('margin-right', '0px');
		
		// ���쒕낫�� div 7, 8, 9踰덉㎏ �꾨옒履� 留덉쭊�� 0px濡� 留뚮뱺��.
		$('.contents_wrap>div:nth-child(6)').css('margin-bottom', '0px');
		$('.contents_wrap>div:nth-child(7)').css('margin-bottom', '0px');
		$('.contents_wrap>div:nth-child(8)').css('margin-bottom', '0px');


		// FAQ �④�/�쇱튂湲�
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



		// �앹뾽 �꾩슦湲� : popup�대옒�ㅻ� �좎뼵�� a�쒓렇�� href �띿꽦媛믪쓣 url蹂��섏뿉 �닿퀬 window.open�쇰줈 �덉갹�� �꾩슫��.
		//             �ㅼ젣濡� �대떦 �앹뾽 �섏씠吏� �섎떒�� �ㅽ겕由쏀듃瑜� �듯빐 �앹뾽�� �꾩튂媛믪씠 �뺥빐吏꾨떎.$('.popup').bind('click', function(e) {
//			e.preventDefault();
//			var url = $(this).attr('href');
//			window.open(url, 'popup', 'width=1, height=1, scrollbars=0');
//		});


//		// 泥ル쾲吏� �덉씠�� �앹뾽
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

//		// �먮쾲吏� �덉씠�� �앹뾽
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



//		//�쒕퉬�� �댁슜�쎄� �앹뾽 
//		$('.service_agreement').bind('click', function(){
//			var url = $(this).attr('href');
//			openPopup(url, 'popup1', '500', '430');
//			return false;
//		});

		//媛쒖씤�뺣낫痍④툒諛⑹묠 �앹뾽 
		$('.service_agreement1').bind('click', function(){
			var url = $(this).attr('href');
			openPopup(url, 'popup1', '500', '470');
			return false;
		});

		//�꾩옄荑좏룿 �댁슜 媛��대뱶
		$('.coupon_guide').bind('click', function(){
			var url = $(this).attr('href');
			openPopup(url, 'popup1', '900', '700');
			return false;
		});


		// 湲곗〈 PC諛� �앹뾽�섏씠吏� �꾩슦湲�
		function openPopup(popup_url, name, width, height) {
		    var left = (screen.width - Number(width)) / 2;
		    var top = (screen.height - Number(height)) / 2;

		    window.open(popup_url, name, "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top + ", scrollbars=yes, menubar=no, resizable=no, titlebar=no, toolbar=no").focus();
		    return false;
		}
	});
});