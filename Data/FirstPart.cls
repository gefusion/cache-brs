Class Data.FirstPart Extends Data.BRS
{

Parameter FORMNAME = "FirstPart";

Parameter OBJPERMISSIONS As %String = "CRUD";

Parameter DISPLAYPROPERTY As %String = "SRS";

Parameter FORMORDERBY As %String = "SRS";

Storage Default
{
<Type>%Library.CacheStorage</Type>
}

}
