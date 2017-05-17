//由此开始联动
        function fillGoodsNameSelect(goodsTypeLabel,goodsSelected,goodsNameLabel,defaultMsg){
            var goodsType = $("#"+goodsTypeLabel).val();
            $.ajax({
                url: '/stockManage/getGoodsNameByType',
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
                         $("#searchSubModName").html("<option value=''>"+defaultMsg+"</option>");
                         $("#searchSubModName").trigger("chosen:updated");
                         
                    }
                }
            });
        }
        
        function fillFactoryNameSelect(goodsLabel,factorySelected,factoryNameLabel,defaultMsg){
            var goodsId = $("#"+goodsLabel).val();
            $.ajax({
                url: '/stockManage/getFactoryByGoods',
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
                         $("#searchSubModName").html("<option value=''>"+defaultMsg+"</option>");
                         $("#searchSubModName").trigger("chosen:updated");
                         
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
                         $("#searchSubModName").html("<option value=''>"+defaultMsg+"</option>");
                         $("#searchSubModName").trigger("chosen:updated");
                         
                    }
                }
            });
        }
        
        
      //清空检索按钮
        function resetSearchForm(){
            $(':input','#searchForm')  
             .not(':button, :submit, :reset, :hidden')  
             .val('')
            $("#modSts").val("");           
            $("#modSts").trigger("chosen:updated");
            $("#searchGoodsType").val("");          
            $("#searchGoodsType").trigger("chosen:updated");
            
            $("#searchGoodsName").chosen("destroy"); 
            $("#searchGoodsName").trigger("chosen:updated");
            $("#searchGoodsName").html('<option value="">--请选择--</option>');
            $("#searchGoodsName").chosen({});
            $("#searchGoodsName").trigger("chosen:updated");
            
            $("#searchFactoryName").chosen("destroy");
            $("#searchFactoryName").trigger("chosen:updated");
            $("#searchFactoryName").html('<option value="">--请选择--</option>');
            $("#searchFactoryName").chosen({});
            $("#searchFactoryName").trigger("chosen:updated");
            
            $("#searchModName").chosen("destroy");
            $("#searchModName").trigger("chosen:updated");
            $("#searchModName").html('<option value="">--请选择--</option>');
            $("#searchModName").chosen({});
            $("#searchModName").trigger("chosen:updated");
             
            $("#searchSubModName").chosen("destroy");
            $("#searchSubModName").trigger("chosen:updated");
            $("#searchSubModName").html('<option value="">--请选择--</option>');
            $("#searchSubModName").chosen({});
            $("#searchSubModName").trigger("chosen:updated");
            
            $("#noncontact").val("");           
            $("#noncontact").trigger("chosen:updated");
            $("#scan").val("");         
            $("#scan").trigger("chosen:updated");
            $("#pattern").val('');
            $("#pattern").trigger("chosen:updated");
        }  
        