<%@ Page Title="Nosotros" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Nosotros.aspx.cs" Inherits="Datametrics.About" %>

<asp:Content ID="NosotrosTitle" ContentPlaceHolderID="title" runat="server">
    InFactMetrycs - Nosotros
</asp:Content>
<asp:Content ID="NosotrosHead" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="NosotrosBody" ContentPlaceHolderID="MainContent" runat="server">
 
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

    <div
        style="display:flex; height: 100px; align-items: center; justify-content: start; background-color: #181848; color: white; justify-content: center;">
        <h2 style="padding: 1rem;">Nosotros</h2>
    </div>
    <div class="container">
        <div class="row" data-aos="zoom-in-right"
        data-aos-anchor-placement="bottom-bottom">
            <div class="col mb-3" style="display: flex; justify-content: center;">
                <div class="card mb-3" style="max-width: 80%; border: none; min-height: 350px; display: flex; justify-content: center; padding: 1rem; box-shadow:
                12.5px 12.5px 10px rgba(0, 0, 0, 0.055),
                100px 100px 80px rgba(0, 0, 0, 0.11);">
                    <div class="row g-0">
                        <div class="col-md-8">
                            <div class="card-body">
                                <div
                                    style="border-bottom: 5px solid #F0A818; width: fit-content; margin-bottom: 10px;">
                                    <h5 class="card-title">Misión</h5>
                                </div>
                                <p class="card-text">Proveer información estadística y económica para aportar soluciones 
                                    reales a las necesidades de todos los agentes económicos, impulsando su crecimiento al 
                                    desarrollar sus conocimientos económicos y estadísticos para optimizar sus resultados.</p>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <img loading="lazy" src="../Imagenes/mision.jpg" class="img-fluid rounded-start" width="290" height="200" alt="Misión InfactMetrics">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row" data-aos="zoom-in-left"
        data-aos-anchor-placement="bottom-bottom">
            <div class="col mb-3" style="display: flex; justify-content: center;">
                <div class="card mb-3" style="max-width: 80%; border: none; min-height: 350px; display: flex; justify-content: center; padding: 1rem; box-shadow:
                -12.5px 12.5px 10px rgba(0, 0, 0, 0.055),
                -100px 100px 80px rgba(0, 0, 0, 0.11);">
                    <div class="row g-0">
                        <div class="col-md-4">
                            <img loading="lazy" src="../Imagenes/vision.jpg" class="img-fluid rounded-start" width="290" height="200" alt="Visión InfactMetrics">
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <div
                                    style="border-bottom: 5px solid #F0A818; width: fit-content; margin-bottom: 10px;">
                                    <h5 class="card-title">Visión</h5>
                                </div>
                                <p class="card-text">Ser una fuente de información centralizada y confiable referente 
                                    a estadística y económica del Ecuador, a través de la calidad de nuestros servicios, 
                                    nuestro compromiso y la resolución profesional de las necesidades de nuestros clientes 
                                    y usuarios.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Nuestro Servicios -->
    <div
        style="display:flex; height: 100px; align-items: center; justify-content: start; background-color: #181848; color: white; justify-content: center;">
        <h2 style="padding: 1rem;">Nuestros Servicios</h2>
    </div>
    <div class="p-5 text-center bg-image" style="
            background-image: url('../Imagenes/services.jpg');
            box-shadow: inset 0 0 0 2000px rgba(1, 1, 1, 0.7);
            background-size: cover;
            background-repeat: no-repeat;
            min-height: 80vh;
            display: flex;
            align-items: center;
            background-position: center center;">
        <div class="container" style="padding: 2rem;">
            <div class="row">
                <!--Card service-->
                <%  int count = 0;
                    foreach (var servicio in CargaCategoriaServicios())
                        { 
                        if (count > 0 && count % 2 == 0)
                        {
                            %></div><div class="row"><%
                        }
                        %>
                        <div class="col-md" style="color: white; display: flex; justify-content: center;">
                            <div class="card p-3 mb-2" style="background-color: transparent; border: none;">
                                <div class="d-flex justify-content-between">
                                    <div class="d-flex flex-row align-items-center">
                                        <div class="icon px-2" style="scale: 2;"> <i class="<%= servicio.icono %>"></i>
                                        </div>
                                        <div class="ms-3">
                                            <h3 class="heading"><%= servicio.Categoria.nombre_categoria %></h3>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <!--End Card Service-->
                <% count++; } %>
            </div>
        </div>
    </div>
    <!-- End Nuestro Servicios -->
    <!-- Nuestro Equipo -->
    <div
        style="display:flex; height: 100px; align-items: center; justify-content: start; background-color: #181848; color: white; justify-content: center;">
        <h2 style="padding: 1rem;">Nuestro Equipo</h2>
    </div>
    
    <div class="container"
        style="padding: 3rem 7rem; min-height: 80vh; display: flex; align-items: center; justify-content: center;">
        <div class="row">
            <% foreach (var colaborador in CargaColaborador())
                { %>
                <div class="col-md-auto mb-3">
                    <div class="card" style="width: 18rem;">
                        <img loading="lazy" src="<%= colaborador.url_foto %>" height="220" width="290" class="card-img-top" alt="Colaborador <%= colaborador.nombre_colaborador %>">
                        <div class="card-body">
                            <h5 class="card-title" style="text-align: center; margin-top: 0; padding-top: 0;"><%= colaborador.nombre_colaborador %></h5>
                        </div>
                        <div class="accordion accordion-flush" id="accordionFlush1">
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="flush-headingOne" style="text-align: center;">
                                    <button class="accordion-button collapsed"
                                        style="color: #F0A818; border-bottom: 2px solid #F0A818;" type="button"
                                        data-bs-toggle="collapse" data-bs-target="#flush-collapse<%=colaborador.id_colaborador %>"
                                        aria-expanded="false" aria-controls="flush-collapseOne">
                                        <%= colaborador.cargo_colaborador %>
                                    </button>
                                </h2>
                                <div id="flush-collapse<%=colaborador.id_colaborador %>" class="accordion-collapse collapse"
                                    aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlush1">
                                    <div class="accordion-body" style="text-align: center;">
                                        <%if (!string.IsNullOrEmpty(colaborador.descripcion_colaborador)){ %>
                                        <p><%= colaborador.descripcion_colaborador %></p>
                                        <%} %>
                                             <button onclick="window.open('<%= colaborador.likedin_colaborador %>', '_blank')"
                                                style="border:none; color: #181848; background-color: transparent; width: fit-content;"><i
                                                    class="fa-brands fa-linkedin"></i> Linkedin</button>
                                        <br>
                                            <a style="border:none; color: #181848; background-color: transparent; width: fit-content; text-decoration: none"
                                                href="<%: CargaDesdeDrive(colaborador.url_cv) %>" download="Reporte"> <i
                                                    class="fa-solid fa-file-arrow-down"></i> Descargar CV</a>
                                        <%if (!string.IsNullOrEmpty(colaborador.email_colaborador)){ %>
                                        <a class="e-mailCol" href="mailto:<%= colaborador.email_colaborador%>"><%= colaborador.email_colaborador %></a>
                                        <%} %>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <% } %>
        </div>
    </div>
    <!-- End Nuestro Equipo -->
</asp:Content>
