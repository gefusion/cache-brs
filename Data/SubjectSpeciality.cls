Class Data.SubjectSpeciality Extends (%Persistent, Form.Adaptor, %Populate)
{

// Relationship Subjects As Data.Subject [ Cardinality = many, Inverse = Specialities ];

// Relationship Specialities As Data.Speciality [ Cardinality = many, Inverse = Specialities ];

Storage Default
{
<Data name="SubjectSpecialityDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
</Data>
<DataLocation>^Data.SubjectSpecialityD</DataLocation>
<DefaultData>SubjectSpecialityDefaultData</DefaultData>
<IdLocation>^Data.SubjectSpecialityD</IdLocation>
<IndexLocation>^Data.SubjectSpecialityI</IndexLocation>
<StreamLocation>^Data.SubjectSpecialityS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
