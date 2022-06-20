var hdgm = (function() {
	var certPopupOpenYn;
	
	var openCertPopup = function(certType) {
		var width = 420;
		var height = 600;
		var isIOS = $("input[name=isIOS]").val();
		var actionUrl = "/cu/cert/requestTelecomCert.nhd?isPopup=Y&isIOS=" + isIOS;
		
		if(certType == "ipin") {
			width = 445;
			height = 550;
			var certPurpose = $("input[name=certPurpose]").val();
			actionUrl = "/cu/cert/requestIpinCert.nhd?certPurpose="+certPurpose + "&isPopup=Y&isIOS=" + isIOS;
		}
		
		certPopupOpenYn = window.open(actionUrl, "certPopup", "width="+width+",height="+height+",scrollbars=no,toolbar=no,location=no,directories=no,status=no");
	};
	
	var moveCert= function(certType) {
		var isIOS = $("input[name=isIOS]").val();
		var actionUrl = "/cu/cert/requestTelecomCert.nhd?isPopup=N&isIOS=" + isIOS;
		
		if(certType == "ipin") {
			var certPurpose = $("input[name=certPurpose]").val();
			actionUrl = "/cu/cert/requestIpinCert.nhd?certPurpose="+certPurpose + "&isPopup=N&isIOS=" + isIOS;
		}
		$("#hiddenForm").attr("action", actionUrl);
		$("#hiddenForm").submit();
	};

	var openCertLek = function(certType) {  // 2019.01 허현철 고객정보 휴출내역 조회용 추가
		var width = 420;
		var height = 600;
		//var isIOS = $("input[name=isIOS]").val();
		var actionUrl = "/cu/cert/requestLekCustCert.nhd";
		
		certPopupOpenYn = window.open(actionUrl, "certPopup", "width="+width+",height="+height+",scrollbars=no,toolbar=no,location=no,directories=no,status=no");
	};
	
	
	//테스트1234
	var openCertLek2 = function(certType) {
		var width = 420;
		var height = 600;
		var isIOS = $("input[name=isIOS]").val();
		var actionUrl = "/cu/cert/requestTelecomCert.nhd?isPopup=Y&isIOS=" + isIOS;
		
		if(certType == "ipin") {
			width = 445;
			height = 550;
			var certPurpose = $("input[name=certPurpose]").val();
			actionUrl = "/cu/cert/requestIpinCert.nhd?certPurpose="+certPurpose + "&isPopup=Y&isIOS=" + isIOS;
		}
		
		certPopupOpenYn = window.open(actionUrl, "certPopup", "width="+width+",height="+height+",scrollbars=no,toolbar=no,location=no,directories=no,status=no");
	};
	
	var openOutltCertPopup = function(certType) {
		var width = 420;
		var height = 600;
		var isIOS = $("input[name=isIOS]").val();
		var actionUrl = "/cu/outlt/cert/requestTelecomCert.nhd?isPopup=Y&isIOS=" + isIOS;
		
		if(certType == "ipin") {
			width = 445;
			height = 550;
			var certPurpose = $("input[name=certPurpose]").val();
			actionUrl = "/cu/outlt/cert/requestIpinCert.nhd?certPurpose="+certPurpose + "&isPopup=Y&isIOS=" + isIOS;
		}
		
		certPopupOpenYn = window.open(actionUrl, "certPopup", "width="+width+",height="+height+",scrollbars=no,toolbar=no,location=no,directories=no,status=no");
	};  
	
	var moveOutltCert= function(certType) {
		var isIOS = $("input[name=isIOS]").val();
		var actionUrl = "/cu/outlt/cert/requestTelecomCert.nhd?isPopup=N&isIOS=" + isIOS;
		
		if(certType == "ipin") {
			var certPurpose = $("input[name=certPurpose]").val();
			actionUrl = "/cu/outlt/cert/requestIpinCert.nhd?certPurpose="+certPurpose + "&isPopup=N&isIOS=" + isIOS;
		}
		$("#hiddenForm").attr("action", actionUrl);
		$("#hiddenForm").submit();
	};
	
	var getCertPopupOpenYn = function () {
		return certPopupOpenYn;
	};
	
	
	return {
		openCertPopup : openCertPopup,
		getCertPopupOpenYn : getCertPopupOpenYn,
		moveCert : moveCert,
		openCertLek : openCertLek,   // 2019.01 허현철 고객정보 휴출내역 조회용 추가
		openOutltCertPopup : openOutltCertPopup, // 2019.06 KYS 아울렛 용 인증 추가
		moveOutltCert : moveOutltCert // 2019.06 KYS 아울렛 용 인증 추가
	};
	
}());