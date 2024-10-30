using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WahnStore_GROUP13.Classes;
using System.Data;
using ClosedXML.Excel;
using System.IO;

namespace WahnStore_GROUP13.Pages.AdminPage
{
    public partial class Statistics : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadYears();
            }
        }

        protected void LoadYears()
        {
            int currentYear = DateTime.Now.Year;
            for (int i = currentYear; i >= currentYear - 10; i--)
            {
                ddlYear.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }
        }

        protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedYear = Convert.ToInt32(ddlYear.SelectedValue);
            if (selectedYear == -1)
            {
                ddlMonth.Items.Clear();
                ddlDay.Items.Clear();
                gvOrderStatistics.DataSource = null;
                gvOrderStatistics.DataBind();
                return;
            }

            LoadMonths(selectedYear);
        }

        protected void LoadMonths(int year)
        {
            ddlMonth.Items.Clear();
            ddlMonth.Items.Add(new ListItem("-- Chọn Tháng --", "-1"));

            for (int i = 1; i <= 12; i++)
            {
                DateTime month = new DateTime(year, i, 1);
                ddlMonth.Items.Add(new ListItem(month.ToString("MMMM", new System.Globalization.CultureInfo("vi-VN")), i.ToString()));
            }
        }

        protected void ddlMonth_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedYear = Convert.ToInt32(ddlYear.SelectedValue);
            int selectedMonth = Convert.ToInt32(ddlMonth.SelectedValue);

            if (selectedYear == -1 || selectedMonth == -1)
            {
                ddlDay.Items.Clear();
                gvOrderStatistics.DataSource = null;
                gvOrderStatistics.DataBind();
                return;
            }

            LoadDays(selectedYear, selectedMonth);
        }

        protected void LoadDays(int year, int month)
        {
            ddlDay.Items.Clear();
            ddlDay.Items.Add(new ListItem("-- Chọn Ngày --", "-1"));

            int daysInMonth = DateTime.DaysInMonth(year, month);
            for (int i = 1; i <= daysInMonth; i++)
            {
                ddlDay.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            int year = ddlYear.SelectedValue != "-1" ? Convert.ToInt32(ddlYear.SelectedValue) : -1;
            int month = ddlMonth.SelectedValue != "-1" ? Convert.ToInt32(ddlMonth.SelectedValue) : -1;
            int day = ddlDay.SelectedValue != "-1" ? Convert.ToInt32(ddlDay.SelectedValue) : -1;

            DataTable dtStatistics = null;

            if (day != -1 && month != -1 && year != -1)
            {
                // Filter by selected day
                DateTime fromDate = new DateTime(year, month, day);
                DateTime toDate = fromDate.AddDays(1).AddSeconds(-1); // End of selected day
                dtStatistics = new DataOrder().GetOrderStatisticsByDay(fromDate, toDate);
            }
            else if (month != -1 && year != -1)
            {
                // Filter by selected month
                dtStatistics = new DataOrder().GetOrderStatisticsByMonth(year, month);
            }
            else if (year != -1)
            {
                // Filter by selected year
                dtStatistics = new DataOrder().GetOrderStatisticsByYear(year);
            }

            gvOrderStatistics.DataSource = dtStatistics;
            gvOrderStatistics.DataBind();
        }

        protected void btnExportExcel_Click(object sender, EventArgs e)
        {
            using (var workbook = new XLWorkbook())
            {
                var worksheet = workbook.Worksheets.Add("OrderStatistics");

                // Write header
                for (int i = 0; i < gvOrderStatistics.HeaderRow.Cells.Count; i++)
                {
                    worksheet.Cell(1, i + 1).Value = gvOrderStatistics.HeaderRow.Cells[i].Text;
                }

                // Write data rows
                for (int i = 0; i < gvOrderStatistics.Rows.Count; i++)
                {
                    for (int j = 0; j < gvOrderStatistics.Rows[i].Cells.Count; j++)
                    {
                        worksheet.Cell(i + 2, j + 1).Value = gvOrderStatistics.Rows[i].Cells[j].Text;
                    }
                }

                // Auto fit columns
                worksheet.Columns().AdjustToContents();

                // Write the file to disk or to HTTP Response
                using (var stream = new MemoryStream())
                {
                    workbook.SaveAs(stream);
                    stream.Position = 0;
                    Response.Clear();
                    Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                    Response.AddHeader("content-disposition", "attachment; filename=OrderStatistics.xlsx");
                    stream.CopyTo(Response.OutputStream);
                    Response.Flush();
                    Response.End();
                }
            }
        }
    }
}