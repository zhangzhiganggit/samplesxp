    <div class="form-group" id="transferOrgTreeId">
        %{--<label class="control-label col-md-4">--}%
            %{--<message:property domain="${domain}" property="${property}"/>--}%
        %{--</label>--}%

        <div class="col-md-10">
            <input class="form-control" type="text" name="q_transfer_${property}" value="${params ? params['q_' + property] : '' }" id="transferOrgInput"/>
            <input class="form-control" type="hidden" name="q_transfer_${property}_id" value="${params ? params['q_' + property+'_id'] : '' }"  id="transferOrgInputId"/>
            <input class="form-control" type="hidden" name="q_transfer_directly" value="${directly}" id="transferDirectly"/>
            <div id="transferOrgTree" class="pop-box" style=""></div>
        </div>
    </div>
%{--</div>--}%

