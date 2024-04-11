<%@ Page Title="Servicios" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Servicios.aspx.cs" Inherits="Datametrics.Servicios" %>

<asp:Content ID="ServiciosTitle" ContentPlaceHolderID="title" runat="server">
    InFactMetrycs - Servicios
</asp:Content>
<asp:Content ID="ServiciosHead" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="ServiciosBody" ContentPlaceHolderID="MainContent" runat="server">
    
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

    <!--Simulador de Cotizacion-->
    <div data-aos="fade-up" data-aos-anchor-placement="top-bottom">
        <div
            style="display:flex; height: 100px; align-items: center; justify-content: start; background-color: #181848; color: white; justify-content: center;">
            <h2 style="padding: 1rem;">Simulador de Cotización</h2>
        </div>
        <!--Servico a calcular-->
        <asp:UpdatePanel runat="server" UpdateMode="Conditional" ID="UpdatePanel1">
            <ContentTemplate>
                <div class="container border rounded-3" style="margin-top: 3rem; margin-bottom: 3rem; padding: 2rem;">
                    <div class="row">
                        <div class="col-sm py-2" style="text-align: start;">
                            <asp:Label runat="server" ID="lblCategoriaServicio" AssociatedControlID="ddlCategoriaServicio" CssClass="form-label">Categoría de servicio</asp:Label>
                            <asp:DropDownList runat="server" ID="ddlCategoriaServicio" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="ddlCategoriaServicio_SelectedIndexChanged">
                                <asp:ListItem Text="Seleccione una opción" Value="0" Selected="True" />
                            </asp:DropDownList>
                        </div>
                        <div class="col-sm py-2" style="text-align: start;">
                            <asp:Label runat="server" ID="lblServicio" AssociatedControlID="ddlServicio" CssClass="form-label">Servicio</asp:Label>
                            <asp:DropDownList runat="server" ID="ddlServicio" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="ddlServicio_SelectedIndexChanged">
                                <asp:ListItem Text="Seleccione una opción" Value="0" Selected="True" />
                            </asp:DropDownList>
                        </div>

                        <!--Calculadora-->
                            <asp:Panel runat="server" UpdateMode="Conditional" ID="UpdatePanelVariables" />
                            <asp:Label runat="server" ID="lblResultado" CssClass="form-label" Visible="false"></asp:Label>
                        <!--End Calculadora-->
                    </div>
                </div>
            </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="ddlCategoriaServicio" EventName="SelectedIndexChanged" />
                </Triggers>
        </asp:UpdatePanel>
        <!--Servico a calcular-->

        <div class="d-flex flex-row mt-5" style="justify-content: center;">
            <div class="col-sm-auto px-3">
                <asp:Button runat="server" ID="btnLimpiar" Text="Limpiar" OnClick="btnLimpiar_Click" CssClass="btn btn-secondary" />
            </div>
            <div class="col-sm-auto px-3">
                <asp:Button runat="server" ID="btnCalcular" Text="Calcular" OnClick="btnCalcular_Click" CssClass="btn btn-warning" CausesValidation="true" ValidationGroup="CalcularValidationGroup"/>
            </div>
        </div>
        <br />
    </div>
    <!--End Simulador de Cotizacion-->

    <% foreach(var categoria in GetCaregoria()){ %>
    <div class="text-center" style="border: none;">
            <div
                style="display:flex; height: 100px; align-items: center; justify-content: start; background-color: #181848; color: white; justify-content: center;">
                <h2 style="padding: 1rem;"><%= categoria.nombre_categoria %></h2>
            </div>
            <div class="p-5" style="min-height: 80vh; text-align: start;">
                <div class="container" style="padding: 2rem;">
                    <div class="row">
                    <%  int count = 0;
                        foreach (var servicio in GetServicio(categoria.id_categoria))
                        {
                            if (count > 0 && count % 2 == 0)
                            {%>
                                </div><div class="row">
                            <%} %>
                                <!--Card service-->
                                <div class="col-md" style="color: #181848;" data-aos="zoom-in-right"
                                    data-aos-anchor-placement="bottom-bottom">
                                    <div class="card p-3 mb-2" style="background-color: transparent; border: none;">
                                        <div class="d-flex justify-content-between">
                                            <div class="d-flex flex-row align-items-center">
                                                <div class="ms-3">
                                                    <h3 class="heading"><%= servicio.nombre_servicio %></h3>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="mt-5">
                                            <p style="text-align: justify; color: black;"><%= servicio.descripcion_servicio %></p>
                                            <% if (servicio.estadocalcu_servicio == "A")
                                                { %>
                                                <a class="btn btn-outline-success btn-sm" href="<%= CargaDesdeDrive(servicio.urlficha_servicio) %>">Conoce más <i class="fa-solid fa-arrow-right"></i></a>
                                            <%} %>
                                        </div>
                                    </div>
                                </div>
                            <!--End Card Service-->
                    <% count++;
                        } %>
                    </div>
                </div>
            </div>
        </div>
    <% } %>

</asp:Content>
