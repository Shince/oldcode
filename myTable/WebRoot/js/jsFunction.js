function toggleSBSize(big) {
    var sb = document.getElementById('header-searchbox');
    if (big)
        sb.style.width = '20em';
    else
        sb.style.width = '10em';
}

/*
var usageErr = "<select name=\"subSelect\">" +
		    "<option value=\"DM\">DM</option>" + 
		    "<option value=\"RDS\">RDS</option>" +
			"<option value=\"Per\">Per</option>" + 
			"<option value=\"DS\">DS</option>" +
			"<option value=\"DS\">DS</option>" +
			"<option value=\"UT\">UT</option>" +
			"<option value=\"PM\">PM</option>" +
			"<option value=\"XT\">XT</option>" +
		   "</select>"
var qAndA = "<select name=\"subSelect\">" +
		    "<option value=\"Data Manager (DM)\">Data Manager (DM)</option>" + 
		    "<option value=\"Relational Data System (RDS)\">Relational Data System (RDS)</option>" +
			"<option value=\"Performance\">Performance</option>" + 
			"<option value=\"miscellaneous\">miscellaneous</option>" +
		   "</select>"
var missingFix = "<select name=\"subSelect\">" +
		    "<option value=\" <=1 month\"> <=1 month</option>" + 
		    "<option value=\"between 1 to 12 month\">between 1 to 12 month</option>" +
			"<option value=\"between 12 to 18\">between 12 to 18</option>" + 
			"<option value=\" >18 months\"> >18 months</option>" +
			"<option value=\"availability unknown\">availability unknown</option>" +
		   "</select>"
var requiredNewFix = "<select name=\"subSelect\">" +
		    "<option value=\"Intermittent\">Intermittent</option>" + 
		    "<option value=\"Re-creatable\">Re-creatable</option>" +
		   "</select>"
var others = "N/A."
		   
function changeSub( element, pmrID ){
	//alert( element.name );
	//alert( pmrID );
	//alert( document.getElementById( pmrID ).name );
	//alert( element.value );
	
	var value = element.value;
	
	if( value == "Usage Error" ){
		document.getElementById(pmrID).innerHTML = usageErr;
	}else if( value == "Missing Fix" ){
		document.getElementById(pmrID).innerHTML = missingFix;
	}else if( value == "Q and A" ){
		document.getElementById(pmrID).innerHTML = qAndA;
	}else if( value == "Required New Fix" ){
		document.getElementById(pmrID).innerHTML = requiredNewFix;
	}else if( value == "Others" ){
		document.getElementById(pmrID).innerHTML = others;	
	}else{
		alert( "no corresponding..-_-|||" );
	}
}

function setSub( input, pmrID ){
	//alert('input=Others?' + (input == "Others"));
	if( input == "Usage Error" ){
		document.getElementById(pmrID).innerHTML =  usageErr;
	}else if( input == "Missing Fix" ){
		document.getElementById(pmrID).innerHTML =  missingFix;
	}else if( input == "Q and A" ){
		document.getElementById(pmrID).innerHTML =  qAndA;
	}else if( input == "Required New Fix" ){
		document.getElementById(pmrID).innerHTML =  requiredNewFix;
	}else if( input == "Others" ){
		document.getElementById(pmrID).innerHTML =  others;	
	}else{
		document.getElementById(pmrID).innerHTML = ( "no corresponding..-_-|||" );
	}
}
*/