Class Users.Admin Extends (%Persistent, Form.Adaptor)
{

Property Person As Users.Person;

Parameter FORMNAME = "Admin";

Parameter OBJPERMISSIONS As %String = "CRUD";

Parameter DISPLAYPROPERTY As %String = "Person";

Parameter FORMORDERBY As %String = "Person";

Storage Default
{
<Data name="AdminDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Login</Value>
</Value>
<Value name="3">
<Value>Surname</Value>
</Value>
<Value name="4">
<Value>Name</Value>
</Value>
<Value name="5">
<Value>Patronymic</Value>
</Value>
<Value name="6">
<Value>surname</Value>
</Value>
<Value name="7">
<Value>name</Value>
</Value>
<Value name="8">
<Value>patronymic</Value>
</Value>
<Value name="9">
<Value>login</Value>
</Value>
<Value name="10">
<Value>User</Value>
</Value>
<Value name="11">
<Value>UserID</Value>
</Value>
<Value name="12">
<Value>Person</Value>
</Value>
</Data>
<DataLocation>^Admin.PersonD</DataLocation>
<DefaultData>AdminDefaultData</DefaultData>
<IdLocation>^Users.AdminD</IdLocation>
<IndexLocation>^Users.AdminI</IndexLocation>
<StreamLocation>^Users.AdminS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
