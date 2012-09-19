
/*$(document).ready(function () {
	$("p").each(function(i){
		setClickable(this, i);
	});
	$("#version").each(function(i){
		setSelectable(this, i);
	});
	setTableStyle();
});*/

function setTableStyle(){
	$(".stripe tr").mouseover( function(){  
        $(this).addClass("over");}); 
	$(".stripe tr").mouseout(function(){  
        $(this).removeClass("over"); });
    $(".stripe tr:even").addClass("alt");
}

function setClickable(obj, i) {
//alert('blah..');
	$(obj).click(function () {
		var textarea = "<div><textarea rows=\"2\" cols=\"20\">" + $(obj).html() + "</textarea>";
		var button = "<div><input type=\"button\" value=\"SAVE\" class=\"saveButton\" onclick=\"\" /> OR <input type=\"button\" value=\"CANCEL\" class=\"cancelButton\" /></div></div>";
		var revert = $(obj).html();
		$(obj).after(textarea + button).remove();
		$(".saveButton").click(function () {
			saveChanges(this, false, i);
		});
		$(".cancelButton").click(function () {
			saveChanges(this, revert, i);
		});
	}).mouseover(function () {
		$(obj).addClass("editable");
	}).mouseout(function () {
		$(obj).removeClass("editable");
		$(obj).removeClass("over");
	});
}//end of function setClickable

function setSelectable(obj, i) {
//alert('blah..');
	$(obj).click(function () {
		var id = obj.id;
		//var value = document.getElementById(id).value;
		id = id.split("_")[1];
		//alert(id + "---" + value);
		var widget = "<select onchange=\"updatePMR('" + id + "','db_ver',this.value);\"><option>select</option><option value=\"510\">510</option><option value=\"610\">610</option><option value=\"710\">710</option><option value=\"810\">810</option><option value=\"910\">910</option></select>";
		$(obj).after(widget).remove();
	}).mouseover(function () {
		$(obj).addClass("editable");
	}).mouseout(function () {
		$(obj).removeClass("editable");
		$(obj).removeClass("over");
	});
}//end of function setSelectable

function saveChanges(obj, cancel, n) {
	if (!cancel) {
		var t = $(obj).parent().siblings(0).val();
		//alert(t);
		
		var t1 = $(obj).parent().parent().siblings(0).val();
		//alert(t1);
		//alert( processCustomerSaveStateChange );
		//$.post("/myTable/updatePmr.do", {value:t,column:"mycomment", pmrID:t1}, processCustomerSaveStateChange);
		
		updatePMR( t1, "mycomment", t);
		
		//updatePMR( "" );
	} else {
		var t = cancel;
	}
	if (t == "") {
		t = "Not modified.";
	}
	$(obj).parent().parent().after("<p>" + t + "</p>").remove();
	setClickable($("p").get(n), n);
}

