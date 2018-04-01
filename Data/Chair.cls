Class Data.Chair Extends (%Persistent, Form.Adaptor, %Populate)
{

Parameter FORMNAME = "Chair";

Parameter OBJPERMISSIONS As %String = "CRUD";

Parameter DISPLAYPROPERTY As %String = "Title";

Parameter FORMORDERBY As %String = "Title";

Property Title As %String(DISPLAYNAME = "Название") [ Required ];

Property TitleShort As %String(DISPLAYNAME = "Сокращенное название") [ Required ];

Relationship Faculty As Data.Faculty [ Cardinality = one, Inverse = Chairs ];

Property Chief As Users.Teacher(DISPLAYNAME = "Зав. кафедры");

Index FacultyIndex On Faculty;

Relationship Subjects As Data.Subject [ Cardinality = many, Inverse = Chair ];

Relationship Teachers As Users.Teacher [ Cardinality = many, Inverse = Chair ];

Storage Default
{
<Data name="ChairDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Title</Value>
</Value>
<Value name="3">
<Value>ShortTitle</Value>
</Value>
<Value name="4">
<Value>Faculty</Value>
</Value>
<Value name="5">
<Value>TitleShort</Value>
</Value>
<Value name="6">
<Value>Chief</Value>
</Value>
</Data>
<DataLocation>^Data.ChairD</DataLocation>
<DefaultData>ChairDefaultData</DefaultData>
<IdLocation>^Data.ChairD</IdLocation>
<IndexLocation>^Data.ChairI</IndexLocation>
<StreamLocation>^Data.ChairS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
