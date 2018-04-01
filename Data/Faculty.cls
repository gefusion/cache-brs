Class Data.Faculty Extends (%Persistent, Form.Adaptor, %Populate)
{

Parameter FORMNAME = "Faculty";

Parameter OBJPERMISSIONS As %String = "CRUD";

Parameter DISPLAYPROPERTY As %String = "Title";

Parameter FORMORDERBY As %String = "Title";

Property Title As %String(DISPLAYNAME = "Название") [ Required ];

Property TitleShort As %String(DISPLAYNAME = "Сокращенное название") [ Required ];

Property Dean As Users.Person(DISPLAYNAME = "Декан");

Relationship Chairs As Data.Chair [ Cardinality = many, Inverse = Faculty ];

Relationship Specialities As Data.Speciality [ Cardinality = many, Inverse = Faculty ];

Relationship Groups As Data.Group [ Cardinality = many, Inverse = Faculty ];

Storage Default
{
<Data name="FacultyDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>FacultyName</Value>
</Value>
<Value name="3">
<Value>FacultyShort</Value>
</Value>
<Value name="4">
<Value>Title</Value>
</Value>
<Value name="5">
<Value>ShortTitle</Value>
</Value>
<Value name="6">
<Value>TitleShort</Value>
</Value>
<Value name="7">
<Value>Dean</Value>
</Value>
</Data>
<DataLocation>^Data.FacultyD</DataLocation>
<DefaultData>FacultyDefaultData</DefaultData>
<IdLocation>^Data.FacultyD</IdLocation>
<IndexLocation>^Data.FacultyI</IndexLocation>
<StreamLocation>^Data.FacultyS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
