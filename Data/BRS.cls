Class Data.BRS Extends (%Persistent, Form.Adaptor, %Populate) [ Abstract ]
{

Parameter FORMNAME = "BRS";

Parameter OBJPERMISSIONS As %String = "CRUD";

Parameter DISPLAYPROPERTY As %String = "SRS";

Parameter FORMORDERBY As %String = "SRS";

// Tinyint up to 255

Property SRS As %Library.TinyInt(DISPLAYNAME = "СРС", MAXVAL = 100, MINVAL = 0) [ Required, SqlFieldName = srs ];

Property Attendance As %Library.TinyInt(DISPLAYNAME = "Посещаемость", MAXVAL = 100, MINVAL = 0) [ Required, SqlFieldName = attendance ];

Property ModalControl As %Library.TinyInt(DISPLAYNAME = "Рубежный контроль", MAXVAL = 100, MINVAL = 0) [ Required, SqlFieldName = modal_control ];

/*
Property Average As %Float(DISPLAYNAME = "Средний балл") [ Calculated, Required, SqlComputeCode = { 
set {Average}=##class(Data.BRS).avg(..SRS,..Attendance,..ModalControl)
}, SqlComputed, SqlFieldName = average ];

ClassMethod avg(srs, attnd, mctrl As %Library.TinyInt) As %Float [ CodeMode = expression ]
{
RETURN(srs + attnd + mctrl)/3
}
*/
Storage Default
{
<Data name="BRSDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>SRS1</Value>
</Value>
<Value name="3">
<Value>SRS2</Value>
</Value>
<Value name="4">
<Value>Attendance1</Value>
</Value>
<Value name="5">
<Value>Attendance2</Value>
</Value>
<Value name="6">
<Value>ModalControl1</Value>
</Value>
<Value name="7">
<Value>ModalControl2</Value>
</Value>
<Value name="8">
<Value>SRS</Value>
</Value>
<Value name="9">
<Value>Attendance</Value>
</Value>
<Value name="10">
<Value>ModalControl</Value>
</Value>
<Value name="11">
<Value>Summary</Value>
</Value>
<Value name="12">
<Value>Average</Value>
</Value>
<Value name="13">
<Value>Student</Value>
</Value>
<Value name="14">
<Value>Subject</Value>
</Value>
<Value name="15">
<Value>Year</Value>
</Value>
<Value name="16">
<Value>Semester</Value>
</Value>
<Value name="17">
<Value>StudentSubject</Value>
</Value>
</Data>
<DataLocation>^Data.BRSD</DataLocation>
<DefaultData>BRSDefaultData</DefaultData>
<IdLocation>^Data.BRSD</IdLocation>
<IndexLocation>^Data.BRSI</IndexLocation>
<StreamLocation>^Data.BRSS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
