Class Data.Group Extends (%Persistent, Form.Adaptor, %Populate)
{

Parameter FORMNAME = "Group";

Parameter OBJPERMISSIONS As %String = "CRUD";

Parameter DISPLAYPROPERTY As %String = "Title";

Parameter FORMORDERBY As %String = "Title";

Property Title As %Library.SmallInt(DISPLAYNAME = "Номер группы") [ Required ];

Property Entrance As %Library.SmallInt(DISPLAYNAME = "Год поступления") [ Required ];

Relationship Faculty As Data.Faculty [ Cardinality = one, Inverse = Groups ];

Index FacultyIndex On Faculty;

Relationship Speciality As Data.Speciality [ Cardinality = one, Inverse = Groups ];

Index SpecialityIndex On Speciality;

// Relationship Curator As Users.Teacher [ Cardinality = one, Inverse = Groups ];

// Index CuratorIndex On Curator;

// Пока оставим Teacher.

Property Curator As Users.Teacher;

Relationship Students As Users.Student [ Cardinality = many, Inverse = Group ];

// Relationship Summary As Data.Summary [ Cardinality = one, Inverse = Groups ];

// Index SummaryIndex On Summary;

Relationship Semesters As Data.GroupSemester [ Cardinality = many, Inverse = Groups ];

Storage Default
{
<Data name="GroupDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Title</Value>
</Value>
<Value name="3">
<Value>Entrance</Value>
</Value>
<Value name="4">
<Value>Faculty</Value>
</Value>
<Value name="5">
<Value>Speciality</Value>
</Value>
<Value name="6">
<Value>Curator</Value>
</Value>
</Data>
<DataLocation>^Data.GroupD</DataLocation>
<DefaultData>GroupDefaultData</DefaultData>
<IdLocation>^Data.GroupD</IdLocation>
<IndexLocation>^Data.GroupI</IndexLocation>
<StreamLocation>^Data.GroupS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
