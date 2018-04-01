Class Form.REST.Main Extends Form.REST.Abstract
{

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>

<Map Prefix="/form" Forward="Form.REST.Form"/>

<Route Url="/logout" Method="GET" Call="logout"/>
<Route Url="/test" Method="GET" Call="test"/>
<Route Url="/info" Method="GET" Call="info"/>
<Route Url="/login" Method="POST" Call="Login"/>

</Routes>
}

/// ���� � �������
ClassMethod Login() As %Status
{
	//login redirect	
	try {
      set status = ##class(%SYSTEM.Security).Login(%request.Data("Login",1), %request.Data("Password",1))
      //$$$ThrowOnError(status)
      w status
	} catch ex{
		s %response.Redirect = "/brsgui/login.CSP"
 	}
 		
	set user = $username 
	s roles = $LISTFROMSTRING($roles)
 	
 	if $listlength(roles)>3
 	{
	 	s %response.Redirect = "/brsgui/redirect.CSP"
	 	quit status
	}
	else
	{
 		//w $System.Status.GetErrorText(%objlasterror)
		
		if ##class(Utils.Security).CheckUserPermission(user, "Student", "U")=1 {
			s %response.Redirect = "/brsgui/users/student.CSP"
			s status = 1
		}
		elseif ##class(Utils.Security).CheckUserPermission(user, "Teacher", "U")=1 {
			s %response.Redirect = "/brsgui/users/teacher.CSP"
			s status = 1
		}
		elseif ##class(Utils.Security).CheckUserPermission(user, "Administrator", "U")=1 {
			s %response.Redirect = "/brsgui/users/admin.CSP"
			s status = 1
		}
		elseif ##class(Utils.Security).CheckUserPermission(user, "Deanery", "U")=1 {
			s %response.Redirect = "/brsgui/users/deaneryWorker.CSP"
			s status = 1
		}
		elseif ##class(Utils.Security).CheckUserPermission(user, "Chair", "U")=1 {
			s %response.Redirect = "/brsgui/users/chairWorker.CSP"
			s status = 1
		}
		elseif ##class(Utils.Security).CheckUserPermission(user, "Curator", "U")=1 {
			s %response.Redirect = "/brsgui/users/curator.CSP"
			s status = 1
		}
	
	}
	quit status
}

/// ����� �� �������
ClassMethod logout() As %Status
{
    #dim %session As %CSP.Session
    set st = %session.Logout(1)
    set %session.EndSession = 1
    s %response.Redirect = "/brsgui/login.CSP"
    return st
}

/// �������� �����
ClassMethod test() As %Status
{
    write "{""Status"": ""OK""}"
    return $$$OK
}

ClassMethod info() As %Status
{
	set info = {}
	set info.languages = ##class(Form.Util.Translate).getLanguages()
	write info.%ToJSON()	
	quit $$$OK
}

}
