<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content="text/html; charset=unicode" http-equiv=Content-Type>
<META content="MSHTML 5.00.3207.2500" name=GENERATOR></HEAD>
<BODY>

<FORM method=post action="TestVCal.asp" name="VCal">
<pre>
<P align=center><FONT face=Verdana size=4>
    <STRONG>VCalendar Test Page</STRONG></FONT></P>
<%
    Dim DTStart, DTEnd, Subject, Location
    Dim Description, OutputFilePath
    Dim fMissingCriticalData, strMsg, Pass

	DTStart = Request.Form("DTStart")
	DTEnd = Request.Form("DTEnd") 
	Subject = Request.Form("Subject")
	Location = Request.Form("Location")
	Description = Request.Form("Description")
	OutputFilePath = Request.Form("OutputFilePath")
	Pass = Request.Form("Pass")
	
    fMissingCriticalData=0
	strMsg = ""
    
    ' Put some default values in input boxes
	If Len(Subject) = 0 Then Subject = "Undetermined"
	If Len(Location) = 0 Then Location = "Undetermined"
	If Len(Description) = 0 Then Description = "Undetermined"
	If Len(OutputFilePath) = 0 Then  OutputFilePath ="C:\"
	If Len(Pass) = 0 Then Pass = 0

	If Pass > 0 Then
	    If Len(DTStart)= 0 OR Not IsDate(DTStart) Then 
		fMissingCriticalData=1
		strMsg = strMsg & "<Font color=red>Missing valid start date and time.</Font><BR>"
	    End If
	
	    If Len(DTEnd)= 0 OR Not IsDate(DTEnd) Then 
		fMissingCriticalData=1
		strMsg = strMsg & "<Font color=red>Missing valid end date and time.</Font><BR>"
	    End If
	
	Else
	    strMsg = "<B>Provide the following information to create the appointment item.</b>"
	End If
	
	If fMissingCriticalData=1 or pass=0 Then 
		Response.Write(strMsg)
%>
		<BR>
		<FONT face=Veranda size=3>
			<INPUT id=txtPass name=Pass style="VISIBILITY: hidden" value="<%=Pass + 1%>">
			
		<TABLE Border=0 align=center>
		  <TBODY>
		  <tr>
		     <td>Start Date and Time:</td>
		     <td><INPUT align=right id=txtDTStart name=DTStart value=<%=DTStart%>></td>
		     <td>(Format:  mm/dd/yy hh:nn am/pm)</td>
		  </tr>
		  <tr>
		     <td>End Date and Time:</td>
		     <td><INPUT align=right id=txtDTEnd name=DTEnd value=<%=DTEnd%>></td>
		     <td>(Format:  mm/dd/yy hh:nn am/pm)</td>
		  </tr>
		  <tr>
		     <td>Subject:</td>
		     <td><INPUT align=right id=txtSubject name=Subject value=<%=Subject%>></td>
		     <td></td>
		  </tr>
		  <tr>
		     <td>Location:</td>
		     <td><INPUT align=right id=txtLocation name=Location value=<%=Location%>></td>
		     <td></td>
		  </tr>
		  <tr>
		     <td>Description:</td>
		     <td><INPUT align=right id=txtDescription name=Description value=<%=Description%>></td>
		     <td></td>
		  </tr>
		  <tr>
		     <td>Output File Path:</td>
		     <td><INPUT align=right id=txtOutputFilePath name=OutputFilePath value=<%=OutputFilePath%>></td>
		     <td></td>
		  </tr>
		  <tr>
		     <td></td>
		     <td><INPUT id=submit1 name=submit1 type=submit value=Submit></td>
		     <td><INPUT id=reset1 name=reset1 type=reset value=Reset></td>
		  </tr>

		</TBODY>
		</FONT>
		</TABLE>
	  
<%

	Else
		If Len(Subject) = 0 Then Subject = "(No Subject Given)"
		If Len(Location) = 0 Then Location = "(No Location Given)"
		If Len(Description) = 0 Then Description = "(No Description Given)"
	
		Dim objVCal, VCalFile
		Set objVcal = Server.CreateObject("VCalWrap.ApptItem")

		With objVCal
			.DTStart = DTStart
			.DTEnd = DTEnd
			.Subject = Subject
			.Location = Location
			.Description = Description
			.OutputFilePath = OutputFilePath
			.TimeZoneBias = -7
			.CreateVCSEvent
			VCalFile = .VCalFile
		End With
		Response.Redirect(VCalFile)

	End If

%>
</Pre>
</FORM>
</BODY></HTML>
