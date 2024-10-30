using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WahnStore_GROUP13.Classes
{
    public class DataBrand
    {
        SqlConnection con;

        public DataBrand()
        {
            string sqlcon = @"Data Source=DESKTOP-NGDEMD4\SQLEXPRESS;Initial Catalog=WahnStore;Integrated Security=True";
            con = new SqlConnection(sqlcon);
        }

        public List<Brand> dsBrand()
        {
            List<Brand> brands = new List<Brand>();
            string sql = "SELECT brand_id, brand_name, brand_des FROM Brands";
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                Brand brand = new Brand
                {
                    BrandId = (int)rd["brand_id"],
                    BrandName = (string)rd["brand_name"],
                    BrandDescription = rd["brand_des"] != DBNull.Value ? (string)rd["brand_des"] : null
                };
                brands.Add(brand);
            }
            con.Close();
            return brands;
        }

        public string GetBrandNameById(int brandId)
        {
            string brandName = "";
            string sql = "SELECT brand_name FROM Brands WHERE brand_id = @BrandId";

            // Mở kết nối
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@BrandId", brandId);
            SqlDataReader rd = cmd.ExecuteReader();

            // Đọc tên thương hiệu từ SqlDataReader
            if (rd.Read())
            {
                brandName = rd["brand_name"].ToString();
            }

            // Đóng kết nối
            con.Close();

            return brandName;
        }
        public bool Addbrand(Brand brand)
        {
            try
            {
                con.Open();
                string query = @"INSERT INTO Brands 
                                (brand_name,brand_des)
                                VALUES 
                                (@BrandName, @BrandDes)";

                SqlCommand command = new SqlCommand(query, con);
                command.Parameters.AddWithValue("@BrandName", brand.BrandName);
                command.Parameters.AddWithValue("@BrandDes", brand.BrandDescription);


                int rowsAffected = command.ExecuteNonQuery();
                return rowsAffected > 0;
            }
            catch (Exception ex)
            {
                // Log the exception or handle it as needed
                throw new Exception("Error adding brnad: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
        }
        public bool DeleteBrand(int BrandId)
        {
            try
            {
                con.Open();
                string query = "DELETE FROM Brands WHERE brand_id = @BrandId";
                SqlCommand command = new SqlCommand(query, con);
                command.Parameters.AddWithValue("@BrandId", BrandId);
                int rowsAffected = command.ExecuteNonQuery();
                con.Close();

                // If rowsAffected is greater than 0, deletion was successful
                return rowsAffected > 0;
            }
            catch (Exception ex)
            {
                // Log or handle the exception here
                // For now, return false to indicate deletion failure
                return false;
            }
        }
        public bool UpdateBrand(Brand brand)
        {
            try
            {
                con.Open();
                string query = @"UPDATE Brands  
                         SET brand_name = @brandName, 
                             brand_des = @brandDes
                         WHERE brand_id = @brandId";

                SqlCommand command = new SqlCommand(query, con);
                command.Parameters.AddWithValue("@brandName", brand.BrandName);
                command.Parameters.AddWithValue("@brandDes", brand.BrandDescription);
                command.Parameters.AddWithValue("@brandId", brand.BrandId);

                int rowsAffected = command.ExecuteNonQuery();
                return rowsAffected > 0;
            }
            catch (Exception ex)
            {
                // Log the exception or handle it as needed
                throw new Exception("Error updating brand: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
        }
        public Brand getBrandById(int brand_id)
        {
            con.Open();
            String sql = "select * from Brands where brand_id =@brandId";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("brandId", brand_id);
            SqlDataReader rd = cmd.ExecuteReader();
            Brand brand = null;
            while (rd.Read())
            {

                int BrandId = (int)rd["brand_id"];
                string BrandName = (string)rd["brand_name"];
                string BrandDescription = rd["brand_des"] != DBNull.Value ? (string)rd["brand_des"] : null;
                brand = new Brand(BrandId, BrandName, BrandDescription);

            }
            con.Close();
            return brand;
        }
    }
}