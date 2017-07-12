<div class="modal modal-scroll fade" id="${id}" tabindex="-1" role="basic" aria-hidden="true">
    <div class="modal-dialog${width ? ' modal-' + width : ''}">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">${title}</h4>
            </div>

            <div class="modal-body">${raw(body)}</div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
