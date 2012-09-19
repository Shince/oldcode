//var theForm = null;
var theTextAreaName = null;

function initEditor(textAreaName)
{
	theTextAreaName = textAreaName;
}

function addURL()
{
	
	if(document.selection.createRange().parentElement().name==theTextAreaName )
	{
		urlAddress = prompt("请输入URL地址");
		if(urlAddress != null)
		{
 			document.selection.createRange().text='[url='+urlAddress+']'+document.selection.createRange().text+'[/url]';
		}
		else 
			alert("您没有输入URL");
 	}
	
 }

function addEmail()
{
	
	if(document.selection.createRange().parentElement().name==theTextAreaName )
	{
		emailAddress = prompt("请输入Email地址");
		if(emailAddress != null)
		{
 			document.selection.createRange().text='[email='+emailAddress+']'+document.selection.createRange().text+'[/email]';
		}
		else 
			alert("您没有输入Email地址");
 	}
 }

function bold()
{
	if(document.selection.createRange().parentElement().name==theTextAreaName )
	{

 		document.selection.createRange().text='[b]'+document.selection.createRange().text+'[/b]';
 	}
	document.selection.createRange().select();
	
 }

function picture()
{
	if(document.selection.createRange().parentElement().name==theTextAreaName )
	{

 		document.selection.createRange().text='[img]'+document.selection.createRange().text+'[/img]';
 	}
	document.selection.createRange().select();
	
 }
 
function italic()
{
	if(document.selection.createRange().parentElement().name==theTextAreaName )
	{
 		document.selection.createRange().text='[i]'+document.selection.createRange().text+'[/i]';
 	}
	
 }

function underline()
{
	if(document.selection.createRange().parentElement().name==theTextAreaName )
	{
 		document.selection.createRange().text='[u]'+document.selection.createRange().text+'[/u]';
 	}
 }

function center()
{
	if(document.selection.createRange().parentElement().name==theTextAreaName )
	{
 		document.selection.createRange().text='[align=Center]'+document.selection.createRange().text+'[/align]';
 	}
	
 }
function left()
{
	if(document.selection.createRange().parentElement().name==theTextAreaName )
	{
 		document.selection.createRange().text='[align=Left]'+document.selection.createRange().text+'[/align]';
 	}
	
 }
function right()
{
	if(document.selection.createRange().parentElement().name==theTextAreaName )
	{
 		document.selection.createRange().text='[align=Right]'+document.selection.createRange().text+'[/align]';
 	}
	
 }

function fontsize(el)
 {
	var Index=el.selectedIndex
	var frontsize=el.options[Index].value
 	if(document.selection.createRange().parentElement().name==theTextAreaName )
	{
 		document.selection.createRange().text='[size='+frontsize+']'+document.selection.createRange().text+'[/size]';
 	}
  }

function fontname(el)
 {
	var Index=el.selectedIndex
 	var frontname=el.options[Index].value
 	if(document.selection.createRange().parentElement().name==theTextAreaName )
	{
 		document.selection.createRange().text='[font='+frontname+']'+document.selection.createRange		().text+'[/font]';
 	}
  }


function fontColor()
{
	
	if(document.selection.createRange().parentElement().name==theTextAreaName )
	{
		fontcolor = prompt("请输入颜色");
		if(fontcolor != null)
		{
 			document.selection.createRange().text='[color='+fontcolor+']'+document.selection.createRange().text+'[/color]';
		}
		else 
			alert("您没有输入颜色");
 	}
	
 }