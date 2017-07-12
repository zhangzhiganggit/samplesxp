<div class="col-md-6 col-sm-6 col-xs-12">
    <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12"><message:property domain="${domain }" property="${property }"/><g:message code="dashBoard.system.colon"></g:message>
        </label>
        <div class="col-md-9 col-sm-9 col-xs-12">
            <p class="form-control-static">
                <g:message code="${domain}.${property}.${domainInstance ? domainInstance[property] : '' }" default="${domainInstance ? domainInstance[property] : '' }" />&nbsp;
            </p>
        </div>
    </div>
</div>
