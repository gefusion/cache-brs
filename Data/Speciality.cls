Class Data.Speciality Extends (%Persistent, Form.Adaptor, %Populate)
{

Parameter FORMNAME = "Speciality";

Parameter OBJPERMISSIONS As %String = "CRUD";

Parameter DISPLAYPROPERTY As %String = "Title";

Parameter FORMORDERBY As %String = "Title";

Property Title As %String(DISPLAYNAME = "Специальность") [ Required ];

Property Code As %String(DISPLAYNAME = "Код") [ Required ];

Relationship Faculty As Data.Faculty [ Cardinality = one, Inverse = Specialities ];

Index FacultyIndex On Faculty;

// Relationship Subjects As Data.SubjectSpeciality [ Cardinality = one, Inverse = Specialities ];

// Index SubjectsIndex On Subjects;

Relationship Groups As Data.Group [ Cardinality = many, Inverse = Speciality ];

Storage Default
{
<Data name="SpecialityDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Title</Value>
</Value>
<Value name="3">
<Value>Code</Value>
</Value>
<Value name="4">
<Value>Faculty</Value>
</Value>
<Value name="5">
<Value>Subjects</Value>
</Value>
</Data>
<DataLocation>^Data.SpecialityD</DataLocation>
<DefaultData>SpecialityDefaultData</DefaultData>
<ExtentSize>10</ExtentSize>
<IdLocation>^Data.SpecialityD</IdLocation>
<IndexLocation>^Data.SpecialityI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>1</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>1.1</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="Code">
<AverageFieldSize>4.8</AverageFieldSize>
<Selectivity>10.0000%</Selectivity>
</Property>
<Property name="Faculty">
<AverageFieldSize>1</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="Subjects">
<AverageFieldSize>1</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="Title">
<AverageFieldSize>21.1</AverageFieldSize>
<Selectivity>11.1111%</Selectivity>
</Property>
<SQLMap name="FacultyIndex">
<BlockCount>-4</BlockCount>
</SQLMap>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<SQLMap name="SubjectsIndex">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^Data.SpecialityS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
