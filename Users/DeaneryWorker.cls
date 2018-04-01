Class Users.DeaneryWorker Extends (%Persistent, Form.Adaptor)
{

// Property Person As %SYSTEM.Security.Users;

Parameter FORMNAME = "DeaneryWorker";

Parameter OBJPERMISSIONS As %String = "CRUD";

Parameter DISPLAYPROPERTY As %String = "Person";

Parameter FORMORDERBY As %String = "Person";

Property Person As Users.Person;

Property Faculty As Data.Faculty;

Storage Default
{
<Data name="DeaneryWorkerDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Faculty</Value>
</Value>
<Value name="3">
<Value>Surname</Value>
</Value>
<Value name="4">
<Value>Name</Value>
</Value>
<Value name="5">
<Value>LoPatronymicin</Value>
</Value>
<Value name="6">
<Value>Login</Value>
</Value>
<Value name="7">
<Value>Patronymic</Value>
</Value>
<Value name="8">
<Value>surname</Value>
</Value>
<Value name="9">
<Value>name</Value>
</Value>
<Value name="10">
<Value>patronymic</Value>
</Value>
<Value name="11">
<Value>login</Value>
</Value>
<Value name="12">
<Value>faculty</Value>
</Value>
<Value name="13">
<Value>User</Value>
</Value>
<Value name="14">
<Value>UserID</Value>
</Value>
<Value name="15">
<Value>Person</Value>
</Value>
<Value name="16">
<Value>Username</Value>
</Value>
</Data>
<DataLocation>^Users.DeaneryWorkerD</DataLocation>
<DefaultData>DeaneryWorkerDefaultData</DefaultData>
<IdLocation>^Users.DeaneryWorkerD</IdLocation>
<IndexLocation>^Users.DeaneryWorkerI</IndexLocation>
<StreamLocation>^Users.DeaneryWorkerS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
