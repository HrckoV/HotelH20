using Dapper;
using H20.Entities;
using System.Configuration;
using System.Data;

namespace H20.Data
{
    public class Login
    {
          EncryptDecrypt ed = new EncryptDecrypt();

        public System.Collections.Generic.List<Guest> UserData(IDbConnection conn,Guest guestData)
        {

            using (conn)
            {
                var guest = conn.Query<Guest>("dbo.GetUserLoginData @GuestName,@GuestPassword", new
                {                    
                    GuestName = guestData.Guest_Username,
                    GuestPassword = ed.Encrypt(guestData.Guest_Password)
                }).AsList<Guest>();

                conn.Close();

                
                    return guest;

                }                

            }
        }

       
}

