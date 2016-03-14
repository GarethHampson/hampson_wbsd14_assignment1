using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for FriendRequests
/// </summary>
public class FriendRequests
{
	public FriendRequests()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public static string MakeFriends(string FriendOne, string FriendTwo)
    {
        UpdateFriendsTableAdapters.hampson_wbsd14_ass1_friendsTableAdapter friends = new UpdateFriendsTableAdapters.hampson_wbsd14_ass1_friendsTableAdapter();
        friends.Insert(FriendOne, FriendTwo);
        friends.Insert(FriendTwo, FriendOne);

        return "You are now Friends";
    }
}