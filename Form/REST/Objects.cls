/// Broker class to work with queries
Class Form.REST.Objects Extends Form.REST.Abstract
{

/// Query to return all availible information about form objects
Parameter ALL = "*, %CLASSNAME AS _class";

/// Query to return objects count
Parameter COUNT = "count(1) ""count""";

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
<Route Url="/:form/custom/:query" Method="GET" Call="getFormObjectsCustom"/>
<Route Url="/:form/:query" Method="GET" Call="getFormObjects"/>
</Routes>
}

/// Get all form objects
ClassMethod getFormObjects(class As %String = "", queryType As %String) As %Status
{
	#dim sc As %Status = $$$OK
	set sc = ##class(Form.Info).formExistsStatus(class)
	return:$$$ISERR(sc) sc
	set sc = ..checkObjPermission(class, "R")
	return:$$$ISERR(sc) sc
	set sc = ..getBaseQuery(queryType, class, .queryBase)
	return:$$$ISERR(sc) sc	
	
	set table = ##class(%CSP.UI.Portal.SQL.Home).Quoter2($$$ClassSQLTable(class))
	set sql = queryBase _ table
	
	set sc = ##class(Form.JSON.SQL).WriteJSONFromSQL(sql, class)
	return sc
}

/// Returns the part between SELECT and FORM (queryBase) based on queryType and target class
/// Supported queryBase sources:<br>
/// 1. Uppercase parameter values defined in this class<br>
/// 2. ClassMethods, defined in this class with the name: queryQUERYTYPE
ClassMethod getBaseQuery(queryType As %String, class As %String, Output queryBase As %String) As %Status
{
	set queryBase = ""
	set queryType = $ZCVT(queryType, "U")
	set userQueryClass = ##class(Form.Settings).getSetting("queryclass")
	#dim sc As %Status = $$$OK
	if ##class(%Dictionary.MethodDefinition).IDKEYExists(class, "query" _ queryType) {
		set queryBase = $classmethod(class, "query" _ queryType)
	} elseif ((userQueryClass'="") && (##class(%Dictionary.ParameterDefinition).IDKEYExists(userQueryClass, queryType))) {
		set queryBase = $parameter(userQueryClass, queryType)
	} elseif ((userQueryClass'="") && (##class(%Dictionary.MethodDefinition).IDKEYExists(userQueryClass, "query" _ queryType))) {
		set queryBase = $classmethod(userQueryClass, "query" _ queryType, class)
	} elseif ##class(%Dictionary.ParameterDefinition).IDKEYExists($classname(), queryType) {
		set queryBase = $parameter(, queryType)
	} elseif ##class(%Dictionary.MethodDefinition).IDKEYExists($classname(), "query" _ queryType) {
		set queryBase = $classmethod(, "query" _ queryType, class)
	} elseif 0 {
		/// TODO Some other type of "get stuff between SELECT and FROM"
	} else {
		set sc = $$$ERROR($$$GeneralError, "Query type " _ queryType _ " not found")		
	}
	
	if (queryBase'="") {
		set queryBase = "SELECT " _ queryBase _ " FROM "
	}
	
	return sc
}

/// Return id and dislpayName
/// <example>w ##class(Form.REST.Objects).queryINFO("Form.Test.Simple")</example>
ClassMethod queryINFO(class As %String) As %String
{
	set method = "getObjectDisplayName"
	
	if ##class(%Dictionary.MethodDefinition).IDKEYExists(class, method) {
		set sqlProc = $$$ClassSQLTable(class) _ "_" _ method _ "(id)"
	} else {
		set sqlProc = $parameter(class, $$$displayProp)
	}
	
	set queryBase = "id AS _id, " _ sqlProc _ " As displayName"
	return queryBase
}

/// Return id, dislpayName and class
/// <example>w ##class(Form.REST.Objects).queryINFOCLASS("Form.Test.Simple")</example>
ClassMethod queryINFOCLASS(class As %String) As %String
{
	set queryBase = ..queryINFO(class) _ ", %CLASSNAME AS _class "
	return queryBase
}

ClassMethod queryCURATOR(class As %String) As %String
{
	set queryBase = "Person->Surname,Person->Name,Person->Patronymic,Person->Username, ""Group""->Title"
	return queryBase
}

ClassMethod queryGROUPLIST(class As %String) As %String
{
	set queryBase = """Group""->Curator->Person->Username,Surname, Name, Patronymic, ""Group""->Title As ""Group"""
	return queryBase
}

ClassMethod queryBRS(class As %String) As %String
{
	set queryBase = "ID,StudentSubject,StudentSubject->ID As StudSubjID,StudentSubject->Student->ID As StudID,StudentSubject->Student->Username,StudentSubject->Student->Surname,StudentSubject->Student->Name,StudentSubject->Student->Patronymic, StudentSubject->SubjectSemester->Subjects->Subjects->Title As Subject,StudentSubject->SubjectSemester->GroupSemesters->Semesters->AcademicYear->YearTitle As AcademicYear,StudentSubject->SubjectSemester->GroupSemesters->Semesters->Title As Semester,Attendance1,SRS1,ModalControl1,Attendance2,SRS2,ModalControl2, StudentSubject->SubjectSemester->Subjects->Teachers->Person->Surname As TSurname,StudentSubject->SubjectSemester->Subjects->Teachers->Person->Name As TName,StudentSubject->SubjectSemester->Subjects->Teachers->Person->Patronymic As TPatronymic"
	return queryBase
}

ClassMethod queryDW(class As %String) As %String
{
	set queryBase = "ID,Faculty->TitleShort As Faculty,Person->Username,Person->Name,Person->Surname,Person->Patronymic"
	return queryBase
}

ClassMethod queryCW(class As %String) As %String
{
	set queryBase = "ID,Chair->ID As Chair, Chair->TitleShort As ChairTitle,Person->Username,Person->Name,Person->Surname,Person->Patronymic"
	return queryBase
}

ClassMethod queryFACULTIES(class As %String) As %String
{
	set queryBase = "ID,Title,TitleShort,Dean->FullName As Dean,Dean->ID As DeanID"
	return queryBase
}

ClassMethod queryGROUPS(class As %String) As %String
{
	set queryBase = "Curator->Person->Surname As Curator,Entrance,Title,Speciality->Code"
	return queryBase
}

ClassMethod queryCHAIRS(class As %String) As %String
{
	set queryBase = "ID,Title,TitleShort,Chief->Person->Surname As Chief, Faculty->Title As Faculty"
	return queryBase
}

ClassMethod querySEMESTERS(class As %String) As %String
{
	set queryBase = "ID,Title,AcademicYear->YearTitle"
	return queryBase
}

ClassMethod queryDEANSLIST(class As %String) As %String
{
	set queryBase = "ID, Surname, Name, Patronymic"
	return queryBase
}

/// Get form objects by a custom query
ClassMethod getFormObjectsCustom(class As %String = "", queryType As %String) As %Status
{
	#dim sc As %Status = $$$OK
	set sc = ##class(Form.Info).formExistsStatus(class)
	return:$$$ISERR(sc) sc
	set sc = ..checkObjPermission(class, "R")
	return:$$$ISERR(sc) sc
	
	set queryType = $ZCVT(queryType, "U")
		
	if ##class(%Dictionary.MethodDefinition).IDKEYExists(class, "customquery" _ queryType) {
		set sql = $classmethod(class, "customquery" _ queryType)
	} else {
		set sc = $$$ERROR($$$GeneralError, "Custom query type " _ queryType _ " not found")
	}
	
	return:$$$ISERR(sc) sc	
	
	set sc = ##class(Form.JSON.SQL).WriteJSONFromSQL(sql)
	return sc
}

}
