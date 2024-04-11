<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Datametrics._Default" %>

<asp:Content ID="HomeTitle" ContentPlaceHolderID="title" runat="server">
    InFactMetrycs - Observatorio
</asp:Content>
<asp:Content ID="HomeHead" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="HomeBody" ContentPlaceHolderID="MainContent" runat="server">
    
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

<%--<div class="container">--%>
    <!--Reporte 1-->
    <div class=" mb-3" style="padding-bottom: 2rem;">
        <div
            style="display: flex; margin-left: 4rem; height: 100px; align-items: center; justify-content: start; background-color: #181848; color: #ffffff;">
            <h2 style="padding: 1rem;">Visualizador de Datos</h2>
        </div>
        <br />
        <% foreach (var darboard in CargaDashboards())
            { %>
        <div class="container" style="padding-bottom: 2rem;">
            <h3><%= darboard.titulo_dashboard %></h3>
            <span class="d-block f-12 mb-1" style="color: #757575;"><%= darboard.fuente_dashboard %></span>
            <div class="ratio ratio-16x9">
                <iframe loading="lazy" src="<%= darboard.url_dashboard %>" width="70%" height="200px" title="<%= darboard.titulo_dashboard %>"
                    allowfullscreen></iframe>
            </div>
        </div>
        <%} %>
    </div>
      
    <!---Data Academy-->
    <div class="text-center mb-3"
        style="background: linear-gradient(0deg, rgba(0, 0, 0, 0.20) 0%, rgba(0, 0, 0, 0.20) 100%),  url(../Imagenes/back.jpg); background-position: center; background-repeat: no-repeat; background-size: cover; padding-bottom: 2rem;">
        <div
            style="display: flex; margin-left: 4rem; height: 100px; align-items: center; justify-content: start; background-color: #181848; color: white;">
            <a style="text-decoration: none; color: #ffffff;" href="DataAcademy.aspx"><h2 style="padding: 1rem;">Data Academy </h2></a>
        </div>
        <div class="container">
            <div id="carouselDataAcademy" class="carousel slide" data-bs-ride="carousel"
                    style="padding-bottom: 2rem; min-height: 500px;">
                    <div class="carousel-inner"
                        style="display: flex; align-items: center; min-height: inherit; padding-left: 1vh;">
                    <%  var isFirst = true;
                        foreach (var curso in CargaCursos())
                        { %>
                            <div class="carousel-item <%= isFirst ? " active" : "" %>" style="background: white; border-radius: 20px; border: 1px solid #181848;">
                            <div class="container">
                                <div class="row">
                                    <div class="col mb-3" style="display: flex; justify-content: center; min-height: 400px;">
                                            <div class="row g-0">
                                                <div class="col-md" style="display: flex; align-items: center;">
                                                <img loading="lazy" src="<%= curso.url_imagen %>" class="img-fluid rounded-start"
                                                    alt="<%= curso.titulo_curso %>">
                                                </div>
                                                <div class="col-md" style="display: flex; align-items: center;">
                                                    <div class="card-body">
                                                        <div>
                                                            <h2 class="card-title" style="text-align: center;"><%= curso.titulo_curso %></h2>
                                                        </div>
                                                        <p style="font-size: small; padding-top: 2rem;"><%= curso.descripcion_curso %></p>
                                                        <div style="display: flex; justify-content: center;">
                                                            <a class="btn btn-warning" href="DataAcademy.aspx">Visita Data Academi</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                    </div>
                                </div>
                            </div>
                            </div>
                    <% isFirst = false;} %>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselDataAcademy"
                        data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true" style="background-color: black; border-radius: 75%;"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselDataAcademy"
                        data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true" style="background-color: black; border-radius: 75%;"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
            </div>
        </div>
    </div>

    <!---Biblioteca de Reportes-->
    <div class="text-center mb-3" style="padding-bottom: 2rem;">
        <div
            style="display: flex; margin-left: 4rem; height: 100px; align-items: center; justify-content: start; background-color: #181848; color: white;">
            <a style="text-decoration: none; color: #ffffff;" href="Reportes.aspx"><h2 style="padding: 1rem;">Biblioteca de Reportes</h2></a>
        </div>
        <div class="container" style="margin-top: 2rem;">
            <div class="row">
            <div class="col mb-3" style="display: flex; justify-content: center;">
                <div class="card mb-3" style="min-height: 500px; border: none; display: flex; justify-content: center; padding: 1rem; box-shadow:
                12.5px 12.5px 10px rgba(0, 0, 0, 0.055)">
                    <div class="row g-0">
                        <div class="col-md" style="display: flex; align-items: center;">
                            <div class="card-body">
                                <p class="card-text" style="font-size: medium; padding: 1.5rem;">En nuestra biblioteca de Reportes podrás encontrar una reseña histórica de documentos con información económica de relevancia, permitiendo a los usuarios empaparse con estadísticas y data histórica de la macroeconomía del Ecuador.</p>
                                <div style="margin: 1rem;">
                                    <a class="btn btn-warning" href="Reportes.aspx"> Visita la Biblioteca</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md">
                            <img loading="lazy" src="../Imagenes/mision.jpg" class="img-fluid rounded-start" width="540" height="360" alt="Biblioteca de imagenes">
                        </div>
                    </div>
                </div>
            </div>
            </div>
        </div>
    </div>

    <!---Servicios-->
    <div class="text-center mb-3" style="padding-bottom: 2rem;">
        <div
            style="display: flex; margin-left: 4rem; height: 100px; align-items: center; justify-content: start; background-color: #181848; color: white;">
            <a style="text-decoration: none; color: #ffffff;" href="Servicios.aspx"><h2 style="padding: 1rem;">Servicios</h2></a>
        </div>
        <div class="container">
            <div class="row" style="display: flex; justify-content: center;">
                <%  int count = 0;
                    foreach (var cateServis in CargaCategoriaServicios())
                    { 
                        if (count > 0 && count % 3 == 0)
                        {
                            %></div><div class="row" style="display: flex; justify-content: center;"><%
                        }
                        %>
                <div class="col-md-3 py-3 d-flex justify-content-center">
                    <div class="card" style="width: 18rem;">
                        <div class="col d-flex" style="justify-content: center;">
                            <img loading="lazy" src="<%= cateServis.UrlIcono %>" class="card-img-top"
                                alt="<%= cateServis.Categoria.nombre_categoria %>" style="object-fit: none; width: 130px; height: 130px;"/>
                        </div>                          
                        <div class="card-body">
                            <h5 class="card-title" style="font-weight: bold; color: #181848;"><%= cateServis.Categoria.nombre_categoria %></h5>
                            <ul style="font-size: smaller; text-align: start;">
                                <% foreach (var servicio in CargaServicio(cateServis.Categoria.id_categoria))
                                    { %>
                                <li><%= servicio.nombre_servicio %>.</li>
                                <% } %>
                            </ul>
                        </div>
                    </div>
                </div>
                <% count++; } %>
            </div>
        </div>
    </div>

    <!---Contactanos-->
    <div class=" mb-3" style="padding-bottom: 2rem;">
        <div
            style="display: flex; margin-left: 4rem; height: 100px; align-items: center; justify-content: start; background-color: #181848; color: #ffffff;">
            <h2 style="padding: 1rem;" id="contactSection">Contacto</h2>
        </div>
        <div class="container" style="padding: 0 3rem;">
            <div class="row">
                <div class="col-md-6 d-flex" style="justify-content: center; align-items: center;">
                    <div>
                        <h2>InFactMetrycs</h2>
                    <p style="width: 90%; margin-top: 2rem;">
                        Si necesitas un servicio más personalizado no dudes en contactarte con nosotros, nuestro servicio brinda consultorías estadística, económica y de inteligencia de negocios. Escríbenos y solventaremos tus inquietudes. 
                    </p>
                    </div>
                </div>
                <div class="col-md-6" style="margin-top: 2rem; padding: 1.5rem;">
                    <label class="form-label" for="nombre">Nombre</label>
                    <asp:TextBox ID="txtnombre" type="text" placeholder="Escribe tu nombre" class="form-control" runat="server"/>
                    <label class="form-label" for="email">Email</label>
                    <asp:TextBox ID="txtemail" type="email" placeholder="Escribe tu email" class="form-control" runat="server"/>
                    <label class="form-label" for="message">Mensaje</label>
                    <asp:TextBox ID="txtmessage" TextMode="MultiLine" placeholder="Dejanos un mensaje" CssClass="form-control" Rows="5" Columns="30" runat="server"/>
                    <div style="width: 100%; padding-right: 1.5rem; display: flex; justify-content: end; margin-top: 2rem;">
                        <asp:Button runat="server" ID="btnEnviaCorreo" Text="Enviar Mensaje" OnClick="EnviaCorreo" CssClass="btn btn-warning" />
                    </div>
                </div>
            </div>
        </div>
    </div>
<%--</div>--%>
<script>
    function MostrarAlertaExito() {
        alert('El correo ha sido enviado con éxito.');
    }

    function MostrarAlertaError() {
        alert('Error al enviar el correo. Por favor, inténtelo de nuevo.');
    }
</script>
</asp:Content>
