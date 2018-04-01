/// Updated at 03/31/2018 19:12:38
Class Users.Person Extends (%Persistent, Form.Adaptor)
{

Parameter FORMNAME = "Person";

Parameter OBJPERMISSIONS As %String = "CRUD";

Parameter DISPLAYPROPERTY As %String = "Username";

Parameter FORMORDERBY As %String = "Username";

Property Username As %String(DISPLAYNAME = "Пользователь") [ Required ];

Index UsernameIDX On Username [ Unique ];

Property Name As %String(DISPLAYNAME = "Имя") [ Required ];

Property Surname As %String(DISPLAYNAME = "Фамилия") [ Required ];

Property Patronymic As %String(DISPLAYNAME = "Отчество");

Property FullName As %String(DISPLAYNAME = "Полное имя") [ Required ];

Storage Default
{
<Data name="PersonDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Username</Value>
</Value>
<Value name="3">
<Value>Name</Value>
</Value>
<Value name="4">
<Value>Surname</Value>
</Value>
<Value name="5">
<Value>Patronymic</Value>
</Value>
<Value name="6">
<Value>Password</Value>
</Value>
<Value name="7">
<Value>Role</Value>
</Value>
<Value name="8">
<Value>Id</Value>
</Value>
<Value name="9">
<Value>Roles</Value>
</Value>
<Value name="10">
<Value>FullName</Value>
</Value>
</Data>
<DataLocation>^Users.PersonD</DataLocation>
<DefaultData>PersonDefaultData</DefaultData>
<IdLocation>^Users.PersonD</IdLocation>
<IndexLocation>^Users.PersonI</IndexLocation>
<StreamLocation>^Users.PersonS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
