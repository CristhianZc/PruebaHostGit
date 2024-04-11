<%@ Page Title="Imagenes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RepoImagenes.aspx.cs" Inherits="Datametrics.Imagenes" %>

<asp:Content ID="ImagenesTitle" ContentPlaceHolderID="title" runat="server">
    InFactMetrycs - Repositorio de Imagenes
</asp:Content>
<asp:Content ID="ImagenesHead" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="ImagenesBody" ContentPlaceHolderID="MainContent" runat="server">
    
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
    <div class="text-center" style="padding-bottom: 2rem;">
        <div
            style="display:flex; height: 100px; align-items: center; justify-content: start; background-color: #181848; color: white; justify-content: center;">
            <h2 style="padding: 1rem;">Biblioteca de Imágenes</h2>
        </div>
        <div class="container py-3">
            <div class="row m-3">
                <form id="searchForm" action="RepoImagenes.aspx" method="GET">
                    <input type="hidden" name="textoBusqueda" id="searchText" value="" />
                    <input type="hidden" name="mesBusqueda" id="searchMonth" value="" />
                    <input type="hidden" name="anioBusqueda" id="searchYear" value="" />
                </form>
                <div class="col-sm mb-3">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <div class="input-group-text">Título</div>
                        </div>
                        <asp:TextBox ID="txtBuscar" class="form-control" runat="server" placeholder="Buscar por título"/>
                    </div>
                </div>
                <div class="col-sm mb-3">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <div class="input-group-text">Mes</div>
                        </div>
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
                    </div>
                </div>
                <div class="col-sm mb-3">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <div class="input-group-text">Año</div>
                        </div>
                        <select class="form-select" name="anioBusqueda" id="anioBusqueda">
                            <option selected disabled>Seleccione un año</option>
                            <% foreach (var anio in GetAnios())
                               { %>
                                    <option value="<%: anio %>"><%: anio %></option>
                            <% } %>
                        </select>
                    </div>
                </div>
                <div class="col">
                    <button type="button" class="btn btn-warning" style="margin-right: 0.25rem;" onclick="buscar();"><i class="fa-solid fa-magnifying-glass"></i> Buscar</button>
                    <button type="button" class="btn btn-secondary" onclick="limpiarBusqueda();"><i class="fa-solid fa-broom"></i> Limpiar</button>   
                </div>
            </div>
            <div class="row mb">
                <%
                    int cont = 0;
                    foreach (var img in CargaImagenes())
                    {
                        if ((cont / 9)+1 == pagina)
                        {
                            %>
                        <div class="col-sm py-3 d-flex justify-content-center">
                            <div class="card" style="width: 18rem;">
                                <a href="<%= img.url_imagen %>" data-fancybox="gallery"
                                    data-download-src="<%= img.url_imagen %>">
                                    <img loading="lazy" src="<%= img.url_imagen %>" class="card-img-top"
                                        alt="<%= img.titulo_imagen %>" />
                                </a>
                                <div class="card-body">
                                    <h5 class="card-title" style="font-weight: bold; color: #181848;"><%= img.titulo_imagen %></h5>
                                    <p class="card-text"><%= img.descripcion_imagen %></p>
                                    <p class="card-text"><small class="text-muted"><%= FormatoFecha(img.fecha_publicacion) %></small></p>
                                </div>
                            </div>
                        </div>
                        <% }
                                cont++;
                    } %>
            </div>
            <div class="demo">
                <nav class="pagination-outer" aria-label="Page navigation">
                    <ul class="pagination">
                        <li class="page-item">
                            <a href="RepoImagenes.aspx?page=<%: $"{pagina-1}" %>" class="page-link" aria-label="Previous">
                                <span aria-hidden="true">«</span>
                            </a>
                        </li>
                        <% for (int i = 1; i <= (CargaImagenes().Count()/9)+1; i++)
                            {
                                if (i == pagina)
                                {
                                    %>
                                    <li class="page-item active"><a class="page-link" href="RepoImagenes.aspx?page=<%: $"{i}" %>"><%: $"{i}" %></a></li>
                              <%}else
                                { %>
                                    <li class="page-item"><a class="page-link" href="RepoImagenes.aspx?page=<%: $"{i}" %>"><%: $"{i}" %></a></li>
                              <%}
                             } %>
                        <li class="page-item">
                            <a href="RepoImagenes.aspx?page=<%: $"{pagina+1}" %>" class="page-link" aria-label="Next">
                                <span aria-hidden="true">»</span>
                            </a>
                        </li>
                    </ul>
                </nav>
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

        window.location.href = 'RepoImagenes.aspx' + (queryString ? '?' + queryString : '');
    }

    function limpiarBusqueda() {

        window.location.href = 'RepoImagenes.aspx';
    }
</script>
</asp:Content>
