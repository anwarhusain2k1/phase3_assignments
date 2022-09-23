using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using validate;

namespace ConsoleApp1
{
    internal class program2
    {
        static List<Products> products = new List<Products>();
        static void Main(string[] args)
        {           
            string connectionstring = "Data Source=LAPTOP-21IK3OHF\\SQLEXPRESS;Initial Catalog=Northwind;Integrated Security=True";
            SqlConnection cn = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand("select * from products", cn);
            cn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                Products product = new Products();
                product.Productid = dr[0].ToString();
                product.Prod_name = dr[1].ToString();
                product.Unitprice = dr[5].ToString();
                products.Add(product);
            }
            cn.Close();
            dr.Close();
            foreach(Products product in products)
            {
                Console.WriteLine(product.Productid);
                Console.WriteLine(product.Prod_name);
                Console.WriteLine(product.Unitprice);
                Console.WriteLine("--------------------------------------------");
            }
            Console.ReadLine();
        }
    }
}
