<%@ Page Title="Reportes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reportes.aspx.cs" Inherits="Datametrics.Reportes" %>

<asp:Content ID="ReportesTitle" ContentPlaceHolderID="title" runat="server">
    InFactMetrycs - Reportes
</asp:Content>
<asp:Content ID="ReportesHead" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="ReportesBody" ContentPlaceHolderID="MainContent" runat="server">
    
    <div id="carouselObservatorio" class="carousel slide" data-bs-ride="carousel" style="padding-bottom: 2rem;">
        <div class="carousel-inner">
            <% var isFirstO = true;
                foreach (var banner in BannerObservatorio())
                { %>
                <div class="carousel-item <%= isFirstO ? " active" : "" %>">
                    <img loading="lazy" src="<%= banner.url_banner %>" class="d-block w-100" alt="<%= banner.titulo_banner %>">
                    <%if(!string.IsNullOrEmpty(banner.url_reporte)) {%>
                        <div class="banner-text">
                            <h3><%= banner.titulo_banner %></h3>
                            <a href="<%: CargaDesdeDrive(banner.url_reporte) %>" download="Reporte">
                                <p><%= banner.nombre_reporte %></p></a>
                            
                        </div>
                    <%} %>
                </div>
            <% isFirstO = false;} %>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselObservatorio" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselObservatorio" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

    <!---Hero Section-->
<div class=" text-center mb-3" style="padding-bottom: 2rem;">
    <div
        style="display:flex; height: 100px; align-items: center; justify-content: start; background-color: #181848; color: white; justify-content: center;">
        <h2 style="padding: 1rem;">Biblioteca de Reportes</h2>
    </div>
    <div class="container" style="padding: 3rem; min-height: 80vh;">
        <div class="row">
        <div class="col" style="display: flex; justify-content: center; overflow-x: overlay;">
            <!-- Nav tabs -->
            <ul class="nav nav-pills mb-3 shadow-sm" style="flex-wrap: nowrap; width: 100%; justify-content: center;">
                <% bool isFirstCategoria = true;
                   foreach (var categoria in GetCategorias())
                   { 
                        string activeClass = isFirstCategoria ? "active" : "";
                        isFirstCategoria = false;%>
                        <li class="nav-item px-3">
                            <a class="nav-link <%= activeClass %>" data-bs-toggle="pill" href="#Categoria<%= categoria.id_categoria %>">
                                <h3><%= categoria.titulo_categoria %></h3>
                            </a>
                        </li>
                <% } %>
            </ul>
        </div>
        </div>
        <div class="row">
        <div class="col-sm-3 my-3">
            <div class="card" style="width: 100%; overflow: hidden; border-radius: 20px;">
            <div
                style="width: 100%; background-color: #181848; color: white; display: flex; justify-content: center; height: 3rem;">
                <p style="margin: 0; font-size: 1.5rem; padding-top: 5px;">Buscar</p>
            </div>
            <div class="card-body">
                <label class="form-label" for="title">Título</label>
                    <asp:TextBox ID="txtBuscar" class="form-control" runat="server" placeholder="Buscar por título"/>
                <label class="form-label" for="month">Mes</label>
                <select class="form-select" name="mesBusqueda" id="mesBusqueda">
                    <option selected disabled>Seleccione un mes</option>
                    <option value="1">Enero</option>
                    <option value="2">Febrero</option>
                    <option value="3">Marzo</option>
                    <option value="4">Abril</option>
                    <option value="5">Mayo</option>
                    <option value="6">Junio</option>
                    <option value="7">Julio</option>
                    <option value="8">Agosto</option>
                    <option value="9">Septiembre</option>
                    <option value="10">Octubre</option>
                    <option value="11">Noviembre</option>
                    <option value="12">Diciembre</option>
                </select>
                <label class="form-label" for="year">Año</label>
                <select class="form-select" name="anioBusqueda" id="anioBusqueda">
                    <option selected disabled>Seleccione un año</option>
                    <% foreach (var anio in GetAnios())
                       { %>
                            <option value="<%: anio %>"><%: anio %></option>
                    <% } %>
                </select>
                <div style="display: flex; justify-content: center; margin-top: 1.5rem ;">
                    <div class="input-group-text btn-group-sm">
                        <button type="button" class="btn btn-warning" style="margin-right: 0.25rem;" onclick="buscar();"><i class="fa-solid fa-magnifying-glass"></i> Buscar</button>
                        <button type="button" class="btn btn-secondary" onclick="limpiarBusqueda();"><i class="fa-solid fa-broom"></i> Limpiar</button>
                    </div>
                </div>
            </div>
            </div>
        </div>
        <div class="col">
            <!-- Tab panes -->
            <div class="tab-content">
            <!-- Panel de Mercado -->
            <%  bool isFirstCuerpo = true;
            foreach (var categoria in GetCategorias())
            {
                var idcategoria = categoria.id_categoria;
                string activeClass = isFirstCuerpo ? "active" : "";
                isFirstCuerpo = false;
            %>
                <div class="tab-pane container <%= activeClass %>" id="Categoria<%= categoria.id_categoria %>">
                    <!-- Reporte (importante cambiar los id) -->
                    <%
                    foreach (var reporte in GetReportes(idcategoria))
                    {
                    %>
                        <div class="accordion accordion-flush mb-3 informe" id="Reporte<%= reporte.id_reporte %>">
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="TituloReporte<%= reporte.id_reporte %>" style="text-align: center;">
                                    <button class="accordion-button collapsed btn-dark"
                                        style="background-color: <%= GetColor(reporte.id_color) %>; color: white; border-radius: 5px;" type="button"
                                        data-bs-toggle="collapse" data-bs-target="#DescripReporte<%= reporte.id_reporte %>" aria-expanded="false"
                                        aria-controls="DescripReporte<%= reporte.id_reporte %>">
                                        <%= reporte.titulo_reporte %> - Corte estadístico: <%= FormatFecha(reporte.fecha_reporte) %>
                                    </button>
                                </h2>
                                <div id="DescripReporte<%= reporte.id_reporte %>" class="accordion-collapse collapse"
                                    aria-labelledby="TituloReporte<%= reporte.id_reporte %>"
                                    data-bs-parent="#Reporte<%= reporte.id_reporte %>" style="background-color: rgb(234, 234, 255, 0.8);">
                                    <div class="accordion-body">
                                        <div class="row">
                                            <div class="col-md">
                                                <p><%= reporte.descripcion_reporte %></p>
                                            </div>
                                            <div class="col-sm-auto">
                                                <a class="btn btn-warning" href="<%: CargaDesdeDrive(reporte.url_reporte) %>" download="Reporte" onclick="Descargar(<%: reporte.id_reporte %>)">Descargar</a>
                                            </div>
                                        </div>
                                        <p><small class="text-muted">Fecha de publicación: <%= FormatFecha(reporte.fecha_publicacion) %></small></p>
                                        <p><small class="text-muted" id="descargaReporte<%: reporte.id_reporte %>"><%= reporte.numero_descargas %> Descarga(s)</small></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <% } %>
                    <!-- Fin Reporte -->
                </div>
            <% } %>
            
            </div>

        </div>
        </div>
    </div>
</div>

<script>
    function buscar() {
        var textoBusqueda = document.getElementById('<%= txtBuscar.ClientID %>').value;
        var selectedMonth = document.getElementById('mesBusqueda').value;
        var selectedYear = document.getElementById('anioBusqueda').value;

        var queryParams = [];

        if (textoBusqueda) {
            queryParams.push('textoBusqueda=' + encodeURIComponent(textoBusqueda));
        }

        if (selectedMonth && selectedMonth !== "Seleccione un mes") {
            queryParams.push('mesBusqueda=' + encodeURIComponent(selectedMonth));
        }

        if (selectedYear && selectedYear !== "Seleccione un año") {
            queryParams.push('anioBusqueda=' + encodeURIComponent(selectedYear));
        }

        var queryString = queryParams.join('&');

        window.location.href = 'Reportes.aspx' + (queryString ? '?' + queryString : '');
    }
    function limpiarBusqueda() {

        window.location.href = 'Reportes.aspx';
    }
    function Descargar(idReporte) {
        console.log("Este es el ID: " + idReporte);
        $.ajax({
            type: "POST",
            url: "Reportes.aspx/ActualizarReporte",
            data: JSON.stringify({ idReporte: idReporte }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var numeroDescargas = parseInt($("#descargaReporte" + idReporte).text());
                $("#descargaReporte" + idReporte).text((numeroDescargas + 1) + " Descarga(s)");
            },
            error: function (error) {
                console.error("Error al llamar a ActualizarReporte: ", error);
            }
        });
    }
</script>
</asp:Content>
