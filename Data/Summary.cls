Class Data.Summary Extends (%Persistent, Form.Adaptor, %Populate)
{

Parameter FORMNAME = "Summary";

Parameter OBJPERMISSIONS As %String = "CRUD";

Parameter DISPLAYPROPERTY As %String = "Marks";

Parameter FORMORDERBY As %String = "Marks";

Property Marks As Data.Mark;

/*

Relationship Students As Users.Student [ Cardinality = many, Inverse = Summary ];

Relationship Subjects As Data.Subject [ Cardinality = many, Inverse = Summary ];

Relationship AcademicYears As Data.AcademicYear [ Cardinality = many, Inverse = Summary ];

Relationship Semesters As Data.Semester [ Cardinality = many, Inverse = Summary ];

Relationship Groups As Data.Group [ Cardinality = many, Inverse = Summary ];
*/
Storage Default
{
<Data name="SummaryDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Students</Value>
</Value>
<Value name="3">
<Value>Subjects</Value>
</Value>
<Value name="4">
<Value>FirstPart</Value>
</Value>
<Value name="5">
<Value>SecondPart</Value>
</Value>
<Value name="6">
<Value>Average</Value>
</Value>
<Value name="7">
<Value>StudentSubject</Value>
</Value>
<Value name="8">
<Value>Marks</Value>
</Value>
</Data>
<DataLocation>^Data.SummaryD</DataLocation>
<DefaultData>SummaryDefaultData</DefaultData>
<IdLocation>^Data.SummaryD</IdLocation>
<IndexLocation>^Data.SummaryI</IndexLocation>
<StreamLocation>^Data.SummaryS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
