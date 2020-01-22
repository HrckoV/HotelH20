using System;
using System.Collections.Generic;
using System.IO;
using System.Security.Cryptography;
using System.Text;

namespace H20.Entities
{
    public class EncryptDecrypt
    {
        static string s1 = "kU8";
        static string s2 = "sd6";
        static string s3 = "0OK";
        static string s4 = "d45";
        static string s5 = "mkK";
        static string s6 = "uDj";

        public string Encrypt(string value)
        {
            if (value.Length != 0)
            {
                try
                {
                    byte[] keyArray;
                    byte[] toEncryptArray = UTF8Encoding.UTF8.GetBytes(value);

                    string key;
                    key = s1 + s2 + s1 + s3 + s4 + s2 + s5 + s3 + s6;

                    using (MD5CryptoServiceProvider hashmd5 = new MD5CryptoServiceProvider())
                        {
                            keyArray = hashmd5.ComputeHash(UTF8Encoding.UTF8.GetBytes(key));
                            //Always release the resources and flush data of the Cryptographic service provide. Best Practice

                            hashmd5.Clear();
                        }                   

                    byte[] resultArray;

                    using (TripleDESCryptoServiceProvider tdes = new TripleDESCryptoServiceProvider())
                    {
                        //set the secret key for the tripleDES algorithm
                        tdes.Key = keyArray;
                        //mode of operation. there are other 4 modes. We choose ECB(Electronic code Book)
                        tdes.Mode = CipherMode.ECB;
                        //padding mode(if any extra byte added)

                        tdes.Padding = PaddingMode.PKCS7;

                        ICryptoTransform cTransform = tdes.CreateEncryptor();
                        //transform the specified region of bytes array to resultArray
                        resultArray = cTransform.TransformFinalBlock(toEncryptArray, 0, toEncryptArray.Length);
                        //Release resources held by TripleDes Encryptor
                        tdes.Clear();
                    }
                    //Return the encrypted data into unreadable string format
                    return Convert.ToBase64String(resultArray, 0, resultArray.Length);
                }
                catch (Exception)
                {
                }
            }
            return "";
        }

        public string Decrypt(string value, bool useHashing, bool password)
        {
            
            if (value.Length != 0)
            {
                try
                {
                    byte[] keyArray;
                    //get the byte code of the string

                    byte[] toEncryptArray = Convert.FromBase64String(value);

                    string key;
                    if (password) key = s1 + s2 + s1 + s3 + s4 + s2 + s5 + s3 + s6;
                    else key = s3 + s2 + s6 + s5 + s1 + s4 + s1 + s5 + s2;

                    if (useHashing)
                    {
                        //if hashing was used get the hash code with regards to your key
                        using (MD5CryptoServiceProvider hashmd5 = new MD5CryptoServiceProvider())
                        {
                            keyArray = hashmd5.ComputeHash(UTF8Encoding.UTF8.GetBytes(key));
                            //release any resource held by the MD5CryptoServiceProvider

                            hashmd5.Clear();
                        }
                    }
                    else
                    {
                        //if hashing was not implemented get the byte code of the key
                        keyArray = UTF8Encoding.UTF8.GetBytes(key);
                    }

                    byte[] resultArray;

                    using (TripleDESCryptoServiceProvider tdes = new TripleDESCryptoServiceProvider())
                    {
                        //set the secret key for the tripleDES algorithm
                        tdes.Key = keyArray;
                        //mode of operation. there are other 4 modes. We choose ECB(Electronic code Book)

                        tdes.Mode = CipherMode.ECB;
                        //padding mode(if any extra byte added)
                        tdes.Padding = PaddingMode.PKCS7;

                        ICryptoTransform cTransform = tdes.CreateDecryptor();
                        resultArray = cTransform.TransformFinalBlock(toEncryptArray, 0, toEncryptArray.Length);
                        //Release resources held by TripleDes Encryptor                
                        tdes.Clear();
                    }
                    //return the Clear decrypted TEXT
                    return UTF8Encoding.UTF8.GetString(resultArray);
                }
                catch (Exception e)
                {
                    var error = e.Message + " " + e.Source;

                    var st = 0;
                }
            }
            return "";
        }

       
    }
}
