Class Data.SubjectSemester Extends (%Persistent, Form.Adaptor, %Populate)
{

Property Subjects As Data.SubjectTeacher;

Relationship GroupSemesters As Data.GroupSemester [ Cardinality = one, Inverse = SubjectSemesters ];

// Relationship Subjects As Data.Subject [ Cardinality = many, Inverse = SubjectSemester ];

Relationship StudentSubjects As Data.StudentSubject [ Cardinality = many, Inverse = SubjectSemester ];

Storage Default
{
<Data name="SubjectSemesterDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>GroupSemesters</Value>
</Value>
<Value name="3">
<Value>Subjects</Value>
</Value>
</Data>
<DataLocation>^Data.SubjectSemesterD</DataLocation>
<DefaultData>SubjectSemesterDefaultData</DefaultData>
<IdLocation>^Data.SubjectSemesterD</IdLocation>
<IndexLocation>^Data.SubjectSemesterI</IndexLocation>
<StreamLocation>^Data.SubjectSemesterS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
