using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for GetEmailAddress
/// </summary>
public class GetEmailAddress
{
	public GetEmailAddress()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static string GetEmail(string username)
    {
        getEmailTableAdapters.hampson_wbsd14_ass1_profileTableAdapter getemail = new getEmailTableAdapters.hampson_wbsd14_ass1_profileTableAdapter();
        getEmail.hampson_wbsd14_ass1_profileDataTable getEmailTable = getemail.GetData(username);

        return Convert.ToString(getEmailTable.Rows[0]["email"]);
    }
}