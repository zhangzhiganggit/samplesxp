jQuery(function($) {
    $('#editGoodsPriceForm').formValidation({
        message: 'This value is not valid',
        container:'popover',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            //起定量
        	minOrderQuantity: {
                validators: {
                    notEmpty: {
                    	message:'起定量不可为空'
                    },
                    digits:{
                    	message:'起订量只能填写1~9999999之间的整数,不能有空格'
                    },
                    greaterThan: {
                    	value : 1,
                    	message : '起订量只能填写1~9999999之间的整数,不能有空格'
                    },
                    lessThan:{
                    	value :9999999,
                    	message : '起订量只能填写1~9999999之间的整数,不能有空格'
                    }
                }
            },
            //单位数量
            unitQuantity: {
                validators: {
                    notEmpty: {
                    	message:'单位数量不可为空'
                    },
                    digits:{
                    	message:'单位数量只能填写1~9999999之间的整数,不能有空格'
                    },
                    greaterThan: {
                    	value : 1,
                    	message : '单位数量只能填写1~9999999之间的整数,不能有空格'
                    },
                    lessThan:{
                    	value :9999999,
                    	message : '单位数量只能填写1~9999999之间的整数,不能有空格'
                    }
                }
            },
            //基础价格
            levelOnePrice: {
                validators: {
                    notEmpty: {
                    	message:'基础价格不可为空'
                    },
                    regexp: {
                        regexp: /^[0-9]+([.]\d{1,2})?$/,
                        message:'请输入正确数字（最多两位小数）'
                    },
                    greaterThan: { 
                    	value : 1,
                    	message : '基础价格只能填写1~9999999之间的数'
                    },
                    lessThan:{
                    	value :9999999,
                    	message : '基础价格只能填写1~9999999之间的数'
                    }
                }
            },
          //基础价格
            levelOnePrice: {
                validators: {
                    notEmpty: {
                    	message:'基础价格不可为空'
                    },
                    regexp: {
                        regexp: /^[0-9]+([.]\d{1,2})?$/,
                        message:'请输入正确数字（最多两位小数）'
                    },
                    greaterThan: {
                    	value : 1,
                    	message : '基础价格只能填写1~9999999之间的数'
                    },
                    lessThan:{
                    	value :9999999,
                    	message : '基础价格只能填写1~9999999之间的数'
                    }
                }
            },
            //二阶价格
            levelTwoPrice: {
                validators: {
                    notEmpty: {
                    	message:'基础价格不可为空'
                    },
                    regexp: {
                        regexp: /^[0-9]+([.]\d{1,2})?$/,
                        message:'请输入正确数字（最多两位小数）'
                    },
                    greaterThan: {
                    	value : 1,
                    	message : '基础价格只能填写1~9999999之间的数'
                    },
                    lessThan:{
                    	value :9999999,
                    	message : '基础价格只能填写1~9999999之间的数'
                    }
                }
            },
            //三阶
            levelThreePrice: {
                validators: {
                    notEmpty: {
                    	message:'基础价格不可为空'
                    },
                    regexp: {
                        regexp: /^[0-9]+([.]\d{1,2})?$/,
                        message:'请输入正确数字（最多两位小数）'
                    },
                    greaterThan: {
                    	value : 1,
                    	message : '基础价格只能填写1~9999999之间的数'
                    },
                    lessThan:{
                    	value :9999999,
                    	message : '基础价格只能填写1~9999999之间的数'
                    }
                }
            },
      
        }
});

})