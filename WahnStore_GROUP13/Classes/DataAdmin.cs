using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;

namespace WahnStore_GROUP13.Classes
{
    public class DataAdmin
    {
        SqlConnection con;
        public DataAdmin()
        {
            string sqlcon = @"Data Source=DESKTOP-NGDEMD4\SQLEXPRESS;Initial Catalog=WahnStore;Integrated Security=True";
            con = new SqlConnection(sqlcon);
        }

        public List<Admin> dsAdmin()
        {
            List<Admin> ds = new List<Admin>();
            string sql = "SELECT *FROM Admins";
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                Admin c = new Admin();

                c.AdminId = (int)rd["admin_id"];
                c.AdFullName = (string)rd["admin_fullname"];
                c.AdEmail = (string)rd["admin_email"];
                c.AdPhone = (string)rd["admin_phone"];
                c.AdUsername = (string)rd["admin_username"];
                c.AdPassword = (string)rd["admin_password"];
                c.AdAddress = (string)rd["admin_address"];
                c.AdAvatar = (string)rd["admin_avatar"];
                c.GenderId = (int)rd["gender_id"];
                c.CreatedDate = (DateTime)rd["customer_createddate"];
                ds.Add(c);
            }
            con.Close();
            return ds;
        }

        public bool AuthenticateUser(string username, string password)
        {
            string sql = "SELECT COUNT(*) FROM Admins WHERE admin_username = @Username AND admin_password = @Password";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@Username", username);
            cmd.Parameters.AddWithValue("@Password", password);

            try
            {
                con.Open();
                int count = (int)cmd.ExecuteScalar();
                return count > 0;
            }
            catch (Exception)
            {
                return false;
            }
            finally
            {
                con.Close();
            }
        }
        public string SaveAvatar(HttpPostedFile file)
        {
            if (file != null && file.ContentLength > 0)
            {
                string fileName = Path.GetFileName(file.FileName);
                string directoryPath = HttpContext.Current.Server.MapPath("~/AvaAdmin/");

                // Ensure that the directory exists
                if (!Directory.Exists(directoryPath))
                {
                    Directory.CreateDirectory(directoryPath);
                }

                string filePath = Path.Combine(directoryPath, fileName);
                file.SaveAs(filePath);
                return fileName;
            }
            return null;
        }


        public bool AddAdmin(Admin ad)
        {
            string sql = @"INSERT INTO Admins (admin_fullname, admin_email, admin_phone, admin_username, admin_password, admin_address, gender_id, admin_avatar, admin_createddate) 
                   VALUES (@FullName, @Email, @Phone, @Username, @Password, @Address, @GenderId, @Avatar, @CreatedDate)";

            using (SqlCommand cmd = new SqlCommand(sql, con))
            {
                cmd.Parameters.AddWithValue("@FullName", ad.AdFullName);
                cmd.Parameters.AddWithValue("@Email", ad.AdEmail);
                cmd.Parameters.AddWithValue("@Phone", ad.AdPhone);
                cmd.Parameters.AddWithValue("@Username", ad.AdUsername);
                cmd.Parameters.AddWithValue("@Password", ad.AdPassword);  // Remember to hash the password
                cmd.Parameters.AddWithValue("@Address", ad.AdAddress);
                cmd.Parameters.AddWithValue("@GenderId", (object)ad.GenderId ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@Avatar", (object)ad.AdAvatar ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@CreatedDate", ad.CreatedDate);

                try
                {
                    con.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    return rowsAffected > 0;
                }
                catch (SqlException)
                {
                    // Handle specific SQL exceptions
                    // Log the exception or return false
                    return false;
                }
                finally
                {
                    con.Close();
                }
            }
        }
    }
}