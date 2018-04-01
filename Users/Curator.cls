Class Users.Curator Extends (%Persistent, Form.Adaptor)
{

Parameter FORMNAME = "Curator";

Parameter OBJPERMISSIONS As %String = "CRUD";

Parameter DISPLAYPROPERTY As %String = "Person";

Parameter FORMORDERBY As %String = "Person";

Property Person As Users.Person;

Property Group As Data.Group;

Storage Default
{
<Data name="CuratorDefaultData">
<Subscript>"Curator"</Subscript>
<Value name="1">
<Value>group</Value>
</Value>
<Value name="2">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="3">
<Value>user</Value>
</Value>
<Value name="4">
<Value>Person</Value>
</Value>
<Value name="5">
<Value>Group</Value>
</Value>
</Data>
<DataLocation>^Users.CuratorD</DataLocation>
<DefaultData>CuratorDefaultData</DefaultData>
<IdLocation>^Users.CuratorD</IdLocation>
<IndexLocation>^Users.CuratorI</IndexLocation>
<StreamLocation>^Users.CuratorS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
