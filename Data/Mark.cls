Class Data.Mark Extends (%Persistent, Form.Adaptor, %Populate)
{

Parameter FORMNAME = "BRS";

Parameter OBJPERMISSIONS As %String = "CRUD";

Parameter DISPLAYPROPERTY As %String = "SRS1";

Parameter FORMORDERBY As %String = "SRS1";

Property StudentSubject As Data.StudentSubject;

Property SRS1 As %Library.TinyInt(DISPLAYNAME = "СРС1", MAXVAL = 100, MINVAL = 0);

Property Attendance1 As %Library.TinyInt(DISPLAYNAME = "Посещаемость1", MAXVAL = 100, MINVAL = 0);

Property ModalControl1 As %Library.TinyInt(DISPLAYNAME = "Рубежный контроль1", MAXVAL = 100, MINVAL = 0);

Property SRS2 As %Library.TinyInt(DISPLAYNAME = "СРС1", MAXVAL = 100, MINVAL = 0);

Property Attendance2 As %Library.TinyInt(DISPLAYNAME = "Посещаемость1", MAXVAL = 100, MINVAL = 0);

Property ModalControl2 As %Library.TinyInt(DISPLAYNAME = "Рубежный контроль1", MAXVAL = 100, MINVAL = 0);

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
<Data name="MarkDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>StudentSubject</Value>
</Value>
<Value name="3">
<Value>SRS1</Value>
</Value>
<Value name="4">
<Value>Attendance1</Value>
</Value>
<Value name="5">
<Value>ModalControl1</Value>
</Value>
<Value name="6">
<Value>SRS2</Value>
</Value>
<Value name="7">
<Value>Attendance2</Value>
</Value>
<Value name="8">
<Value>ModalControl2</Value>
</Value>
</Data>
<DataLocation>^Data.MarkD</DataLocation>
<DefaultData>MarkDefaultData</DefaultData>
<IdLocation>^Data.MarkD</IdLocation>
<IndexLocation>^Data.MarkI</IndexLocation>
<StreamLocation>^Data.MarkS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
