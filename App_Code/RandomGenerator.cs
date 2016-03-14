using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for RandomGenerator
/// </summary>
public class RandomGenerator
{
    public string RadGen()
	{
	
        string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        var checkChar = new char[8];   // why was var the only one that worked?
        Random randomClass = new Random();

        for (int i = 0; i < checkChar.Length; i++)
        {
            checkChar[i] = chars[randomClass.Next(chars.Length)];

        }
        return string.Join("",checkChar);

	}
}