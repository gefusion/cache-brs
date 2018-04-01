Class Data.Semester Extends (%Persistent, Form.Adaptor, %Populate)
{

Parameter FORMNAME = "Semester";

Parameter OBJPERMISSIONS As %String = "CRUD";

Parameter DISPLAYPROPERTY As %String = "Title";

Parameter FORMORDERBY As %String = "Title";

Property AcademicYear As Data.AcademicYear;

Property Title As %Library.TinyInt(DISPLAYNAME = "Номер семестра") [ Required ];

// Relationship Summary As Data.Summary [ Cardinality = one, Inverse = Semesters ];

// Index SummaryIndex On Summary;

Relationship Groups As Data.GroupSemester [ Cardinality = many, Inverse = Semesters ];

Storage Default
{
<Data name="SemesterDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>SemNumber</Value>
</Value>
<Value name="3">
<Value>Title</Value>
</Value>
<Value name="4">
<Value>Summary</Value>
</Value>
<Value name="5">
<Value>AcademicYear</Value>
</Value>
<Value name="6">
<Value>Groups</Value>
</Value>
</Data>
<DataLocation>^Data.SemesterD</DataLocation>
<DefaultData>SemesterDefaultData</DefaultData>
<IdLocation>^Data.SemesterD</IdLocation>
<IndexLocation>^Data.SemesterI</IndexLocation>
<StreamLocation>^Data.SemesterS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
