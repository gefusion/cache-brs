Class Data.SubjectTeacher Extends (%Persistent, Form.Adaptor, %Populate)
{

// перевернута связь

Relationship Subjects As Data.Subject [ Cardinality = one, Inverse = Teachers ];

// Index SubjectsIndex On Subjects;

Relationship Teachers As Users.Teacher [ Cardinality = one, Inverse = Subjects ];

// Index TeachersIndex On Teachers;

Storage Default
{
<Data name="SubjectTeacherDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Subjects</Value>
</Value>
<Value name="3">
<Value>Teachers</Value>
</Value>
</Data>
<DataLocation>^Data.SubjectTeacherD</DataLocation>
<DefaultData>SubjectTeacherDefaultData</DefaultData>
<IdLocation>^Data.SubjectTeacherD</IdLocation>
<IndexLocation>^Data.SubjectTeacherI</IndexLocation>
<StreamLocation>^Data.SubjectTeacherS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
