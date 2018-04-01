Class Data.GroupSemester Extends (%Persistent, Form.Adaptor, %Populate)
{

Relationship Semesters As Data.Semester [ Cardinality = one, Inverse = Groups ];

Relationship Groups As Data.Group [ Cardinality = one, Inverse = Semesters ];

Relationship SubjectSemesters As Data.SubjectSemester [ Cardinality = many, Inverse = GroupSemesters ];

Storage Default
{
<Data name="GroupSemesterDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Semesters</Value>
</Value>
<Value name="3">
<Value>Groups</Value>
</Value>
<Value name="4">
<Value>Subjects</Value>
</Value>
<Value name="5">
<Value>SubjectSemesters</Value>
</Value>
</Data>
<DataLocation>^Data.GroupSemesterD</DataLocation>
<DefaultData>GroupSemesterDefaultData</DefaultData>
<IdLocation>^Data.GroupSemesterD</IdLocation>
<IndexLocation>^Data.GroupSemesterI</IndexLocation>
<StreamLocation>^Data.GroupSemesterS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
