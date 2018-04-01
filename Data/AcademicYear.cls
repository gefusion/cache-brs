Class Data.AcademicYear Extends (%Persistent, Form.Adaptor, %Populate)
{

Parameter FORMNAME = "AcademicYear";

Parameter OBJPERMISSIONS As %String = "CRUD";

Parameter DISPLAYPROPERTY As %String = "YearTitle";

Parameter FORMORDERBY As %String = "YearTitle";

Property YearStart As %Library.SmallInt(DISPLAYNAME = "Начало учебного года", MAXVAL = 2099, MINVAL = 2000) [ Required ];

Property YearEnd As %Library.SmallInt(DISPLAYNAME = "Конец учебного года", MAXVAL = 2099, MINVAL = 2000) [ Required ];

Property YearTitle As %String(DISPLAYNAME = "Название") [ Required ];

Storage Default
{
<Data name="AcademicYearDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>YearStart</Value>
</Value>
<Value name="3">
<Value>YearEnd</Value>
</Value>
<Value name="4">
<Value>YearShort</Value>
</Value>
<Value name="5">
<Value>Title</Value>
</Value>
<Value name="6">
<Value>Summary</Value>
</Value>
<Value name="7">
<Value>Semester</Value>
</Value>
<Value name="8">
<Value>YearTitle</Value>
</Value>
</Data>
<DataLocation>^Data.AcademicYearD</DataLocation>
<DefaultData>AcademicYearDefaultData</DefaultData>
<ExtentSize>10</ExtentSize>
<IdLocation>^Data.AcademicYearD</IdLocation>
<IndexLocation>^Data.AcademicYearI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>1</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="Summary">
<AverageFieldSize>1</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="Title">
<AverageFieldSize>17.1</AverageFieldSize>
<Selectivity>11.1111%</Selectivity>
</Property>
<Property name="YearEnd">
<AverageFieldSize>4</AverageFieldSize>
<Selectivity>11.1111%</Selectivity>
</Property>
<Property name="YearStart">
<AverageFieldSize>4</AverageFieldSize>
<Selectivity>10.0000%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<SQLMap name="SummaryIndex">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^Data.AcademicYearS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

// Relationship Summary As Data.Summary [ Cardinality = one, Inverse = AcademicYears ];

// Index SummaryIndex On Summary;

}
