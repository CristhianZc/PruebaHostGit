<%@ Page Async="true" Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Datametrics.Contact" %>

<asp:Content ID="ContactTitle" ContentPlaceHolderID="title" runat="server">
    InFactMetrycs - Apis Abiertas
</asp:Content>
<asp:Content ID="ContactHead" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="ContactBody" ContentPlaceHolderID="MainContent" runat="server">
    
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
                            <a style="color: white; font-style: italic;" href="<%: CargaDesdeDrive(banner.url_reporte) %>" download="Reporte">
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
    <div class="text-center mb-3" style="padding-bottom: 2rem;">
        <div
            style="display:flex; height: 100px; align-items: center; justify-content: start; background-color: #181848; color: white; justify-content: center;">
            <h2 style="padding: 1rem;">Apis Abiertas</h2>
        </div>
    </div>

    <div class="tab-pane container">
        <div class="row p-2 bg-white border rounded mb-3">
            <div class="col-md mt-1" style="display: grid; align-content: center;">
                <p class="text-justify mb-0" style="font-size: large; text-align: justify;">¿Te imaginas poder conectar tus aplicaciones favoritas de forma rápida y sencilla para potenciar su funcionalidad? 
                    ¡Eso es posible gracias a las APIs Abiertas! Las Interfaces de Programación de Aplicaciones son como puentes digitales que permiten que diferentes sistemas se comuniquen entre sí de manera eficiente. 
                    Y las APIs Abiertas son como los caminos abiertos al mundo digital, disponibles para ti y cualquier desarrollador que quiera aprovechar su potencial.<br><br></p>   
            </div>
        </div>
    </div>
    <br />
    <!---Hero Section-->
    <div class="text-center mb-3" style="padding-bottom: 2rem;">
        <div
            style="display: flex; margin-left: 4rem; height: 100px; align-items: center; justify-content: start; background-color: #181848; color: white;">
            <a style="text-decoration: none; color: #ffffff;" href="https://statistics.cepal.org/portal/cepalstat/index.html?lang=es" target="_blank"><h2 style="padding: 1rem;">CEPALSTAT</h2></a>
        </div>
    </div>
    <!-- Contenedor de la seccion-->
    <div class="container" style="padding: 3rem; min-height: 80vh;">
        <div class="row mt-3">
            <div class="col" style="display: flex; justify-content: center; overflow-x: overlay;">
                <!-- Nav tabs -->
                <ul class="nav nav-pills mb-3 shadow-sm"
                    style="flex-wrap: nowrap; width: 100%; justify-content: center;">
                    <% bool isFirst = true;
                        foreach(dynamic level in apiCepal)
                    {
                            string activeClass = isFirst ? "active" : "";
                            isFirst = false; %>
                            <li class="nav-item px-3">
                                <a class="nav-link <%= activeClass %>" data-bs-toggle="pill" href="#order<%= level["order"] %>area<%= level["area_id"] %>">
                                    <h3><%= level["name"] %></h3>
                                </a>
                            </li>
                       <%
                    } %>
                </ul>
            </div>
        </div>

        <div class="row">
            <div class="col">
                <!-- Tab panes -->
                <div class="tab-content">
                    <%  bool isFirstAcordion = true;
                        foreach(dynamic level in apiCepal)
                    {
                           string activeClass = isFirstAcordion ? "active" : "";
                            isFirstAcordion = false;%>
                           <div class="tab-pane container <%= activeClass %>" id="order<%= level["order"] %>area<%= level["area_id"] %>">
                           <% foreach (dynamic level2 in level["children"])
                            {%>
                               <div class="accordion-item">
                                   <h2 class="accordion-header" id="area<%= level2["area_id"] %>">
                                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                            data-bs-target="#order<%= level2["area_id"] %>" aria-expanded="true" aria-controls="order<%= level2["area_id"] %>">
                                            <%= level2["name"] %>
                                        </button>
                                    </h2>
                                    <div id="order<%= level2["area_id"] %>" class="accordion-collapse collapse" aria-labelledby="area<%= level2["area_id"] %>">
                                        <div class="accordion-body" id="sub-area<%= level2["area_id"] %>">
                                       <% foreach (dynamic level3 in level2["children"])
                                        {%>
                                            <div class="accordion-item">
                                                <h2 class="accordion-header" id="area<%= level3["area_id"] %>">
                                                    <button class="accordion-button collapsed" type="button"
                                                        data-bs-toggle="collapse" data-bs-target="#order<%= level3["area_id"] %>"
                                                        aria-expanded="true" aria-controls="order<%= level3["area_id"] %>">
                                                        <%= level3["name"] %>
                                                    </button>
                                                </h2>
                                                <div id="order<%= level3["area_id"] %>" class="accordion-collapse collapse"
                                                    aria-labelledby="area<%= level3["area_id"] %>" data-bs-parent="#sub-area<%= level2["area_id"] %>">
                                                    <div class="accordion-body" id="sub-area<%= level3["area_id"] %>">
                                                        <%
                                                            foreach (dynamic level4 in level3["children"])
                                                            {%>
                                                            
                                                            <%  if (level4.ContainsKey("children"))
                                                                {%>
                                                                    <div class="accordion-item">
                                                                        <h2 class="accordion-header"
                                                                            id="area<%= level4["area_id"] %>">
                                                                            <button class="accordion-button collapsed" type="button"
                                                                                data-bs-toggle="collapse"
                                                                                data-bs-target="#order<%= level4["area_id"] %>"
                                                                                aria-expanded="true"
                                                                                aria-controls="order<%= level4["area_id"] %>">
                                                                                <%= level4["name"] %>
                                                                            </button>
                                                                        </h2>
                                                                        <div id="order<%= level4["area_id"] %>"
                                                                            class="accordion-collapse collapse"
                                                                            aria-labelledby="area<%= level4["area_id"] %>"
                                                                            data-bs-parent="#sub-area<%= level3["area_id"] %>">
                                                                            <div class="accordion-body" id="sub-area<%= level4["area_id"] %>">
                                                                               <% foreach (dynamic level5 in level4["children"])
                                                                                {%>
                                                                                    <%  if (level5.ContainsKey("children"))
                                                                                        {%>
                                                                                            <div class="accordion-item">
                                                                                                <h2 class="accordion-header"
                                                                                                    id="area<%= level5["area_id"] %>">
                                                                                                    <button class="accordion-button collapsed" type="button"
                                                                                                        data-bs-toggle="collapse"
                                                                                                        data-bs-target="#order<%= level5["area_id"] %>"
                                                                                                        aria-expanded="true"
                                                                                                        aria-controls="order<%= level5["area_id"] %>">
                                                                                                        <%= level5["name"] %>
                                                                                                    </button>
                                                                                                </h2>
                                                                                                <div id="order<%= level5["area_id"] %>"
                                                                                                    class="accordion-collapse collapse"
                                                                                                    aria-labelledby="area<%= level5["area_id"] %>"
                                                                                                    data-bs-parent="#sub-area<%= level4["area_id"] %>">
                                                                                                    <div class="accordion-body">
                                                                                                       <% foreach (dynamic level6 in level5["children"])
                                                                                                        {%>
                                                                                                            <div class="row border border-1">
                                                                                                                <div class="col-auto">
                                                                                                                    <p class="fs-6"><%= level6["name"] %></p>
                                                                                                                </div>
                                                                                                                <div class="col-sm">
                                                                                                                    <a class="btn btn-outline-success download-btn" href="https://api-cepalstat.cepal.org/cepalstat/api/v1/indicator/<%: level6["indicator_id"] %>/records?lang=es&format=excel" download="<%= level6["name"] %>" onclick="startDownload(this)"> Descargar</a>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        <%}%>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        <%}
                                                                                        else
                                                                                        {%>
                                                                                                <div class="row border border-1">
                                                                                                    <div class="col-auto">
                                                                                                        <p class="fs-6"><%= level5["name"] %></p>
                                                                                                    </div>
                                                                                                    <div class="col-sm">
                                                                                                        <a class="btn btn-outline-success download-btn" href="https://api-cepalstat.cepal.org/cepalstat/api/v1/indicator/<%: level5["indicator_id"] %>/records?lang=es&format=excel" download="<%= level5["name"] %>" onclick="startDownload(this)"> Descargar</a>
                                                                                                    </div>
                                                                                                </div>
                                                                                            <%
                                                                                        }%>
                                                                                <%}%>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                <%}
                                                                else
                                                                {%>
                                                                        <div class="row border border-1">
                                                                            <div class="col-auto">
                                                                                <p class="fs-6"><%= level4["name"] %></p>
                                                                            </div>
                                                                            <div class="col-sm">
                                                                                <a class="btn btn-outline-success download-btn" href="https://api-cepalstat.cepal.org/cepalstat/api/v1/indicator/<%: level4["indicator_id"] %>/records?lang=es&format=excel" download="<%= level4["name"] %>" onclick="startDownload(this)"><i class="fa-solid fa-table"></i> Descargar</a>
                                                                            </div>
                                                                        </div>
                                                                    <%
                                                                }%>
                                                            <%}%>
                                                    </div>
                                                </div>
                                            </div>
                                            <%}%>
                                        </div>
                                    </div>
                                </div>
                            <%}%>
                            </div>
                        <%
                    } %>
                </div>
            </div>
        </div>
    </div>

<script>
    function startDownload(link) {

        link.dataset.originalText = link.innerText;
        link.innerText = 'Descargando...';

        setTimeout(function () {
            link.innerText = link.dataset.originalText;
        }, 8000); 
    }
</script>
</asp:Content>
