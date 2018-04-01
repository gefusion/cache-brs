Class Data.Root Extends %CSP.REST
{

XData UrlMap
{
<Routes>
	<Route Url="/brsgui" Method="GET" Call="root"/>
	<Route Url="/reg" Method="POST" Call="CreateStudent"/>
</Routes>
}

ClassMethod root() As %Status
{
   
    write "{""Status"": ""OK""}"
    return $$$OK
}

}
