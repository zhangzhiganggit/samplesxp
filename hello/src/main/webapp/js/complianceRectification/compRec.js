jQuery(function($) {
	//商户类型00普通商户;01连锁总店;02连锁分店;03 1+N总店;04 1+N分店
	var mercType = $("#mercType").html();
	var mercTypeArray = ['普通商户','连锁总店','连锁分店','1+N总店','1+N分店'];
	var mercTypeName = mercTypeArray[parseInt(mercType)];
	$("#mercType").html(mercTypeName);
	$("#mercType").attr('data-content',mercTypeName);
	var crResult = $('#crResult').html();
	var crArray = ['合规','整改','撤机'];
	var crResultName = crArray[parseInt(crResult-1)];
	$('#crResult').html(crResultName);
	$("#crResult").attr('data-content',crResultName);
	if(crResult == '1')
		$('#downloadImageDiv').show();
	
	
	$('#compRecForm').bootstrapValidator({
        message: 'This value is not valid',
        container:'popover',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            remarkCity: {
                validators: {
                    notEmpty: {},
                    stringLength:{
                    	max:200
                    }
                }
            },
            opinion: {
                validators: {
                    notEmpty: {},
                    stringLength:{
                    	max:200
                    }
                }
            }
        }
    });

    $('.easy-pie-chart.percentage').each(function(){
        var $box = $(this).closest('.infobox');
        var barColor = $(this).data('color') || (!$box.hasClass('infobox-dark') ? $box.css('color') : 'rgba(255,255,255,0.95)');
        var trackColor = barColor == 'rgba(255,255,255,0.95)' ? 'rgba(255,255,255,0.25)' : '#E2E2E2';
        var size = parseInt($(this).data('size')) || 50;
        $(this).easyPieChart({
            barColor: barColor,
            trackColor: trackColor,
            scaleColor: false,
            lineCap: 'butt',
            lineWidth: parseInt(size/10),
            animate: /msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase()) ? false : 1000,
            size: size
        });
    })

    $('.sparkline').each(function(){
        var $box = $(this).closest('.infobox');
        var barColor = !$box.hasClass('infobox-dark') ? $box.css('color') : '#FFF';
        $(this).sparkline('html',
            {
                tagValuesAttribute:'data-values',
                type: 'bar',
                barColor: barColor ,
                chartRangeMin:$(this).data('min') || 0
            });
    });
	
});