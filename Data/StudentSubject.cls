Class Data.StudentSubject Extends (%Persistent, Form.Adaptor, %Populate)
{

Relationship Student As Users.Student [ Cardinality = one, Inverse = StudentSubjects ];

Relationship SubjectSemester As Data.SubjectSemester [ Cardinality = one, Inverse = StudentSubjects ];

Storage Default
{
<Data name="StudentSubjectDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Student</Value>
</Value>
<Value name="3">
<Value>SubjectSemester</Value>
</Value>
</Data>
<DataLocation>^Data.StudentSubjectD</DataLocation>
<DefaultData>StudentSubjectDefaultData</DefaultData>
<IdLocation>^Data.StudentSubjectD</IdLocation>
<IndexLocation>^Data.StudentSubjectI</IndexLocation>
<StreamLocation>^Data.StudentSubjectS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
