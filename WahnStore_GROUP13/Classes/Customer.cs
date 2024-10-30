using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WahnStore_GROUP13.Classes
{
    public class Customer
    {
        public int CustomerID { get; set; }
        public string FullName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Address { get; set; }
        public int GenderId { get; set; }
        public string Avatar { get; set; }
        public DateTime CreatedDate { get; set; }

        // Constructor
        public Customer()
        {
        }

        public Customer(string fullName, string email, string phone, string username, string password, string address, int genderID, string avatar, DateTime createdDate)
        {
            FullName = fullName;
            Email = email;
            Phone = phone;
            Username = username;
            Password = password;
            Address = address;
            GenderId = genderID;
            Avatar = avatar;
            CreatedDate = createdDate;
        }

    }
}