using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SetNotifications
/// </summary>
public class SetNotifications
{
	public SetNotifications()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    static public void SendFriendRequest(string from, string to)
    {
        NotificationsTableAdapters.hampson_wbsd14_ass1_notificationsTableAdapter notification = new NotificationsTableAdapters.hampson_wbsd14_ass1_notificationsTableAdapter();
        notification.Insert(from, to, "Friend Request", "AwaitingFriendship", "", DateTime.Now);
    }

    static public void AcceptFriendRequest(string nStatus, int fID)
    {
        NotificationsTableAdapters.hampson_wbsd14_ass1_notificationsTableAdapter notification = new NotificationsTableAdapters.hampson_wbsd14_ass1_notificationsTableAdapter();
        notification.acceptFriendReq(nStatus, fID);
    }

   
    static public void AcknowledgeMsgNotification(int msgID)
    {
        NotificationsTableAdapters.hampson_wbsd14_ass1_notificationsTableAdapter notification = new NotificationsTableAdapters.hampson_wbsd14_ass1_notificationsTableAdapter();
        notification.updateMsgNotif(msgID);
    }

    static public void SetNotification(string from, string to, string type)
    {
        NotificationsTableAdapters.hampson_wbsd14_ass1_notificationsTableAdapter notification = new NotificationsTableAdapters.hampson_wbsd14_ass1_notificationsTableAdapter();
        notification.Insert(from, to, type, "Awaiting", "", DateTime.Now);
    }

}