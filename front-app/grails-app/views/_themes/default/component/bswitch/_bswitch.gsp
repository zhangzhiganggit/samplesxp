<div class="col-xs-12 col-md-5 col-sm-4">
    <div class="form-group">
        <label class="control-label col-md-8">${title}</label>
        <div class="col-md-4">
            <input${id ? ' id=' + id : ''}  ${name ? ' name=' + name : ''}  type="checkbox"
                   class="make-switch" ${domainInstance && domainInstance[property] ? ' checked' : ''}
                   ${checked ? ' checked' : ''}
                   data-on-color="${dataOnColor}"
                   value="${domainInstance ? domainInstance[property] : ''}" %{-- eg: ${value}--}%
                   data-off-color="${dataOffColor}"
                   ${disabled ? ' disabled' : ''}
                   ${readonly ? ' readonly' : ''}>
        </div>
    </div>
</div>