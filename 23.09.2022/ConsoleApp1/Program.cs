using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using validate;
namespace ConsoleApp1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string connectionstring = "Data Source=LAPTOP-21IK3OHF\\SQLEXPRESS;Initial Catalog=Northwind;Integrated Security=True";
            SqlConnection cn = new SqlConnection(connectionstring);
            SqlCommand cmd = new SqlCommand("select * from products",cn);
            cn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while(dr.Read())
            {
                Console.WriteLine(dr[0]);
                Console.WriteLine(dr[1]);
                Console.WriteLine(dr[2]);
                Console.WriteLine(dr[3]);
                Console.WriteLine(dr[4]);
                Console.WriteLine(dr[5]);
            }
            cn.Close();
            dr.Close();

        }
    }

}
