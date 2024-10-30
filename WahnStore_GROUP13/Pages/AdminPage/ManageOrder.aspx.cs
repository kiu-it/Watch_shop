using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Web.UI.WebControls;
using WahnStore_GROUP13.Classes;
using ClosedXML.Excel;
namespace WahnStore_GROUP13.Pages.AdminPage
{
    public partial class ManageOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindOrderGrid();
            }
        }

        private void BindOrderGrid()
        {
            DataOrder dataOrder = new DataOrder();
            List<Order> orders = dataOrder.GetAllOrders(); 
            GridViewOrders.DataSource = orders;
            GridViewOrders.DataBind();
        }

        protected void GridViewOrders_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Optionally format the data or add additional controls
            }
        }

        protected void GridViewOrders_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int orderId = Convert.ToInt32(GridViewOrders.DataKeys[e.RowIndex].Value);
            DataOrder dataOrder = new DataOrder();
            dataOrder.DeleteOrder(orderId); // Calls the DeleteOrder method
            BindOrderGrid();
        }

        protected void GridViewOrders_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "UpdateOrder")
            {
                int orderId = Convert.ToInt32(e.CommandArgument);
                Response.Redirect($"UpdateOrder.aspx?orderId={orderId}");
            }
        }

        protected void btnExportToExcel_Click(object sender, EventArgs e)
        {
            // Create a DataTable to hold GridView data
            DataTable dt = new DataTable();

            // Define the desired columns
            dt.Columns.Add("Order ID");
            dt.Columns.Add("Customer ID");
            dt.Columns.Add("Order Date", typeof(DateTime)); // Explicitly define the data type
            dt.Columns.Add("Total Amount", typeof(decimal));
            dt.Columns.Add("Order Status");
            dt.Columns.Add("Shipment Address");
            dt.Columns.Add("Shipment Country");
            dt.Columns.Add("Shipment Date", typeof(DateTime)); // Explicitly define the data type

            // Populate DataTable with GridView data
            foreach (GridViewRow row in GridViewOrders.Rows)
            {
                DataRow dr = dt.NewRow();
                dr["Order ID"] = row.Cells[0].Text.Trim();
                dr["Customer ID"] = row.Cells[1].Text.Trim();
                dr["Order Date"] = DateTime.TryParse(row.Cells[2].Text.Trim(), out DateTime orderDate) ? orderDate : DateTime.MinValue;
                // Convert the Total Amount cell value to decimal and handle potential errors
                string totalAmountText = row.Cells[3].Text.Trim().Replace("₫", "").Replace(".", "").Trim();
                dr["Total Amount"] = decimal.TryParse(totalAmountText, out decimal totalAmount) ? totalAmount : 0;
                dr["Order Status"] = row.Cells[4].Text.Trim();
                dr["Shipment Address"] = row.Cells[5].Text.Trim();
                dr["Shipment Country"] = row.Cells[6].Text.Trim();
                dr["Shipment Date"] = DateTime.TryParse(row.Cells[7].Text.Trim(), out DateTime shipmentDate) ? shipmentDate : DateTime.MinValue;
                dt.Rows.Add(dr);
            }

            // Write the DataTable to Excel using ClosedXML
            using (var wb = new XLWorkbook())
            {
                var ws = wb.Worksheets.Add("Orders");
                ws.Cell(1, 1).InsertTable(dt);

                // Write to stream
                using (var stream = new MemoryStream())
                {
                    wb.SaveAs(stream);
                    stream.Position = 0;

                    // Set the response headers and send the file to the client
                    Response.Clear();
                    Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                    Response.AddHeader("content-disposition", "attachment;filename=Orders.xlsx");
                    Response.BinaryWrite(stream.ToArray());
                    Response.End();
                }
            }
        }


    }
}
