/// Updated at 04/04/2018 08:55:16
Class Form.REST.Object Extends Form.REST.Abstract
{

Parameter CHARSET = "UTF-8";

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
<Route Url="/:form/:id" Method="GET" Call="getFormObject"/>
<Route Url="/:form/:id/:property" Method="GET" Call="getFormObjectProperty"/>
<Route Url="/validate" Method="POST" Call="validatePassword"/>
<Route Url="/createSystemUser" Method="POST" Call="createSystemUser"/>
<Route Url="/:form" Method="POST" Call="createFormObject"/>
<Route Url="/editSystemUser/:username" Method="PUT" Call="editSystemUser"/>
<Route Url="/:form/:id" Method="PUT" Call="updateFormDynamicObject"/>
<Route Url="/:form" Method="PUT" Call="updateFormClassObject"/>
<Route Url="/deleteSystemUser/:username" Method="DELETE" Call="deleteSystemUser"/>
<Route Url="/:form/:id" Method="DELETE" Call="deleteFormObject"/>
</Routes>
}

/// Get json representation of an object by its class and id 
ClassMethod getFormObject(class As %String = "", id As %Integer = "") As %Status
{
	#dim sc As %Status = $$$OK
	set sc = ##class(Form.Info).formExistsStatus(class)
	return:$$$ISERR(sc) sc
	set sc = ..checkObjPermission(class, "R")
	return:$$$ISERR(sc) sc
	
	set sc = $classMethod(class, $$$toJSONClassMethod, id)
	
	return sc
}

/// Get value of property for object of class with id identifier. Does not open objects if possible
ClassMethod getFormObjectProperty(class As %String = "", id As %Integer = "", property As %String = "") As %Status
{
	#dim sc As %Status = $$$OK
	set sc = ##class(Form.Info).formExistsStatus(class)
	return:$$$ISERR(sc) sc
	set sc = ..checkObjPermission(class, "R")
	return:$$$ISERR(sc) sc
	
	return:'##class(%Dictionary.CompiledProperty).IDKEYExists(class, property, .propertyId) $$$ERROR($$$GeneralError, "Property '" _ property _ "' does not exists in '" _ class _ "' class")
	
	if ##class(%Dictionary.CompiledPropertyMethod).IDKEYExists(propertyId, "GetStored") {
		set value = $classMethod(class, property _ "GetStored", id)
	} else {
		 set obj = $classMethod(class, "%OpenId", id, ,.sc)
		 return:$$$ISERR(sc) sc
		 set value = $property(obj, property)
	}

	write "{""" _ property _ """:" _ $$$ZENJSUSTR(value) _ "}"
	
	return sc
}

ClassMethod validatePassword() As %Status
{
	#dim sc As %Status = $$$OK
	set obj = %request.Content
	new $namespace
	s $namespace = "%SYS"
	s pass = obj.Password
	s sc = ##class(%SYSTEM.Security).ValidatePassword(pass)
	w sc
	s $namespace = "BRS"
	return sc
}

ClassMethod createSystemUser() As %Status
{
	#dim sc As %Status = $$$OK
	set obj = %request.Content	
	if obj.Class="Security.Users"
	{
		set obj = %request.Content
		new $namespace 
		set $namespace = "%SYS" 
		set sc = ##class(Security.Users).Create(obj.Username, obj.Roles, obj.Password, "", "BRS")
		set $namespace = "BRS"
		return sc
	}
	else
	{	
		return sc
	}
}

/// �������� ������ ������� ��� ����� form (���� �� %request.Content)
/// ���������� {"Id": "�������� Id"} ��� ������
ClassMethod createFormObject(class As %String) As %Status
{
	#dim sc As %Status = $$$OK
	set sc = ##class(Form.Info).formExistsStatus(class)
	return:$$$ISERR(sc) sc
	set sc = ..checkObjPermission(class, "C")
	return:$$$ISERR(sc) sc
	
	set obj = %request.Content
	
	set objClass = $classname(obj)
	return:objClass'=class $$$ERROR("Expected instance of '" _ class _ "' class, received instance of '" _ objClass _ "'")
	set sc = obj.%Save()
	write "{""Id"": """ _ obj.%Id() _ """}"
	return sc
}

ClassMethod editSystemUser(username As %String) As %Status
{
	#dim st As %Status = $$$OK
	set obj = %request.Content	
	New $namespace
	Set $namespace = "%SYS"
	if obj.Class="Security.Users"
	{
		if obj.resetPassword=1
		{
			set st = ##class(Security.Users).%OpenId(username)
			set pw = ##class(%SYSTEM.Encryption).GenCryptToken()
			do st.PasswordSet("_temp"_pw)
			d st.%Save()
			write "{""Password"": """ _ st.Password _ """}" 
		}
		if '(obj.Password="")
		{
			set st = ##class(Security.Users).%OpenId(username)
			do st.PasswordSet(obj.Password)
			do st.%Save()
		}
		if '(obj.addRoles="")
		{
			set st = ##class(Security.Users).AddRoles(username, obj.addRoles)
		}
		if '(obj.removeRoles="")
		{
			set sc = ##class(Security.Users).Get(username, .Properties)
			set st = ##class(Security.Users).%OpenId(username)
						
			set list=$LISTFROMSTRING($Get(Properties("Roles")),",")
			set num = $Listfind(list, obj.removeRoles)
			set list = $lu(list,num,"")
			do st.Roles.RemoveAt(num)
			do st.%Save()
		}
		set $namespace = "BRS"
	}
	return st
}

/// ���������� ������� id ��� ����� form (���� �� %request.Content)
ClassMethod updateFormDynamicObject(class As %String, id As %Integer = "") As %Status
{
	#dim sc As %Status = $$$OK
	set sc = ..checkObjPermission(class, "U")
	return:$$$ISERR(sc) sc
	
	set obj = %request.Content
	if class="Data.Mark"
	{	
		// исправить JS запрос
		&sql(
			update Data.Mark
			set Attendance1 = :obj.Attendance1,
			SRS1 = :obj.SRS1,
			ModalControl1 = :obj.ModalControl1,
			Attendance2 = :obj.Attendance2,
			SRS2 = :obj.SRS2,
			ModalControl2 = :obj.ModalControl2
			where id = :id
			)
		set sc = $$$OK
	}
	else{
	set sc = $classMethod(class, $$$updateClassMethod ,id, obj)
	}
	return sc
}

/// ���������� ������� id ��� ����� form (���� �� %request.Content)
ClassMethod updateFormClassObject(class As %String) As %Status
{
	#dim sc As %Status = $$$OK
	set sc = ..checkObjPermission(class, "U")
	return:$$$ISERR(sc) sc
	
	set obj = %request.Content

	set objClass = $className(obj)
	return:objClass'=class $$$ERROR("Expected instance of '" _ class _ "' class, received instance of '" _ objClass _"'")
	
	set sc = obj.%Save()
	
	return sc
}

ClassMethod deleteSystemUser(username As %String) As %Status
{
	#dim sc As %Status = $$$OK
	set obj = %request.Content
	if obj.Class = "Security.Users"
	{
		new $namespace
		set $namespace = "%SYS"
		set sc = ##class(Security.Users).Delete(username)
		set $namespace = "BRS"
		return sc
	}
	
	return sc
}

/// �������� ������� id ��� ����� form
ClassMethod deleteFormObject(class As %String = "", id As %Integer = "") As %Status
{
	#dim sc As %Status = $$$OK
	set sc = ##class(Form.Info).formExistsStatus(class)
	return:$$$ISERR(sc) sc
	set sc = ..checkObjPermission(class, "D")
	return:$$$ISERR(sc) sc

	set sc = $classMethod(class, "%DeleteId", id)
	
	return sc
}

}
