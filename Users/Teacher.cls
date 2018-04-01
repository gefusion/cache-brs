Class Users.Teacher Extends (%Persistent, Form.Adaptor)
{

// Property Person As %SYSTEM.Security.Users;

Parameter FORMNAME = "Teacher";

Parameter OBJPERMISSIONS As %String = "CRUD";

Parameter DISPLAYPROPERTY As %String = "Person";

Parameter FORMORDERBY As %String = "Person";

Property Person As Users.Person;

// перевернута связь 10.10.17

Relationship Subjects As Data.SubjectTeacher [ Cardinality = many, Inverse = Teachers ];

Relationship Chair As Data.Chair [ Cardinality = one, Inverse = Teachers ];

Index ChairIndex On Chair;

Storage Default
{
<Data name="TeacherDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Subjects</Value>
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
<Value>Chair</Value>
</Value>
<Value name="7">
<Value>Login</Value>
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
<Value name="16">
<Value>Group</Value>
</Value>
</Data>
<DataLocation>^Users.TeacherD</DataLocation>
<DefaultData>TeacherDefaultData</DefaultData>
<IdLocation>^Users.TeacherD</IdLocation>
<IndexLocation>^Users.TeacherI</IndexLocation>
<StreamLocation>^Users.TeacherS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
