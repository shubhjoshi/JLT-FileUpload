<%
'here we get some parameters passed by the DataTables using GET
sEcho = Cint(Request("sEcho"))
iDisplayLength = Cint(Request("iDisplayLength"))
iDisplayStart = Cint(Request("iDisplayStart"))
sSearch = Request("sSearch")
 
'SEARCH - here we make the Where clause that will be used in the SQL query. You only put here the fields you want to search
    strWhere = " WHERE engine LIKE '%" & sSearch & "%' OR "
    strWhere = strWhere &  " browser LIKE '%" & sSearch & "%' OR "
    strWhere = strWhere &  " platform LIKE '%" & sSearch & "%' OR "
    strWhere = strWhere &  " version LIKE '%" & sSearch & "%' OR "
    strWhere = strWhere &  " grade LIKE '%" & sSearch & "%'"
 
'ORDERING
    'passes through all cols and first check if the column is sortable, if yes then construct
    'the variable "order" that list in order the sequence of ordering
    for k=0 to 4
        if Request("bSortable_" & k)="true" then
            order = order & Request("iSortCol_" & k) & " " & Request("sSortDir_" & k)
        end if
    next
    'here we replace the number corresponding the column position by the corresponding name of the column in the database
    order = Replace(order,"0",", engine")
    order = Replace(order,"1",", browser")
    order = Replace(order,"2",", platform")
    order = Replace(order,"3",", version")
    order = Replace(order,"4",", grade")
 
    'here we eliminate the first comma of the variable "order"
    order = Right(order, Len(order)-1)
 
    'here we create the variable "strOrderBy" that will be used in the SQL query
    strOrderBy = "ORDER BY " & order
     
'here we create the connection with the database (I used Microsoft SQL Server 2008)
Set Session("objConn") = Server.CreateObject("ADODB.Connection")
strConnection = "Driver={SQL Server};Server=SQL_SERVER;Initial Catalog=DATABASE;User Id=USERNAME;Password=PASSWORD;"
Session("objConn").open strConnection
 
'here we create the SQL query using the variables "strWhere" and "strOrderBy"
SQL = "SELECT * FROM ajax " & strWhere & strOrderBy
Set rs = Session("objConn").Execute(SQL)
 
'here is counted how many records we have in the query using the search criterion and call this as "iTotalDisplayRecords"
iTotalDisplayRecords = 0
if rs.eof = false then
    do while not rs.eof
        iTotalDisplayRecords = iTotalDisplayRecords + 1
        rs.movenext
    loop
    rs.movefirst
end if
 
'here we just count how many records we have in the table, WITHOUT any search criterion and call this as "iTotalRecords"
SQL2 = "SELECT count(*) FROM ajax"
Set rs2 = Session("objConn").Execute(SQL2)
iTotalRecords = rs2(0)
'here we begin to mount the ajax reponse
%>
{"sEcho": <%=sEcho%>, "iTotalRecords": <%=iTotalRecords%>, "iTotalDisplayRecords": <%=iTotalDisplayRecords%>, "aaData": [
<% i= 0
'PAGINATION
    'First we move the recordset for the first record of the page that is being displayed in the table using the parameters(iDisplayStart)
    'then we create a loop wich the limits are the parameters (iDisplayLength) or the end of the query
 
    if rs.eof = false then
 
        rs.move(iDisplayStart)
     
        do while i < iDisplayLength and not rs.eof
         
            'we create the variable "aaData" that has the data that will be displayed. This variable is in a format known by the DataTable
            aaData = aaData + "['" & rs("engine") & "','" & rs("browser") & "','" & rs("platform") & "','" & rs("version") &  "','" & rs("grade") & "'],"
            'here we replace the single quotes by double quotes (chr(34))
            aaData = Replace(aaData,"'",chr(34))
 
            rs.movenext
 
            i=i+1
 
        loop
        'here we eliminate the last comma in the aaData
        aaData = Left(aaData,Len(aaData)-1)
 
    else
        'if the query result has no records the aaData will be empty and the Table will give an answer that no record was find
        aaData = ""
    end if
 
    'here we finishes to mount the response
    response.write aaData & "] }"
%>