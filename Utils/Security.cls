Class Utils.Security
{

/// Determine if a specified privilege is held on a specified resource for a specific Username.
/// <br>
/// If called as $System.Security.CheckUserPermission(Username,Resource)
/// <br>
/// it returns the privileges held on that resource as a comma-separated
/// list. For example,
/// <br>
/// $System.Security.CheckUserPermission("Admin","%DB_CACHESYS") => "READ,WRITE"
/// <br><br>
/// If called as $System.Security.CheckUserPermission(Username,Resource,Privilege) it returns 1 or
/// 0 depending on whether the specified privilege is held.  For example,
/// <br>
/// $System.Security.CheckUserPermission("Operator","%Admin_Secure","USE") => 0
/// <br>
/// The method will take the Username passed to this method, and retrieve the list of roles the user is granted.
/// For each role in this list, it will determine 
/// if any additional roles are granted by this role. If so, it also adds this role to the list. Once the entire set of
/// roles is calculated, the list of resources and permissions which the list of roles contains is calculated. Finally,
/// any PUBLIC resources are also added to the list of resources and permission. The resource name is then checked against
/// this list to determine the return value for the method.<br>
/// Note: If the Username holds the %All role, then the method always returns "READ,WRITE,USE" for the 2-argument form
/// and 1 for the 3-argument form<br>
/// If the User does not exist, or an error occurs, then the method returns "" for the 2-argument form
/// and 0 for the 3-argument form<br>
/// 
ClassMethod CheckUserPermission(Username As %String, ResourceName As %String, Permissions As %String = "") As %CacheString
{
	new $roles
	set sc = $SYSTEM.Security.AddRoles("brs")
	if Permissions'="" {
		set result = $System.Security.CheckUserPermission(Username, ResourceName, Permissions)
	} else {
		set result = $System.Security.CheckUserPermission(Username, ResourceName)
	}
	set $roles = ""
	quit result
}

}
