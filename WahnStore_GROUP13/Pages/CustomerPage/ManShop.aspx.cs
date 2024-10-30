using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using WahnStore_GROUP13.Classes;

namespace WahnStore_GROUP13.Pages.CustomerPage
{
    public partial class ManShop : Page
    {
        private const int PageSize = 5; // Number of products per page

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProducts();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (decimal.TryParse(txtMinPrice.Text, out decimal minPrice) && decimal.TryParse(txtMaxPrice.Text, out decimal maxPrice))
            {
                List<Product> filteredProducts = new DataProduct().GetProductsByPriceRange(minPrice, maxPrice);
                ListView1.DataSource = Paginate(filteredProducts);
                ListView1.DataBind();
                RenderPaginationControls(filteredProducts.Count);
            }
            else
            {
                // Display error message for invalid input
               // lblError.Text = "Please enter valid price ranges.";
            }
        }

        private void LoadProducts()
        {
            DataProduct dataProduct = new DataProduct();
            List<Product> products = dataProduct.GetProductsByGenderName("Nam");
            ListView1.DataSource = Paginate(products);
            ListView1.DataBind();
            RenderPaginationControls(products.Count);
        }

        private List<Product> Paginate(List<Product> products)
        {
            int currentPage = int.TryParse(Request.QueryString["page"], out int page) ? page : 1;
            int skip = (currentPage - 1) * PageSize;
            return products.Skip(skip).Take(PageSize).ToList();
        }

        private int GetTotalPages(int totalItems)
        {
            return (int)Math.Ceiling((double)totalItems / PageSize);
        }

        private void RenderPaginationControls(int totalItems)
        {
            int totalPages = GetTotalPages(totalItems);
            var paginationHtml = new System.Text.StringBuilder();

            int currentPage = int.TryParse(Request.QueryString["page"], out int page) ? page : 1;
            if (currentPage > 1)
            {
                paginationHtml.AppendFormat("<a href='ManShop.aspx?page={0}'>Previous</a> ", currentPage - 1);
            }

            for (int i = 1; i <= totalPages; i++)
            {
                if (i == currentPage)
                {
                    paginationHtml.AppendFormat("<span>{0}</span> ", i);
                }
                else
                {
                    paginationHtml.AppendFormat("<a href='ManShop.aspx?page={0}'>{1}</a> ", i, i);
                }
            }

            if (currentPage < totalPages)
            {
                paginationHtml.AppendFormat("<a href='ManShop.aspx?page={0}'>Next</a>", currentPage + 1);
            }

            lblPagination.Text = paginationHtml.ToString();
        }
    }
}
