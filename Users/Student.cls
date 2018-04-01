Class Users.Student Extends (%Persistent, Form.Adaptor)
{

Parameter FORMNAME = "Student";

Parameter OBJPERMISSIONS As %String = "CRUD";

Parameter DISPLAYPROPERTY As %String = "Username";

Parameter FORMORDERBY As %String = "Username";

Property Username As %String(DISPLAYNAME = "Пользователь") [ Required ];

Property Name As %String(DISPLAYNAME = "Имя") [ Required ];

Property Surname As %String(DISPLAYNAME = "Фамилия") [ Required ];

Property Patronymic As %String(DISPLAYNAME = "Отчество");

Relationship Group As Data.Group [ Cardinality = one, Inverse = Students ];

Index GroupIndex On Group;

Relationship StudentSubjects As Data.StudentSubject [ Cardinality = many, Inverse = Student ];

Storage Default
{
<Data name="StudentDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="3">
<Value>StudentID</Value>
</Value>
<Value name="7">
<Value>Group</Value>
</Value>
<Value name="8">
<Value>Summary</Value>
</Value>
<Value name="14">
<Value>UserID</Value>
</Value>
<Value name="15">
<Value>Person</Value>
</Value>
<Value name="16">
<Value>Student</Value>
</Value>
<Value name="17">
<Value>User</Value>
</Value>
<Value name="18">
<Value>Name</Value>
</Value>
<Value name="19">
<Value>Surname</Value>
</Value>
<Value name="20">
<Value>Patronymic</Value>
</Value>
<Value name="21">
<Value>Username</Value>
</Value>
<Value name="22">
<Value>user</Value>
</Value>
</Data>
<DataLocation>^Users.StudentD</DataLocation>
<DefaultData>StudentDefaultData</DefaultData>
<IdLocation>^Users.StudentD</IdLocation>
<IndexLocation>^Users.StudentI</IndexLocation>
<StreamLocation>^Users.StudentS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
