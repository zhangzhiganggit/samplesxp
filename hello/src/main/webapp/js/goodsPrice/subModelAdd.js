//由此开始联动
		function fillGoodsNameSelect(goodsTypeLabel,goodsSelected,goodsNameLabel,defaultMsg){
        	var goodsType = $("#"+goodsTypeLabel).val();
        	$.ajax({
                url: '/subModel/getGoodsNameByType',
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
        	             $("#searchFactoryName").html("<option value=''>"+defaultMsg+"</option>");
        	             $("#searchFactoryName").trigger("chosen:updated");
        	             $("#searchModName").html("<option value=''>"+defaultMsg+"</option>");
        	             $("#searchModName").trigger("chosen:updated");
        	             $("#packUnit").val("");
        	             $("#packUnit").trigger("chosen:updated");
        	             $("#qty").val("");
        	             $("#qty").trigger("chosen:updated");
        	             $("#unit").val("");
        	             $("#unit").trigger("chosen:updated");
        	             $("#modSpec").html("");
        	             $("#modSpec").trigger("chosen:updated");
               	 	}
                }
        	});
        }
        
        function fillFactoryNameSelect(goodsLabel,factorySelected,factoryNameLabel,defaultMsg){
        	var goodsId = $("#"+goodsLabel).val();
        	$.ajax({
                url: '/subModel/getFactoryByGoods',
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
        	             $("#searchModName").html("<option value=''>"+defaultMsg+"</option>");
        	             $("#searchModName").trigger("chosen:updated");
        	             $("#packUnit").val("");
        	             $("#packUnit").trigger("chosen:updated");
        	             $("#qty").val("");
        	             $("#qty").trigger("chosen:updated");
        	             $("#unit").val("");
        	             $("#unit").trigger("chosen:updated");
        	             $("#modSpec").html("");
        	             $("#modSpec").trigger("chosen:updated");
               	 	}
                }
        	});
        }
        
        function fillModelSelect(goodsLabel,factoryLabel,modelSelected,ModelNameLabel,defaultMsg){
        	var goodsId = $("#"+goodsLabel).val();
        	var factId = $("#"+factoryLabel).val();
        	$.ajax({
                url: '/subModel/getModelByFactoryAndGoods',
                data : {
                	goodsId : goodsId,
                	factId :factId
    	        },
                async:false,
                cache: true,
                success : function(modelList) {
               	 	if(modelList != null && modelList !=undefined){
               	 		var options = "<option value=''>"+defaultMsg+"</option>";
        	            for(var i=0;i<modelList.length;i++){
        	            	if(modelSelected != ''){
        	            		if(modelList[i].modId == modelSelected){
        	            			 options+="<option selected='selected' value=\""+modelList[i].modId+"\">"+modelList[i].modNm+"</option>";
        	            		 }else{
        	            			 options+="<option value=\""+modelList[i].modId+"\">"+modelList[i].modNm+"</option>";
        	            		 }
        	            	 }else{
    	            			 options+="<option value=\""+modelList[i].modId+"\">"+modelList[i].modNm+"</option>";
        	            	 }
        	             }
        	             $("#"+ModelNameLabel).html(options);
        	             $("#"+ModelNameLabel).trigger("chosen:updated");
        	             $("#packUnit").val("");
        	             $("#packUnit").trigger("chosen:updated");
        	             $("#qty").val("");
        	             $("#qty").trigger("chosen:updated");
        	             $("#unit").val("");
        	             $("#unit").trigger("chosen:updated");
        	             $("#modSpec").html("");
        	             $("#modSpec").trigger("chosen:updated");
               	 	}
                }
        	});
        }
        
        function fillModelDetailSelect(modNameLabel,subModSelected,packUnit,defaultMsg){
        	var modId = $("#"+modNameLabel).val();
        	$.ajax({
                url: '/subModel/getModDetailByMod',
                data : {
                	modId : modId
    	        },
                async:false,
                cache: true,
                success : function(subModel) {
                	if(modId==null || modId==""){
                		document.getElementById("packUnit").value ="";
          	          document.getElementById("unit").value ="";
          	          document.getElementById("qty").value ="";
          	          $("#modSpec").html("");
                	}else{
                		if(subModel != null && subModel !=undefined){
        	            	subModel.packUnit  
        	            	subModel.qty
        	            	subModel.unit
        	            	subModel.modSpec
        	          document.getElementById("packUnit").value =subModel.packUnit;
        	          document.getElementById("unit").value =subModel.unit;
        	          document.getElementById("qty").value =subModel.qty;
        	          $("#modSpec").html(subModel.modSpec);
               	 	   }
                	}
                }
        	});
        }
        function getLen(obj){
        	var char = obj.replace(/[^\x00-\xff]/g, '**');
            return char.length;
        }
        function save(){
        	var goodsType = $("#searchGoodsType").val();
        	var goodsId = $("#searchGoodsName").val();
        	var factId = $("#searchFactoryName").val();
        	var modId = $("#searchModName").val();
        	var subModNm=$("#subModNm").val();
        	var nonNm = $("#nonNm").val();
        	var scanNm=$("#scanNm").val();
        	var pattern = $("#pattern").val();
        	
        	if(goodsType==null ||goodsType==''){
        		alert("请选择物品类型");
        		return;
        	}
        	if(goodsId==null ||goodsId==''){
        		alert("请选择物品名称");
        		return false;
        	}
        	if(factId==null ||factId==''){
        		alert("请选择厂商");
        		return false;
        	}
        	if(modId==null ||modId==''){
        		alert("请选择型号");
        		return false;
        	}
        	if(subModNm==null ||subModNm=='' || $.trim(subModNm).length == 0){
        		alert("请填写小型号");
        		return false;
        	}
        	if(getLen(subModNm)>100){
       		 alert("小型号最多为100个字符，请检查");
       		 return false;
       	 }
        	$.ajax({
        	   	    	cache: true,
        	   	        type: "POST",
        	   	        url:"/subModel/subModelAddSave.do?modId="+modId+"&subModNm="+subModNm+"&nonNm="+nonNm+"&scanNm="+scanNm+"&pattern="+pattern,
        	   	        dataType : "json",
        				async : false,
        				error : function(data) {
        					alert("提交失败");
        				},
        				success : function(data) {
        					var resCode = data.resCode;
        					alert(data.resMsg);
        					parent.$.fancybox.close();
        					window.parent.location.reload();
        				}
        			});
        	return true;
        }
        function validateIsHave(value){
			var flag;
			$.ajax({
				type:'post',
				url:"/subModel/validateIsHave",
				data:{"subModNm":$.trim(value)},
				async:false,
				success:function(data){
					flag = data;
					if(!data){
						alert("该小型号名称重复，请确定是否添加");
					}else{
					}
				}
			});
			return flag;
		}