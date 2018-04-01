Class Data.Subject Extends (%Persistent, Form.Adaptor, %Populate)
{

Parameter FORMNAME = "Subject";

Parameter OBJPERMISSIONS As %String = "CRUD";

Parameter DISPLAYPROPERTY As %String = "Title";

Parameter FORMORDERBY As %String = "Title";

Property Title As %String(DISPLAYNAME = "Предмет") [ Required ];

// Relationship Specialities As Data.SubjectSpeciality [ Cardinality = one, Inverse = Subjects ];

// Index SpecialitiesIndex On Specialities;

Relationship Chair As Data.Chair [ Cardinality = one, Inverse = Subjects ];

Index ChairIndex On Chair;

// связь перевернута

Relationship Teachers As Data.SubjectTeacher [ Cardinality = many, Inverse = Subjects ];

// Relationship SubjectSemester As Data.SubjectSemester [ Cardinality = one, Inverse = Subjects ];

// Relationship Summary As Data.Summary [ Cardinality = one, Inverse = Subjects ];

// Index SummaryIndex On Summary;

Storage Default
{
<Data name="SubjectDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>SubjectName</Value>
</Value>
<Value name="3">
<Value>Title</Value>
</Value>
<Value name="4">
<Value>Specialities</Value>
</Value>
<Value name="5">
<Value>Chair</Value>
</Value>
<Value name="6">
<Value>Teachers</Value>
</Value>
<Value name="7">
<Value>Summary</Value>
</Value>
<Value name="8">
<Value>GroupSemesters</Value>
</Value>
<Value name="9">
<Value>SubjectSemester</Value>
</Value>
</Data>
<DataLocation>^Data.SubjectD</DataLocation>
<DefaultData>SubjectDefaultData</DefaultData>
<ExtentSize>10</ExtentSize>
<IdLocation>^Data.SubjectD</IdLocation>
<IndexLocation>^Data.SubjectI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>1</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>1.1</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="Chair">
<AverageFieldSize>1</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="Specialities">
<AverageFieldSize>1</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="Summary">
<AverageFieldSize>1</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="Teachers">
<AverageFieldSize>1</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="Title">
<AverageFieldSize>22.9</AverageFieldSize>
<Selectivity>11.1111%</Selectivity>
</Property>
<SQLMap name="ChairIndex">
<BlockCount>-4</BlockCount>
</SQLMap>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<SQLMap name="SpecialitiesIndex">
<BlockCount>-4</BlockCount>
</SQLMap>
<SQLMap name="SummaryIndex">
<BlockCount>-4</BlockCount>
</SQLMap>
<SQLMap name="TeachersIndex">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^Data.SubjectS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
