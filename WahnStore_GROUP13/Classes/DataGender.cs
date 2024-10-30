using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace WahnStore_GROUP13.Classes
{
    public class DataGender : ApiController
    {

        SqlConnection con;
        public DataGender()
        {
            string sqlcon = @"Data Source=DESKTOP-NGDEMD4\SQLEXPRESS;Initial Catalog=WahnStore;Integrated Security=True";
            con = new SqlConnection(sqlcon);
        }
        public List<Gender> DsGender()
        {
            List<Gender> genders = new List<Gender>();
            con.Open();
            string queryString = "select * from Genders";
            SqlCommand cmd = new SqlCommand(queryString, con);
            SqlDataReader rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                int genderId = (int)rd["gender_id"];
                string genderName = (string)rd["gender_name"];
                Gender gender = new Gender(genderId, genderName);
                genders.Add(gender);

            }
            con.Close();
            return genders;
        }

    }
}