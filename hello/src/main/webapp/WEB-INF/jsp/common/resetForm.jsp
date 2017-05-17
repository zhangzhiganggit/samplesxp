<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<button class="btn btn-info btn-sm" type="button"
	onclick="resetMecForm()">
	<span class="ace-icon fa fa-search-minus icon-on-right bigger-110"></span>清空检索条件
</button>
<script type="text/javascript">
	function resetMecForm() {
		var notFilter = ":button, :submit, :reset, :hidden";
		$(':input', '#searchForm').not(':button, :submit, :reset, :hidden')
				.val('').removeAttr('checked').removeAttr('selected');
		myResetForm();
	}
	
	/**例子
	function myResetForm(){
	    	 $("#mecSts").val('');
 		 $("#mecSts").trigger("chosen:updated");
	}
	*/
</script>

