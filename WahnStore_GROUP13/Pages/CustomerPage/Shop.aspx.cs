using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI;
using WahnStore_GROUP13.Classes;

namespace WahnStore_GROUP13.Pages.CustomerPage
{
    public partial class Shop : System.Web.UI.Page
    {
        DataProduct data = new DataProduct();
        int pageSize = 5; 
        int currentPage = 1;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Retrieve the current page number from query string if available
            if (int.TryParse(Request.QueryString["page"], out int page))
            {
                currentPage = page;
            }

            if (!IsPostBack)
            {
                HienThi();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            decimal minPrice;
            decimal maxPrice;

            bool isMinPriceValid = decimal.TryParse(txtMinPrice.Text, out minPrice);
            bool isMaxPriceValid = decimal.TryParse(txtMaxPrice.Text, out maxPrice);

            if (isMinPriceValid && isMaxPriceValid)
            {
                List<Product> products = data.GetProductsByPriceRange(minPrice, maxPrice);
                ListView1.DataSource = Paginate(products);
                ListView1.DataBind();
                RenderPaginationControls(products.Count);
            }
            else
            {
                // Display error message for invalid input
            }
        }

        private void HienThi()
        {
            List<Product> products = data.dsProduct();
            ListView1.DataSource = Paginate(products);
            ListView1.DataBind();
            RenderPaginationControls(products.Count);
        }

        private List<Product> Paginate(List<Product> products)
        {
            int skip = (currentPage - 1) * pageSize;
            return products.Skip(skip).Take(pageSize).ToList();
        }

        private int GetTotalPages(int totalItems)
        {
            return (int)Math.Ceiling((double)totalItems / pageSize);
        }

        private void RenderPaginationControls(int totalItems)
        {
            int totalPages = GetTotalPages(totalItems);
            StringBuilder paginationHtml = new StringBuilder();

            if (currentPage > 1)
            {
                paginationHtml.AppendFormat("<a href='Shop.aspx?page={0}'>Previous</a> ", currentPage - 1);
            }

            for (int i = 1; i <= totalPages; i++)
            {
                if (i == currentPage)
                {
                    paginationHtml.AppendFormat("<span>{0}</span> ", i);
                }
                else
                {
                    paginationHtml.AppendFormat("<a href='Shop.aspx?page={0}'>{1}</a> ", i, i);
                }
            }

            if (currentPage < totalPages)
            {
                paginationHtml.AppendFormat("<a href='Shop.aspx?page={0}'>Next</a>", currentPage + 1);
            }

            lblPagination.Text = paginationHtml.ToString();
        }
    }


}
