<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/AdminPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="WahnStore_GROUP13.Pages.AdminPage.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style>
        .card-custom {
            background-color:rgb(47, 141, 236);           
            transition: transform 0.3s ease, background-color 0.3s ease;
        }

        .card-custom:hover {
            transform: scale(1.05);
            background-color:blue;
        }

        .card-custom .card-title {
            color:white;
        }

        .card-custom .card-text {
            font-size: 1.2em;
    
            font-weight: bold;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
    <div class="row text-center mt-4">
        <div class="col-md-4">
            <div class="card card-custom">
                <div class="card-body">
                    <h5 class="card-title">Total Sales</h5>
                    <p class="card-text">$5000</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card card-custom">
                <div class="card-body">
                    <h5 class="card-title">Total Orders</h5>
                    <p class="card-text">150</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card card-custom">
                <div class="card-body">
                    <h5 class="card-title">Total Customers</h5>
                    <p class="card-text">120</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Chart -->
    <div class="chart-container mt-4">
        <canvas id="salesChart"></canvas>
    </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        var ctx = document.getElementById('salesChart').getContext('2d');
        var salesChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: ['January', 'February', 'March', 'April', 'May', 'June'],
                datasets: [{
                    label: 'Sales',
                    data: [1200, 1900, 3000, 5000, 2000, 3000],
                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>

</asp:Content>
