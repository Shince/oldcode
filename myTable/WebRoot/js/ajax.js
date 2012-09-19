function retrieveURL(url, nameOfFormToPost, status, callBackFun) {
	url = url + "?" + getFormAsString(nameOfFormToPost);
	//alert( url );
	//alert( callBackFun );
	document.getElementById("queryStatus").innerHTML = 
		"<img src=\"../images/ajax-loader.gif\" height=\"20\" border=\"0\">" + status;
	
	sendAjax( url, callBackFun );
}

function init(){
	if ( window.ActiveXObject ) {
		//alert("ie");
		var http_request;
		try {
			http_request = new ActiveXObject("Msxml2.XMLHTTP");
			//alert( "No exception for msxml2:" + http_request );
       } catch (e) {
       		try {
       			//alert( "xmlHTTP" );
            	http_request = new ActiveXObject( "Microsoft.XMLHTTP" );
            } catch (e) {
            	alert( e );
            }
       }
       return http_request;
	} else if ( window.XMLHttpRequest ) {
		//alert("firefox");
		var http_request = new XMLHttpRequest();
		if (http_request.overrideMimeType) {
        	http_request.overrideMimeType('text/xml');
        }
        return http_request;
	} else{
		alert('what the hell is ur browser?');
		return false;
	}
}

var req;

function sendAjax( url, callbackFun ){
	//alert("sendAjax:" + url);
	
	req = init();
	
	if( !req ){
		alert('Giving up :( Cannot create an XMLHTTP instance');
		return false;
	}
	
	try {
		req.onreadystatechange = callbackFun;
		//alert( callbackFun );
		//alert( url );
		req.open("GET", url, true);
		req.send(null);
	}
	catch (e) {
		alert("Server Communication Problem\n" + e);
	}
}

function getFormAsString(formName) {
	returnString = "";
	formElements = document.forms[formName].elements;
	for (var i = formElements.length - 1; i >= 0; --i) {
		if(  formElements[i].name == "CustSelected"  ){
			var selector = formElements[i];
			var size = selector.options.length;
			for( var j=0; j<size; j++ ){
				returnString += "&" + escape(selector.name) + "=" + escape(selector.options[j].value);
			}
		}else {
			returnString += "&" + escape(formElements[i].name) + "=" + escape(formElements[i].value);
		}
	}
	return returnString;
}

function setStatus( str ){
	document.getElementById("queryStatus").innerHTML = str;
}

function setStyleAndClickable(){
	$("p").each(function(i){
				setClickable(this, i);
			});

	$("div[@class=ver]").each(function(i){
		//alert(this.id);
		setSelectable(this, i);
	});

	setTableStyle();
}

function processContentStateChange(){
	if (req.readyState == 4) { // complete
		if (req.status == 200) { // response is normal	
			document.getElementById("content").innerHTML = req.responseText;
		} else if (request.status == 404){
			alert("Request URL does not exist");
		} else{
		 	alert("Error: status code is " + request.status); 
		} 
	}
}

function processStatusAndContentStateChange() {
	if (req.readyState == 4) { // complete
		if (req.status == 200) { // response is normal	
			//alert( response );
			var response = req.responseText.split("|");
			document.getElementById("queryStatus").innerHTML = response[0];
			document.getElementById("content").innerHTML = response[1];			
		} else if (request.status == 404){
			alert("Request URL does not exist");
		} else{
		 	alert("Error: status code is " + request.status); 
		} 
	}
}

function processStatusAndContent12StateChange() {
	if (req.readyState == 4) { // complete
		if (req.status == 200) { // response is normal	
			var response = req.responseText.split("|");
			document.getElementById("queryStatus").innerHTML = response[0];
			document.getElementById("table").innerHTML = response[1];			
		} else if (request.status == 404){
			alert("Request URL does not exist");
		} else{
		 	alert("Error: status code is " + request.status); 
		} 
	}
}

function processConent2StateChange(){
	if (req.readyState == 4) { // complete
		if (req.status == 200) { // response is normal	
			document.getElementById("content2").innerHTML = req.responseText;
		} else if (request.status == 404){
			alert("Request URL does not exist");
		} else{
		 	alert("Error: status code is " + request.status); 
		} 
	}
}

function processConent2StateChangeWithClickable(){
	if (req.readyState == 4) { // complete
		if (req.status == 200) { // response is normal
			//alert( req.responseText );
			document.getElementById("content2").innerHTML = req.responseText;
			/*$("p").each(function(i){
				setClickable(this, i);
			});
			setTableStyle();*/
			
			setStyleAndClickable();
		} else if (request.status == 404){
			alert("Request URL does not exist");
		} else{
		 	alert("Error: status code is " + request.status); 
		} 
	}
}

function processStatusAndContent2StateChangeWithSetClickable() {
	if (req.readyState == 4) { // complete
		if (req.status == 200) { // response is normal	

			var response = req.responseText.split("|");
			document.getElementById("queryStatus").innerHTML = response[0];
			//alert( "0:" + response[0] );
			
			//alert( "1:" + response[1] );
			document.getElementById("content2").innerHTML = response[1];
			
			/*$("p").each(function(i){
				setClickable(this, i);
			});
			setTableStyle();*/
			
			setStyleAndClickable();
		} else if (request.status == 404){
			alert("Request URL does not exist");
		} else{
		 	alert("Error: status code is " + request.status); 
		} 
	}
}

function addCustID(){
	var selected = document.getElementById("CustSelector").value;
	//alert(selected);
	var selector = document.getElementById("CustSelected");
	if( selected.length == 7 ){
		var isExist = false;
		var size = selector.options.length;
		for( i=0; i<size; i++ )
		{
			//alert( selector.options[i].value );
			//alert( selected );
			if( selector.options[i].value == selected )
				isExist = true;
		}
		
		if( !isExist ){
			selector.options.add( new Option(selected,selected) );
		}
	}
}

function delCustID(){
	var selector = document.getElementById("CustSelected");
	selector.options[selector.selectedIndex] = null;
}

function sortTable(sortby){
	var url = "/myTable/pagination.do?sortby=" + sortby;
	//alert( url );
	sendAjax( url, processConent2StateChangeWithClickable );
}

function updatePMR( pmrID, column, value){
	var url = "/myTable/updatePmr.do?pmrID=" + pmrID + "&column=" + column + "&value=" + value;
	alert( url );
	sendAjax( url, processConent2StateChangeWithClickable );
}

function loadCategoryManagement(){
	$('#content2').load('../webPages/categoryManagement.jsp');
	loadMainCategory();
}

function loadMainCategory(){
	$.post('/myTable/categoryManage.do', 
	{
	    method: 'showMain'
	}, 
	function(html) {    
	    $('#Category').html( html );
	    $('#SubCategory').load('../webPages/subCategory.jsp');
	});
}

function loadSubCategory( id ){
	$('#SubCategory').html('Loading Sub Category...');
	$.post('/myTable/categoryManage.do', 
	{
	    method: 'showSub',
	    MainCatID: id
	}, 
	function(html) {
	    $('#SubCategory').html( html );
	});
}

function onMainSelectChange(){
	var id = document.getElementById("mainCate").value;
	//alert( id );
	loadSubCategory( id );
}

function addCategory(){
	var cat=window.prompt('请输入主分类名称:','');

	if( cat.length < 3 || cat.length >30 ){
		alert('请输入长度为3~30的名称');
		//addCategory();
		return false;
	}else{
		$.post('/myTable/categoryManage.do', 
		{
		    method: 'addCategory',
		    CategoryName: cat
		}, 
		function(html) {
			loadMainCategory();
		     $('#SubCategory').html( '' );
		});
	}
}

function addSubCategory(){
	var cat=window.prompt('请输入子分类名称:','');
	var id = document.getElementById("mainCate").value;
	if( cat.length < 3 || cat.length >30 ){
		alert('请输入长度为3~30的名称');
		//addSubCategory();
		return false;
	}else{
		$.post('/myTable/categoryManage.do', 
		{
		    method: 'addSubCategory',
		    SubCategoryName: cat,
		    MainCategoryID: id
		}, 
		function(html) {
			//loadMainCategory();
		    loadSubCategory(id);
		});
	}
}

function delCategory(){
	var id = document.getElementById("mainCate").value;
	//alert(id);
	$.post('/myTable/categoryManage.do', 
	{
		method: 'delCategory',
		CategoryID: id
	}, 
	function(html) {
		loadMainCategory();
		$('#SubCategory').html( '' );
	});
}

function delSubCategory(){
	var id = document.getElementById("subCate").value;
	var mainid = document.getElementById("mainCate").value;
	//alert('value is "' + id + '"');
	$.post('/myTable/categoryManage.do', 
	{
		method: 'delSubCategory',
		SubCategoryID: id
	}, 
	function(html) {
		//loadMainCategory();
		loadSubCategory(mainid);
	});
}

function updateMainCategory(){
	var id = document.getElementById("mainCate").value;
	var text = document.getElementById("mainCate").options[document.getElementById("mainCate").selectedIndex].text;
	
	var cat=window.prompt('请输入修改的分类名称:',text);

	if( cat.length < 3 || cat.length >30 ){
		alert('请输入长度为3~30的名称');
		//updateMainCategory();
		return false;
	}else{
		$.post('/myTable/categoryManage.do', 
		{
		    method: 'updateCategory',
		    CategoryName: cat,
		    MainCategoryID: id
		}, 
		function(html) {
			loadMainCategory();
		});
	}
}

function updateSubCategory(){
	var mainid = document.getElementById("mainCate").value;
	var id = document.getElementById("subCate").value;
	var text = document.getElementById("subCate").options[document.getElementById("subCate").selectedIndex].text;
	
	var cat=window.prompt('请输入修改的子分类名称:',text);

	if( cat.length < 3 || cat.length >30 ){
		alert('请输入长度为3~30的名称');
		return false;
	}else{
		$.post('/myTable/categoryManage.do', 
		{
		    method: 'updateSubCategory',
		    SubCategoryName: cat,
		    SubCategoryID: id
		}, 
		function(html) {
			loadSubCategory(mainid);
		});
	}
}

function showVisible(name){
	var v = document.getElementById("showVisibleBox").checked;
	//alert( v );
	//alert( name );
	$.post('/myTable/customer.do', 
		{
		    method: 'view',
		    custName: name,
		    visible: v
		}, 
		function( html ){
			//alert( html );
			document.getElementById("content2").innerHTML = html;
			setStyleAndClickable();
		}
	);			
}

function selectAll(){
	$.post('/myTable/visibleSelect.do', 
		{
		    v: 'true'
		}, 
		function( html ){
			document.getElementById("content2").innerHTML = html;
			setStyleAndClickable();
		}
	);	
}

function deSelectAll(){
	$.post('/myTable/visibleSelect.do', 
		{
		    v: 'false'
		}, 
		function( html ){
			document.getElementById("content2").innerHTML = html;
			setStyleAndClickable();
		}
	);	
}

function loadAssignWork(){
	$('#content2').load('assignWorkManagement.jsp');
	
	$.post('/myTable/assignWork.do', 
		{
		    method: 'viewCusts'
		}, 
		function( html ){
			document.getElementById("CustomerNames").innerHTML = html;
			document.getElementById("Workers").innerHTML = "";
			wokerListChange();
		}
	);
}

function custNameListChange(){
	document.getElementById("Workers").innerHTML = "Loading..";
	var name = document.getElementById("custNameList").value;
	$.post('/myTable/assignWork.do', 
		{
		    method: 'viewWorkers',
		    custName: name
		}, 
		function( html ){
			document.getElementById("Workers").innerHTML = html;
			wokerListChange();
		}
	);
}

function addWorker(){
	var custName = document.getElementById("custNameList").value;
	var workerName = window.prompt('请输入参与者的邮件地址:','-__-!');
	//alert( custName + "  " + workerName );
	$.post('/myTable/assignWork.do', 
		{
		    method: 'addWorker',
		    workerName: workerName,
		    custName: custName
		}, 
		function( html ){
			document.getElementById("Workers").innerHTML = html;
			wokerListChange();
		}
	);
}

function delWorker(){
	var workerID = document.getElementById("workerList").value;
	var custName = document.getElementById("custNameList").value;
	
	$.post('/myTable/assignWork.do', 
		{
		    method: 'delWorker',
		    workerID: workerID,
		    custName: custName
		}, 
		function( html ){
			document.getElementById("Workers").innerHTML = html;
			wokerListChange();
		}
	);
}

function wokerListChange(){
	var custName = document.getElementById("custNameList").value;
	var workerCount = document.getElementById("workerList").options.length;
	
	$.post('/myTable/assignWork.do', 
		{
		    method: 'calcPmrCount',
		    workerCount: workerCount,
		    custName: custName
		}, 
		function( html ){
			document.getElementById("Status").innerHTML = html;
		}
	);
}