using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using WahnStore_GROUP13.Classes;

namespace WahnStore_GROUP13.Pages.CustomerPage
{
    public partial class WomanShop : Page
    {
        private const int PageSize = 5; // Số sản phẩm trên mỗi trang

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
                // Bạn có thể hiển thị thông báo lỗi ở đây.
            }
        }

        private void LoadProducts()
        {
            List<Product> products = new DataProduct().GetProductsByGenderName("Nữ");
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

            if (Request.QueryString["page"] != null && int.Parse(Request.QueryString["page"]) > 1)
            {
                paginationHtml.AppendFormat("<a href='WomanShop.aspx?page={0}'>Previous</a> ", int.Parse(Request.QueryString["page"]) - 1);
            }

            for (int i = 1; i <= totalPages; i++)
            {
                if (i == int.Parse(Request.QueryString["page"] ?? "1"))
                {
                    paginationHtml.AppendFormat("<span>{0}</span> ", i);
                }
                else
                {
                    paginationHtml.AppendFormat("<a href='WomanShop.aspx?page={0}'>{1}</a> ", i, i);
                }
            }

            if (Request.QueryString["page"] != null && int.Parse(Request.QueryString["page"]) < totalPages)
            {
                paginationHtml.AppendFormat("<a href='WomanShop.aspx?page={0}'>Next</a>", int.Parse(Request.QueryString["page"]) + 1);
            }

            lblPagination.Text = paginationHtml.ToString();
        }
    }
}

