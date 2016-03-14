using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


/// <summary>
/// Summary description for PictureUploadTest
/// </summary>
public class PictureUpload
{
    public string PictureUploader(FileUpload FileUploadName, string description, string sessionNamePass, string path)
    {
        //if ((FileUpload1.PostedFile.ContentType == "image/jpeg") || (FileUpload1.PostedFile.ContentType == "image/x-png") || (FileUpload1.PostedFile.ContentType == "image/bmp"))
        //{

        
        
        DateTime imagedate = DateTime.Now;
        RandomGenerator radGen = new RandomGenerator();

        string randomChar = radGen.RadGen();
  
        string profileURL = @"gallery/" + randomChar + FileUploadName.FileName;
        string profileURLSaved = @"~/" + profileURL;

        //string sPath = MapPath(profileURL);
        
        //string sPath = "E:/MScWebDev/hampson_wbsd14_assignment/" + profileURL;
        string sPath = path + profileURL;

        //string sessionName = Convert.ToString(Session["sessionUserName"]);

        FileUploadName.PostedFile.SaveAs(sPath);

        ImageUploadTableAdapters.hampson_wbsd14_ass1_picturesTableAdapter image = new ImageUploadTableAdapters.hampson_wbsd14_ass1_picturesTableAdapter();
        image.Insert(sessionNamePass, profileURLSaved, description, imagedate);

        return profileURLSaved;
        
        //}
        //else
        //{
        //lblUploadStatus.Text = "Only JPEG, PNG or BMP images can be uploaded";
        //}
        //FileUploadName.HasFile

    }

}