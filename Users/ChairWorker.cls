Class Users.ChairWorker Extends (%Persistent, Form.Adaptor)
{

Parameter FORMNAME = "ChairWorker";

Parameter OBJPERMISSIONS As %String = "CRUD";

Parameter DISPLAYPROPERTY As %String = "Person";

Parameter FORMORDERBY As %String = "Person";

Property Person As Users.Person;

Property Chair As Data.Chair [ Required ];

Storage Default
{
<Data name="ChairWorkerDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Chair</Value>
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
<Value>Login</Value>
</Value>
<Value name="7">
<Value>surname</Value>
</Value>
<Value name="8">
<Value>name</Value>
</Value>
<Value name="9">
<Value>patronymic</Value>
</Value>
<Value name="10">
<Value>login</Value>
</Value>
<Value name="11">
<Value>chair</Value>
</Value>
<Value name="12">
<Value>User</Value>
</Value>
<Value name="13">
<Value>UserID</Value>
</Value>
<Value name="14">
<Value>Person</Value>
</Value>
<Value name="15">
<Value>Username</Value>
</Value>
</Data>
<DataLocation>^Users.ChairWorkerD</DataLocation>
<DefaultData>ChairWorkerDefaultData</DefaultData>
<IdLocation>^Users.ChairWorkerD</IdLocation>
<IndexLocation>^Users.ChairWorkerI</IndexLocation>
<StreamLocation>^Users.ChairWorkerS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
