<HTML>
<HEAD>
<SCRIPT>
var url_page = "http://www.yoursite.com/asppage.asp"; //Change the URL and try
</SCRIPT>
</HEAD>
<BODY ONLOAD="location.href = url_page;">
Please wait while the page is loading.....
<SCRIPT>
if (document.layers)
document.write('<LAYER SRC="' + url + 
'" VISIBILITY="hide"><\/LAYER>');
else if (document.all || document.getElementById)
document.write('<IFRAME SRC="' + url + 
'" STYLE="visibility: hidden;"><\/IFRAME>');
else location.href = url;
</SCRIPT>
</BODY>
</HTML>