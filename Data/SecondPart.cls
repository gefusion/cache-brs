Class Data.SecondPart Extends Data.BRS
{

Parameter FORMNAME = "SecondPart";

Parameter OBJPERMISSIONS As %String = "CRUD";

Parameter DISPLAYPROPERTY As %String = "SRS";

Parameter FORMORDERBY As %String = "SRS";

Storage Default
{
<Type>%Library.CacheStorage</Type>
}

}
