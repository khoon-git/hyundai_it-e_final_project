hdgm.validation = (function() {
    //	var emailRegExp          = /^[A-Za-z0-9\_.-]{1}[A-Za-z0-9\_.-]*([A-Za-z0-9\_.-]{1})@[a-z\d-]+(\.[a-z]{2,6}){1,2}$/;
        var emailRegExp          = /^[A-Za-z0-9]{1}[A-Za-z0-9\_.-]*([A-Za-z0-9\_.-]{1})@[a-z\d-]+(\.[a-z]{2,6}){1,2}$/;
        var userIdRegExp         = /^[a-zA-Z]+[0-9]+[a-zA-Z]*$/;
        var textRegExp           = /[a-zA-Z]+/;
        var numberRegExp         = /[0-9]+/;
		var cellNoRegExp         = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}/;
        var specialCharRegExp    = /[!"#\$%&\'\(\)\*\+,\-\.\/:;<=>?@\[\]\^\_\`\{\|\}~\\]+/;
        
        var message = "", 
            validFlag    = true;
    
        
        var custId, confirmPassword, newPassword;
        //var iPassport, custNm, birthDt;
        
        var isEmailFormat = function (value) {
            return emailRegExp.test( value);
        };
        
        
        var isNotEmailFormat = function (value) {
            return !isEmailFormat(value);
        };
        
        var getMessage = function () {
            return message;
        };
    
        var setMessage = function (errorMessage) {
            message = errorMessage;
            setValidFlag(false);
        };
        
        var getValidFlag = function() {
            return validFlag;
        };
        
        var setValidFlag = function(aValidFlag) {
            validFlag = aValidFlag;
        };
        
        var initValidState = function() {
            setMessage("");
            setValidFlag(true);
        };
        
        var preparePasswordValidation = function (iCustId, iNewPassword, iConfirmPassword){
            custId 			= iCustId;
            newPassword 	= iNewPassword;
            confirmPassword = iConfirmPassword;
            
            initValidState();
        };
        
        var getNewPassword = function() {
            return newPassword;
        };
        
        var getConfirmPassword = function() {
            return confirmPassword;
        };
        
        var getCustId = function() {
            return custId;
        };
        
        var isValidCustId = function(iCustId) {
            
            initValidState();
            
            // 아이디에서 숫자를 삭제한 변수
            var tempId1 = iCustId.replace(/[0-9]/g, "");
            // 아이디에서 문자와 숫자를 삭제한 변수
            var tempId2 = iCustId.replace(/[a-zA-Z]/g, "").replace(/[0-9]/g, "");
            
            //1.영문자,숫자로 시작해서 특수문자가 포함됐는지
            if( !$.trim(iCustId) ) {
                setMessage("아이디를 입력해주세요.");
                return false;
            } else if( iCustId.length < 4 || iCustId.length > 20 ) {
                setMessage("아이디는 4자리 ~ 20자리로 입력해주세요.");
                return false;
            // @가 들어가면 이메일형식의 아이디로 판단한다.
            } else if( iCustId.indexOf( "@") >= 0 ) {
                setMessage("이메일 형식의 아이디는 만들 수 없습니다.");
                return false;
            // 숫자를 삭제했는데 빈값이면 숫자로만 된 아이디, 둘다 삭제했는데 빈값이 아니면 특수문자가 있는 아이디
            } else if( tempId1 == '' || tempId2 != '') {
                setMessage("사용할 수 없는 아이디 입니다.");
                return false;
            } else {
                $.ajax({
                    type : 'POST',
                    url : 'checkIdDupJSON',
                    data : iCustId,
                    dataType: 'text',
                    contentType:'application/json; charset=utf-8',
                    async : false,
                    success : function(data) {
                    	console.log("아이디 중복 여부 : ", data)
                        if( data === "Y" ) {
                            setMessage("사용 불가능한 아이디 입니다.");
                            setValidFlag(false);
                        } else {
                            setValidFlag(true);
                        }
                        
    
                    }
                });
                
    
                return getValidFlag();
            }
            
        };
    
    
        
        var isValidPassport = function(iPassport, custNm, birthDt) { //iPassport, custNm, birthDt
    
            initValidState();
            
            var regType1 =  /^[A-Z0-9]+$/;
        
            if(!regType1.test(iPassport) ){
                setMessage("영문 대문자, 숫자만 입력 가능합니다.");
                setValidFlag(false);
                
                return getValidFlag();
            }
            
    
            
            $.ajax({
                type : 'POST',
                url : '/cu/join/checkPassportDup.nhd',
                data : 'registerPassport=' + iPassport + '&custNm=' + custNm + '&birthDt=' + birthDt,
                async : false,
                success : function(data) {				
                    
                    if( data > 0 ) {
                        setMessage("사용 불가능한 여권번호 입니다.");
                        setValidFlag(false);
                    } else {
                        setMessage("사용 가능한 여권번호 입니다.");
                        setValidFlag(true);
                    }
                    
    
                }
            });
            
            return getValidFlag();
    
        };
        
        //참여사 아이디 중복 체크 : 별도 입력을 받는 경우 체크한다.
        var isValidChNewId = function(chNewId) { //chNewId
    
            initValidState();
            
            $.ajax({
                type : 'POST',
                url : '/cu/join/checkPtcoIdDup.nhd',
                data : 'chNewId=' + chNewId,
                async : false,
                success : function(data) {				
                    
                    if( data > 0 ) {
                        setMessage("사용 불가능한 ID 입니다.");
                        setValidFlag(false);
                    } else {
                        setMessage("사용 가능한 ID 입니다.");
                        setValidFlag(true);
                    }
    
                }
            });
            
            return getValidFlag();
    
        };
        
        
        var isValidPassword = function () {
            initValidState();
            
            //1.패스워드 길이가 8 ~ 30자리 사이인지.
            if(getNewPassword().length < 8 || getNewPassword().length > 30) {
                setMessage("패스워드는 8자리 ~ 30자리로 입력해주세요.");
                return false;
            }
            
            //2.영문자,숫자로 시작해서 특수문자가 포함됐는지
            if( !(textRegExp.test(getNewPassword())) ||
                    !(numberRegExp.test(getNewPassword())) ||
                        !(specialCharRegExp.test(getNewPassword())) ) {
                setMessage("영문,숫자,특수문자를 포함하여 8~30자리로 입력해주세요.");
                return false;
            }
            
            //동일하거나 연속된 글자가 존재하는지. 
            var pwdLength = getNewPassword().length;
            for(var i=0; i< pwdLength; i++){
                
                //현재 인덱스의 asc 코드
                var currentCharCode = getNewPassword().charCodeAt(i);
                
                //3.동일한 글자 체크
                if( currentCharCode == getNewPassword().charCodeAt(i+1) && currentCharCode == getNewPassword().charCodeAt(i+2) ) {
                    setMessage("동일한 3자리 이상의 숫자, 문자는 사용할 수 없습니다.");
                    break;
                }
                
                /*4.연속된 글자체크 2015.05.15 제외
                if( (getNewPassword().charCodeAt(i+2) - getNewPassword().charCodeAt(i+1) == 1) &&
                        (getNewPassword().charCodeAt(i+1) - currentCharCode == 1)  ) {
                    setMessage("연속된 3자리 이상의 숫자, 문자는 사용할 수 없습니다.");
                    break;
                }
                */
            }
            
            //5.패스워드에 아이디가 포함되 있는 경우
            if($.trim(getCustId()) && getNewPassword().indexOf(getCustId()) > -1) {
                setMessage("패스워드에 아이디를 포함할 수 없습니다.");
                return false;
            }
    
            //6.비밀번호와 비밀번호 확인이 동일하지 않을 때
            if(getNewPassword() != getConfirmPassword()) {
                setMessage("동일한 값을 입력해주시기 바랍니다.");
                return false;
            }
            
            return getValidFlag();
        };
        
        var isValidPasswordJustOnefield = function () {
            initValidState();
            
            //1.패스워드 길이가 8 ~ 30자리 사이인지.
            if(getNewPassword().length < 8 || getNewPassword().length > 30) {
                setMessage("패스워드는 8자리 ~ 30자리로 입력해주세요.");
                return false;
            }
            
            //2.영문자,숫자로 시작해서 특수문자가 포함됐는지
            if( !(textRegExp.test(getNewPassword())) ||
                    !(numberRegExp.test(getNewPassword())) ||
                        !(specialCharRegExp.test(getNewPassword())) ) {
                setMessage("영문,숫자,특수문자를 포함하여 8~30자리로 입력해주세요.");
                return false;
            }
            
            //동일하거나 연속된 글자가 존재하는지. 
            var pwdLength = getNewPassword().length;
            for(var i=0; i< pwdLength; i++){
                
                //현재 인덱스의 asc 코드
                var currentCharCode = getNewPassword().charCodeAt(i);
                
                //3.동일한 글자 체크
                if( currentCharCode == getNewPassword().charCodeAt(i+1) && currentCharCode == getNewPassword().charCodeAt(i+2) ) {
                    setMessage("동일한 3자리 이상의 숫자, 문자는 사용할 수 없습니다.");
                    break;
                }
                
                /*4.연속된 글자체크
                if( (getNewPassword().charCodeAt(i+2) - getNewPassword().charCodeAt(i+1) == 1) &&
                        (getNewPassword().charCodeAt(i+1) - currentCharCode == 1)  ) {
                    setMessage("연속된 3자리 이상의 숫자, 문자는 사용할 수 없습니다.");
                    break;
                }
                */
            }
            
            //5.패스워드에 아이디가 포함되 있는 경우
            if($.trim(getCustId()) && getNewPassword().indexOf(getCustId()) > -1) {
                setMessage("패스워드에 아이디를 포함할 수 없습니다.");
                return false;
            }
    
            return getValidFlag();
        };
        
        var isValidEmail = function(value) {
            initValidState();
            
            if(!emailRegExp.test(value) ) {
                setMessage("이메일 주소를 정확히 입력해주세요.");
                setValidFlag(false);
            } 
            
            return getValidFlag();
        };
        
        var isValidRecommender = function(recommenderNo) {
            
            initValidState();
            
            //입력을 한 경우는 유효성 체크함.
            if($.trim(recommenderNo) )  {
                $.ajax({
                    type : 'POST',
                    url : '/cu/join/recommendedUserList.nhd',
                    data : { rempNo: recommenderNo },
                    async : false,
                    success : function(data) {
                        if( data.code == "0000" ) {
                            setValidFlag(true);
                        }
                        else if( data.code == "0025" ) {
                            setMessage(data.message);
                            setValidFlag(false);
                        }
                    }
                });
                return getValidFlag();
            //입력을 안한 경우 유효성 체크 통과.
            } else {
                return getValidFlag();
            }
        };
        
        var isRequired = function(value) {
            initValidState();
            
            if(!$.trim(value) ) {
                setMessage("필수 입력항목입니다. 값을 입력해주세요.");
                setValidFlag(false);
            } 
            
            return getValidFlag();
        };
        
        var isAllCheckedRequired = function(jqClass) {
            initValidState();
            
            if($(jqClass+":checked").length == 0 || $(jqClass).length != $(jqClass+":checked").length) {
                setMessage("필수약관을 모두 선택해주세요.");
                setValidFlag(false);
            } 
            
            return getValidFlag();
        };
    
        var isValidCellNo = function(cellNo) {
			initValidState();
		
			if(!cellNoRegExp.test(cellNo)) {
				setMessage("휴대폰 번호가 올바르지 않습니다.");
				setValidFlag(false);
			} 
			
			return getValidFlag();
		};
        
        var isValidOutletCustId = function(iCustId) { // 2019.06.26 김윤실 추가
            
            initValidState();
             
            // 아이디에서 숫자를 삭제한 변수
            var tempId1 = iCustId.replace(/[0-9]/g, "");
            // 아이디에서 문자와 숫자를 삭제한 변수
            var tempId2 = iCustId.replace(/[a-zA-Z]/g, "").replace(/[0-9]/g, "");
            
            //1.영문자,숫자로 시작해서 특수문자가 포함됐는지
            if( !$.trim(iCustId) ) {
                setMessage("아이디를 입력해주세요.");
                return false;
            } else if( iCustId.length < 4 || iCustId.length > 20 ) {
                setMessage("아이디는 4자리 ~ 20자리로 입력해주세요.");
                return false;
            // @가 들어가면 이메일형식의 아이디로 판단한다.
            } else if( iCustId.indexOf( "@") >= 0 ) {
                setMessage("이메일 형식의 아이디는 만들 수 없습니다.");
                return false;
            // 숫자를 삭제했는데 빈값이면 숫자로만 된 아이디, 둘다 삭제했는데 빈값이 아니면 특수문자가 있는 아이디
            } else if( tempId1 == '' || tempId2 != '') {
                setMessage("사용할 수 없는 아이디 입니다.");
                return false;
            } else {
                $.ajax({
                    type : 'POST',
                    url : '/cu/outlt/checkIdDup.nhd',
                    data : 'usrId=' + iCustId,
                    async : false,
                    success : function(data) {
                        if( data > 0 ) {
                            setMessage("사용 불가능한 아이디 입니다.");
                            setValidFlag(false);
                        } else {
                            setValidFlag(true);
                        }
                        
    
                    }
                });
                
    
                return getValidFlag();
            }
            
        };
        
        // 그린푸드 권유자 코드 유효성을 체크한다. 
        var checkValidationRecommCode = function(recommCode,mophNo) {
            
                initValidState();
                    
                if(recommCode == "1111"){	//그리팅몰 요청
                    setMessage("사용 가능한 권유자번호입니다.");
                    setValidFlag(true);
                    return getValidFlag();
                }
                
                //입력을 한 경우는 유효성 체크함.
                if($.trim(recommCode) )  {
                    $.ajax({
                        type : 'POST',
                        url : '/cu/join/checkValidationRecommCode.nhd', 
                        data : {  
                                 "recommCode": recommCode,
                                 "mophNo": mophNo
                                },
                        async : false,
                        success : function(data) {
                            if( data.code == "0000" ) {
                                // 검증 완료  
                                setMessage("사용 가능한 권유자번호입니다.");
                                setValidFlag(true);
                            } else if( data.code == "9000" ) {
                                // 추천인코드가 누락되었습니다.
                                setMessage(data.message);
                                setValidFlag(false);
                            } else if( data.code == "9001" ) {
                                // 일치하는 코드가 없습니다.
                                setMessage(data.message);
                                setValidFlag(false);
                            } else if (data.code == "9002") {
                                // 하나의 휴대폰 번호로는 1회의 추천 가입만 가능합니다.
                                setMessage(data.message);
                                setValidFlag(false);
                            }else {
                                setMessage("관리자에게 문의해주세요.");
                                setValidFlag(false);
                            }
                        }
                    });
                    return getValidFlag();
                //입력을 안한 경우 유효성 체크 통과.
                } else {
                    return getValidFlag();
                }
            };
        
        return {
            isEmailFormat    : isEmailFormat,
            
            isNotEmailFormat : isNotEmailFormat,
            
            isValidPassword  : isValidPassword,
            
            preparePasswordValidation : preparePasswordValidation,
            
            getMessage   : getMessage,
            
            isValidCustId : isValidCustId,
            
            isRequired : isRequired,
            
            isAllCheckedRequired : isAllCheckedRequired,
            
            isValidEmail : isValidEmail,
            
            isValidRecommender : isValidRecommender,
            
            getValidFlag : getValidFlag,
            
            isValidCellNo : isValidCellNo,
            
            getNewPassword : getNewPassword, 
            
            getConfirmPassword : getConfirmPassword,
            
            isValidPasswordJustOnefield : isValidPasswordJustOnefield,
            
            isValidPassport : isValidPassport,
            
            isValidChNewId : isValidChNewId,
            
            isValidOutletCustId : isValidOutletCustId,
    
            checkValidationRecommCode : checkValidationRecommCode
            
        };
        
    }());
    