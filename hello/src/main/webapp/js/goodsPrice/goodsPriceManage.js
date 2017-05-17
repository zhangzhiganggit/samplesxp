        //阶梯、统一联动
        function changePriceType(){
        	var priceType = $("input[name='priceType']:checked").val();
        	if(priceType=='01')
        	{
        		$("#basePriceDiv").show();
        		$("#priceTitleDiv").hide();
        		$("#levelOneDiv").hide();
        		$("#levelTwoDiv").hide();
        		$("#levelThreeDiv").hide();
        	}else{

        		$("#basePriceDiv").hide();
        		$("#priceTitleDiv").show();
        		$("#levelOneDiv").show();
        		$("#levelTwoDiv").show();
        		if($("#levelTwoEnd").val()==9999999 && $("#levelThreePrice").val()==""){
        			$("#levelTwoEnd").val('及以上');
        			$("#levelThreeDiv").hide();
        		}
        		if($("#levelTwoEnd").val() =='及以上'){
        			$("#addLevelThree").show();
        			$("#deleteLevelThree").hide();
        		}else{
        			$("#deleteLevelThree").show();
        			$("#levelThreeDiv").show();
        		}
        	}
        }
        function addLevelThree(){
        	$("#levelThreeDiv").show();
        	$("#levelTwoEnd").removeAttr("readonly");
        	if($("#levelTwoEnd").val()=='及以上'){
        		$("#levelTwoEnd").val("");
        		$("#levelThreeStart").html("");
        	}else{
        		$("#levelThreeStart").html(eval($("#levelTwoEnd").val())+1);
        	}
        	$("#addLevelThree").hide();
        	$("#deleteLevelThree").show();
        }
        function deleteLevelThree(){
        	$("#levelThreeDiv").hide();
        	$("#addLevelThree").show();
        	$("#deleteLevelThree").hide();
        	$("#levelTwoEnd").val("及以上");
        	$("#levelTwoEnd").attr("readonly","readonly");
        }
        function quantityChangeOne(){
        	if($("#levelOneEnd").val()=="9999999"){
        		alert("数量超限，请重新输入");
        		$("#levelOneEnd").val("6");
        		//$("#levelTwoStart").html("");	
        	}else{
        		$("#levelTwoStart").html(eval($("#levelOneEnd").val())+1);
        	}
        }
        function quantityChangeTwo(){
        	if($("#levelTwoEnd").val()=="9999999"){
        		alert("数量超限，请重新输入");
        		$("#levelTwoEnd").val("8");
        		//$("#levelThreeStart").html("");	
        	}else{
        		$("#levelThreeStart").html(eval($("#levelTwoEnd").val())+1);
        	}
        }
        function checkPriceForOne(){
        	if( $("#freeGiftsForOne").prop('checked') && $("#freeGiftsForTotal").prop('checked')){
        		$("#freeGiftsForTotal").prop('checked',false);
        		
        	}
        	if( $("#freeGiftsForOne").prop('checked')){
        		$("#addUpTop").prop('checked',false);
        	}
        	
        }
        function checkIfAddUpTop(){
        	if( $("#freeGiftsForOne").prop('checked')){
        		$("#freeGiftsForOne").prop('checked',false);	
        	}
        }
        function checkPriceForTotal(){
        	if( $("#freeGiftsForOne").prop('checked') && $("#freeGiftsForTotal").prop('checked')){
        		$("#freeGiftsForOne").prop('checked',false);
        		
        	}
        }
        function fillGoodsNameSelect(goodsTypeLabel,goodsSelected,goodsNameLabel,defaultMsg,factoryNameLabel,modNameLabel){
        	var goodsType = $("#"+goodsTypeLabel).val();
        	$.ajax({
                url: '/goodsPriceManage/getGoodsNameByType',
                data : {
    				goodsType : goodsType
    	        },
                async:false,
                cache: true,
                success : function(goodsNameList) {
               	 	if(goodsNameList != null && goodsNameList !=undefined){
               	 		var options = "<option value=''>"+defaultMsg+"</option>";
        	            for(var i=0;i<goodsNameList.length;i++){
        	            	if(goodsSelected != ''){
        	            		if(goodsNameList[i].goodsId == goodsSelected){
        	            			 options+="<option selected='selected' value=\""+goodsNameList[i].goodsId+"\">"+goodsNameList[i].goodsName+"</option>";
        	            		 }else{
        	            			 options+="<option value=\""+goodsNameList[i].goodsId+"\">"+goodsNameList[i].goodsName+"</option>";
        	            		 }
        	            	 }else{
        	            		 options+="<option value=\""+goodsNameList[i].goodsId+"\">"+goodsNameList[i].goodsName+"</option>";
        	            	 }
        	             }
        	             $("#"+goodsNameLabel).html(options);
        	             $("#"+goodsNameLabel).trigger("chosen:updated");  
        	             $("#"+factoryNameLabel).html("");
        	             $("#"+factoryNameLabel).trigger("chosen:updated");
        	             $("#"+modNameLabel).html("");
        	             $("#"+modNameLabel).trigger("chosen:updated");
        	             $("#commType").html("");
        	             $("#commType").trigger("chosen:updated");
               	 	}
                }
        	});
        }
        
        function fillFactoryNameSelect(goodsLabel,factorySelected,factoryNameLabel,defaultMsg,modNameLabel){
        	var goodsId = $("#"+goodsLabel).val();
        	$.ajax({
                url: '/goodsPriceManage/getFactoryByGoods',
                data : {
                	goodsId : goodsId
    	        },
                async:false,
                cache: true,
                success : function(factoryList) {
               	 	if(factoryList != null && factoryList !=undefined){
               	 		var options = "<option value=''>"+defaultMsg+"</option>";
        	            for(var i=0;i<factoryList.length;i++){
        	            	if(factorySelected != ''){
        	            		if(factoryList[i].factId == factorySelected){
        	            			 options+="<option selected='selected' value=\""+factoryList[i].factId+"\">"+factoryList[i].factShortname+"</option>";
        	            		 }else{
        	            			 options+="<option value=\""+factoryList[i].factId+"\">"+factoryList[i].factShortname+"</option>";
        	            		 }
        	            	 }else{
    	            			 options+="<option value=\""+factoryList[i].factId+"\">"+factoryList[i].factShortname+"</option>";
        	            	 }
        	             }
        	             $("#"+factoryNameLabel).html(options);
        	             $("#"+factoryNameLabel).trigger("chosen:updated");
        	             $("#"+modNameLabel).html("");
        	             $("#"+modNameLabel).trigger("chosen:updated");
        	             $("#commType").html("");
        	             $("#commType").trigger("chosen:updated");
               	 	}
                }
        	});
        }
        
        function fillModelSelect(goodsLabel,factoryLabel,modelSelected,ModelNameLabel,defaultMsg){
        	var goodsId = $("#"+goodsLabel).val();
        	var factId = $("#"+factoryLabel).val();
        	var pattern=$("#pattern").val();
        	$.ajax({
                url: '/goodsPriceManage/getModelByFactoryAndGoods',
                data : {
                	goodsId : goodsId,
                	factId :factId,
                	pattern:pattern
    	        },
                async:false,
                cache: true,
                success : function(modelList) {
               	 	if(modelList != null && modelList !=undefined){
               	 		var options = "<option value=''>"+defaultMsg+"</option>";
        	            for(var i=0;i<modelList.length;i++){
        	            	if(modelSelected != ''){
        	            		if(modelList[i].subModelId == modelSelected){
        	            			 options+="<option selected='selected' value=\""+modelList[i].subModelId+"\">"+modelList[i].subModelName+"</option>";
        	            		 }else{
        	            			 options+="<option value=\""+modelList[i].subModelId+"\">"+modelList[i].subModelName+"</option>";
        	            		 }
        	            	 }else{
    	            			 options+="<option value=\""+modelList[i].subModelId+"\">"+modelList[i].subModelName+"</option>";
        	            	 }
        	             }
        	             $("#"+ModelNameLabel).html(options);
        	             $("#"+ModelNameLabel).trigger("chosen:updated");
        	             $("#commType").html("");
        	             $("#commType").trigger("chosen:updated");
               	 	}
                }
        	});
        }
        function fillCommTypeSelect(modelLabel,commTypeSelected,commTypeNmLabel,defaultMsg){
        	var modId = $("#"+modelLabel).val();
        	$.ajax({
                url: '/goodsPriceManage/getCommTypeByMod',
                data : {
                	modId : modId
    	        },
                async:false,
                cache: true,
                success : function(modelList) {
               	 	if(modelList != null && modelList !=undefined){
               	 		var options = "<option value=''>"+defaultMsg+"</option>";
        	            for(var i=0;i<modelList.length;i++){
        	            	if(commTypeSelected != ''){
        	            		if(modelList[i].commType == commTypeSelected){
        	            			 options+="<option selected='selected' value=\""+modelList[i].commType+"\">"+modelList[i].commTypeName+"</option>";
        	            		 }else{
        	            			 options+="<option value=\""+modelList[i].commType+"\">"+modelList[i].commTypeName+"</option>";
        	            		 }
        	            	 }else{
        	            		 options+="<option value=\""+modelList[i].commType+"\">"+modelList[i].commTypeName+"</option>";
        	            	 }
        	             }
        	             $("#"+commTypeNmLabel).html(options);
        	             $("#"+commTypeNmLabel).trigger("chosen:updated");  
               	 	}
                }
        	});
        }
        function setDefaultValue(){
        	var minOrderQuantity = $("#minOrderQuantity").val();
        	var unitQuantity = $("#unitQuantity").val();
        	var levelOnePrice;
        	var priceType = $('input[name="priceType"]:checked').val();
        	if(priceType == "01"){
        		levelOnePrice = $("#levelOnePrice1").val();
        	}
        	if(priceType == "02"){
        		levelOnePrice = $("#levelOnePrice2").val();
        	}
        	var check=/^([1-9]{1}\d{0,6})$/;
        	if(!check.test(minOrderQuantity))
        	{
        		alert("起订量只能填写1~9999999之间的整数,不能有空格！");
        		return;
        	}
        	if(!check.test(unitQuantity))
        	{
        		alert("单位数量只能填写1~9999999之间的整数,不能有空格！");
        		return;
        	}
        	var checkT=/^[0-9]+([.]\d{1,2})?$/;
        	if(!checkT.test(levelOnePrice) || levelOnePrice<1 || levelOnePrice>9999999)
        	{
        		if(priceType == "01"){
        			alert("基础价格只能填写1~9999999之间的数,最多两位小数,不能有空格！");
            		return;
            	}else{
            		alert("一阶价格只能填写1~9999999之间的数,最多两位小数,不能有空格！");
            		return;
            	}
        		
        	}
        	if(priceType == "02"){
        		var levelOneEnd=$("#levelOneEnd").val(); 
            	var levelTwoPrice=$("#levelTwoPrice").val();
        		var levelThreePrice=$("#levelThreePrice").val();
            	if(levelOneEnd=="" || Number(levelOneEnd)=="1"){
            		alert("订购数量必填,终止数量要大于开始数量！");
            		return;
            	}
            	if(!checkT.test(levelTwoPrice) || levelTwoPrice<1 || levelTwoPrice>9999999 ){
        			alert("单价只能填写1~9999999之间的数,最多两位小数,不能有空格！");
            		return;
        		}
            	var levelTwoEnd=$("#levelTwoEnd").val();
            	if(levelTwoEnd!="及以上"){
            		var levelTwoStart=Number($("#levelOneEnd").val())+1; 
            		if(!check.test(levelTwoEnd))
                	{
                		alert("订购数量必填只能填写1~9999999之间的整数,不能有空格！");
                		return;
                	}
            		if(levelTwoEnd<=levelTwoStart){
            			alert("终止数量要大于开始数量！");
                		return;
            		}
            		if(!checkT.test(levelThreePrice) || levelThreePrice<1 || levelThreePrice>9999999){
            			alert("单价只能填写1~9999999之间的数,最多两位小数,不能有空格！");
                		return;
            		}
            	}
            	if(!check.test(levelOneEnd))
            	{
            		alert("订购数量必填只能填写1~9999999之间的整数,不能有空格！");
            		return;
            	}
            	if($("#levelThreeStart").html()=="" || $("#levelTwoStart").html()==""){
            		alert("阶梯开始数量不能为空！");
            		return;
            	}
        	}
        	if(!$("#ifOnlinePay").prop("checked") && !$("#ifRemitPay").prop("checked")){
        		alert("请至少选择一种支付方式！");
        		return;
        	}
        	if($("#freeGiftsForOne").prop("checked")){
        		debugger;
        		var giftOneLimitNum = $("#giftOneLimitNum").val();
        		var giftOneQuantity = $("#giftOneQuantity").val();
        		var giftOneGoodsType = $("#giftOneGoodsType").val();
        		var giftOneGoodsName = $("#giftOneGoodsName").val();
        		var giftOneFactoryName = $("#giftOneFactoryName").val();
        		var giftOneModName = $("#giftOneModName").val();
        		if(giftOneLimitNum == "" || giftOneQuantity == ""
        				|| giftOneGoodsType == "" || giftOneGoodsName == ""
        				|| giftOneModName == "" ||giftOneModName==null){
        			alert("满赠信息必填，请填写并选择赠品信息！");
        			return;
        		}
        		if($("#ifPartlyOrg").prop("checked")&&$("#subModelId").val() == $("#giftOneModName").val()){
        			alert("勾选了“仅部分代理”的小型号机具不能作为自己的赠品!");
        			return;
        		}
        		var pattern =/^[1-9]\d{0,6}$/;
        		if(!pattern.test(giftOneLimitNum) || !pattern.test(giftOneQuantity))
        		{
        			alert("满赠信息只能填写1~9999999之间的整数！");
        			return;
        		}
        		
        	}
        	if($("#freeGiftsForTotal").prop("checked")){
        		debugger;
        		var giftTotalLimitNum = $("#giftTotalLimitNum").val();//满
        		var giftTotalQuantity = $("#giftTotalQuantity").val();//赠
        		var giftTotalGoodsType = $("#giftTotalGoodsType").val();//物品类型
        		var giftTotalGoodsName = $("#giftTotalGoodsName").val();//物品名称
        		var giftTotalFactoryName = $("#giftTotalFactoryName").val();
        		var giftTotalModName = $("#giftTotalModName").val();
        		if(giftTotalLimitNum == "" || giftTotalQuantity == ""
        				|| giftTotalGoodsType == "" || giftTotalGoodsName == ""
        				|| giftTotalModName == "" ||giftTotalModName==null ){
        			alert("满赠信息必填，请填写并选择赠品信息！");
        			return;
        		}
        		if($("#ifPartlyOrg").prop("checked")&&$("#subModelId").val() == $("#giftTotalModName").val()){
        			alert("勾选了“仅部分代理”的小型号机具不能作为自己的赠品!");
        			return;
        		}
        		var pattern =/^[1-9]\d{0,6}$/;
        		if(!pattern.test(giftTotalLimitNum) || !pattern.test(giftTotalQuantity))
        		{
        			alert("满赠信息只能填写1~9999999之间的整数！");
        			return;
        		}
        	}
        	if($("#isDiscount").prop("checked")){
        		var discountRate = $("#discountRate").val();
        		var pattern =/^[1-9]$/;
        		if(discountRate == "")
        		{
        			alert("折扣信息为必填，请填写！");
        			return;
        		}
        		if(!pattern.test(discountRate))
        		{
        			alert("折扣只能填写[1~9]之间的整数！");
        			return;
        		}
        	}
        	//根据满赠选择设置满赠信息
        	if($("#freeGiftsForOne").prop("checked")){
        		$("#freeLimitNum").val($("#giftOneLimitNum").val());
        		$("#freeGiftsQuantity").val($("#giftOneQuantity").val());
        		$("#freeGiftsModelId").val($("#giftOneModName").val());
        	}else if($("#freeGiftsForTotal").prop("checked")){
        		$("#freeLimitNum").val($("#giftTotalLimitNum").val());
        		$("#freeGiftsQuantity").val($("#giftTotalQuantity").val());
        		$("#freeGiftsModelId").val($("#giftTotalModName").val());
        	}
        	if(!confirm("您给该物品设置了价格，请确认是否按此提交？")){
        		return;
        	}
        	//根据阶梯选择设置信息
        	if(priceType == "01" ){
        		$("#levelTwoPrice").val(null);
        		$("#levelThreePrice").val(null);
        		$("#levelOneEnd").val(null);
        		$("#levelTwoEnd").val(null);
        	}if(priceType == '02'){
        		if($("#levelTwoEnd").val() == "及以上"){
        			$("#levelTwoEnd").val(9999999);
        		}
        	}
        	$("#levelOnePrice1").val(levelOnePrice);
        	document.getElementById("editGoodsPriceForm").submit();
        }
        function gobackPriceList(){
        	window.location.href = history.go(-1);
        }
        