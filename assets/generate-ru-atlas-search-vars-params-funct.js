

	var updateText = 'Загрузка ...';
	var resultBlock = 'appartment_box';
	var bg_img = '/themes/atlas/images/pages/opacity.png';

	var useGoogleMap = 0;
	var useYandexMap = 1;
	var useOSMap = 0;
		
	$(function () {
		$('div#appartment_box').on('mouseover mouseout', 'div.appartment_item', function(event){
			if (event.type == 'mouseover') {
			 $(this).find('div.apartment_item_edit').show();
			} else {
			 $(this).find('div.apartment_item_edit').hide();
			}
		});

		if(modeListShow == 'map'){
			list.apply();
		}
	});
	
    var urlsSwitching = {'block':'https\x3A\x2F\x2Fuyjoy.uz\x2F\x3Fcat\x3D7\x26ls\x3Dblock','table':'https\x3A\x2F\x2Fuyjoy.uz\x2F\x3Fcat\x3D7\x26ls\x3Dtable','map':'https\x3A\x2F\x2Fuyjoy.uz\x2F\x3Fcat\x3D7\x26ls\x3Dmap'};
	var modeListShow = 'map';
	
    function setListShow(mode){
        modeListShow = mode;
        reloadApartmentList(urlsSwitching[mode]);
    };
