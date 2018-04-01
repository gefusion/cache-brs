Class Utils.RedirectPage Extends %CSP.Page
{

ClassMethod OnPreHTTP() As %Boolean
{
	#dim %request As %CSP.Request
	#dim %response As %CSP.Response
	set %response.Redirect = "http://ya.ru"
	quit $$$YES
}

}
