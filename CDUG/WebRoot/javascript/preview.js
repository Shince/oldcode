var xmlHttp = new XMLHttpRequest();
/* Create a new XMLHttpRequest object to talk to the Web server */
var xmlHttp = false;
/*@cc_on @*/
/*@if (@_jscript_version >= 5)
try {
  xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
} catch (e) {
  try {
    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
  } catch (e2) {
    xmlHttp = false;
  }
}
@end @*/
if (!xmlHttp && typeof XMLHttpRequest != 'undefined') {
  xmlHttp = new XMLHttpRequest();
}
function callServer() {
  // Get the city and state from the web form
  var title = document.getElementById("title").value;
  var text = document.getElementById("text").value;
  // Only go on if there are values for both fields
  if ((title == null) || (title == "")) return;
  if ((text == null) || (text == "")) return;
  // Build the URL to connect to
  var url = 'preview.jsp?&title='+escape(title)+'&text='+escape(text)+'&tag=news&useraccess='+escape(useraccess);
  // Open a connection to the server
  xmlHttp.open("GET", url, true);
  // Setup a function for the server to run when it's done
  xmlHttp.onreadystatechange = updatePage;
  // Send the request
  xmlHttp.send(null);
}
function updatePage() {
  if (xmlHttp.readyState == 4) {
    var response = xmlHttp.responseText;
    document.getElementById("zipCode").value = response;
  }
}
