using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace validate
{
    public class Products
    {
		private string productid;

		public string Productid
		{
			get { return productid; }
			set 
			{ 
				if (string.IsNullOrEmpty(value))
				{
					throw new Exception(" product id not valid");
				}
				else { productid = value; }		
			}
		}
		private string prod_name;

		public string Prod_name
		{
			get { return prod_name; }
			set 
			{ 
				if ((value.Length > 80) || (string.IsNullOrEmpty(value)))
				{
					throw new Exception("prod_name not valid.....");
				}
				else { prod_name = value; }
			}
		}
		private string supplier_id;

		public string Supplier_id
		{
			get { return supplier_id; }
			set 
			{
                if (value.Length > 4)
                {
                    throw new Exception("Length of supplier_id cannot be more than 4 chars/numbers");
                }
                else
                {
                   supplier_id = value;
                }
            }
		}
		private string unitprice;
		public string Unitprice
		{
			get { return unitprice; }
			set {
                if (value.Length > 8)
                {
                    throw new Exception("length of price invalid");
                }
                else
                {
                    unitprice = value;
                }
            }
		}


	}
}
