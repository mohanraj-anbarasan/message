// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

 function modify_db(mid)
{
	var check=1
        new Ajax.Request("/users/dashboard/message="+mid,
	{
            asynchronous:true,
            evalScripts:true,
            insertion:Insertion.Top,
            });
        return false;    
}
 //~ new Ajax.Request('/activities/save_user_detail/', {asynchronous: true, evalScripts: true, method: 'POST', parameters:'gid=' + gid});

