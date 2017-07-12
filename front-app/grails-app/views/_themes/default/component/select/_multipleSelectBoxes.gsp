<div class="form-group">
    <label for="${id}" class="control-label col-md-3">${title}</label>

    <div class="input-group col-md-4">
        <g:select id="${id}" class="form-control select2-multiple${' ' + cssClass}"
                  from="${from}" name="${name}"
                  optionKey="${optionKey}" optionValue="${optionValue}"
                  valueMessagePrefix="${valueMessagePrefix}"
                  noSelection="${noSelection ? noSelection : ['': '']}"
                  multiple="multiple"/>
    </div>
</div>
