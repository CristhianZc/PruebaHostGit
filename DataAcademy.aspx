<%@ Page Title="Data Academy" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DataAcademy.aspx.cs" Inherits="Datametrics.DataAcademy" %>

<asp:Content ID="AcademyTitle" ContentPlaceHolderID="title" runat="server">
    InFactMetrycs - Data Academy
</asp:Content>
<asp:Content ID="AcademyHead" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="AcademyBody" ContentPlaceHolderID="MainContent" runat="server">
    <%--<div class="container-fluid">--%>
        <div id="carouselDataAcademy" class="carousel slide" data-bs-ride="carousel" style="padding-bottom: 2rem;">
            <div class="carousel-inner">
                <% var isFirstD = true;
                    foreach (var banner in BannerDataAcademy())
                    { %>
                    <div class="carousel-item <%= isFirstD ? " active" : "" %>">
                        <img loading="lazy" src="<%= banner.url_banner %>" class="d-block w-100" alt="<%= banner.titulo_banner %>">
                    </div>
                <% isFirstD = false;} %>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselDataAcademy"
                data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselDataAcademy"
                data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    <%--</div>--%>

    <div class="mb-3" style="padding-bottom: 2rem;">
        <div
            style="display:flex; height: 100px; align-items: center; justify-content: start; background-color: #181848; color: white; justify-content: center;">
            <h2 style="padding: 1rem;">Data Academy</h2>
        </div>
        
        <!-- Contenedor de la seccion-->
        <div class="container" style="padding: 3rem; min-height: 80vh;">
          <div class="row d-flex justify-content-center align-items-center">
            <div class="col-md">
              <div class="search">
                <div class="input-group">
                    <asp:TextBox ID="txtBuscar" class="form-control" runat="server" placeholder="Análisis de Datos, Power BI, Python..." />
                    <div class="input-group-prepend">
                        <div class="input-group-text btn-group-sm">
                            <button type="button" class="btn btn-warning" style="margin-right: 0.25rem;" onclick="buscar();"><i class="fa-solid fa-magnifying-glass"></i> Buscar</button>
                            <button type="button" class="btn btn-secondary" onclick="limpiarBusqueda();"><i class="fa-solid fa-broom"></i> Limpiar</button>
                        </div>
                    </div>
                </div>
              </div>
            </div>
          </div>
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
                            <h3><%= categoria.nombre_categoria %></h3>
                        </a>
                    </li>
                <% } %>
              </ul>
            </div>
          </div>
          <div class="row">
            <div class="col">
              <!-- Tab panes -->
              <div class="tab-content">
                <!-- Panel de Cursos 1 -->
                <% bool isFirstCuerpo = true;
                    foreach (var categoria in GetCategorias())
                    { 
                        var idcategoria = categoria.id_categoria;
                        string activeClass = isFirstCuerpo ? "active" : "";
                        isFirstCuerpo = false;
                %>
                    <div class="tab-pane container <%= activeClass %>" id="Categoria<%= categoria.id_categoria %>">
                      <!-- Course Card-->
                        <% foreach (var curso in GetCurso(categoria.id_categoria))
                            { %>
                            <div class="row p-2 bg-white border rounded mb-3 TituloCurso" id="curso<%= curso.id_curso %>">
                                <div class="col-md-4 mt-1">
                                    <img loading="lazy" style="height: 85%;" class="img-fluid img-responsive rounded" src="<%= curso.url_imagen %>" alt="<%= curso.titulo_curso %>">
                                </div>
                                <div class="col-md mt-1" style="display: grid; align-content: center;">
                                  <h4><%= curso.titulo_curso %></h4>
                                  <div class="d-flex flex-row">
                                    <div class="ratings mr-2">
                                        <!-- Estrellas del curso -->
                                      <ul class="list-inline small">
                                        <% for (int i = 1; i <= 5; i++)
                                            {
                                                if (i <= curso.estrellas_curso)
                                                {%>
                                                    <li class="list-inline-item m-0"><i class="fa fa-star text-warning"></i></li>
                                                <%}
                                                    else if ((curso.estrellas_curso + 1 - i) > 0)
                                                    {%>
                                                    <li class="list-inline-item m-0"><i class="fa fa-star-half-alt text-warning"></i></li>
                                                <%}
                                                    else
                                                    {%>
                                                    <li class="list-inline-item m-0"><i class="fa-regular fa-star text-warning"></i></li>
                                                <%}
                                            }%>
                                      </ul>
                                    </div>
                                  </div>
                                  <p class="text-justify mb-0" style="font-size: small;"><%= curso.descripcion_curso %><br><br></p>
                                  <div>
                                    <ul class="list-inline list-inline-dotted mb-3 mb-lg-2">
                                        <% foreach (var herramienta in GetHerramientasCurso(curso.id_curso))
                                            {%>
                                                <li class="list-inline-item" style="color: dimgrey; font-size: smaller;"><%= herramienta.nombre_herrramienta %></li>
                                            <%}%>
                                    </ul>
                                  </div>
                                  <div class="d-flex flex-column mt-4" style="align-items: end;">
                                        <button class="btn btn-outline-success btn-sm" type="button" data-bs-toggle="modal" data-bs-target="#video<%= curso.id_curso %>">Conoce más <i class="fa-solid fa-arrow-right"></i></button>
                                  </div>
                                </div>
                            </div>
                            <!-- Modal of the course -->
                            <div class="modal fade" id="video<%= curso.id_curso %>" tabindex="-1" role="dialog" aria-labelledby="videoModal" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="tituloModal<%= curso.id_curso %>"><%= curso.titulo_curso %></h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="mb-3" style="position:relative;padding-bottom:56.25%;height:0;overflow:hidden;"> 
                                        <iframe loading="lazy" style="width:100%;height:100%;position:absolute;left:0px;top:0px;overflow:hidden" frameborder="0" type="text/html" src="<%= curso.url_video %>" width="100%" height="100%" allowfullscreen title="<%= curso.titulo_curso %>" allow="autoplay"> </iframe> 
                                        </div>
                                        <div class="row mb-3">
                                        <div class="col">
                                            <a class="btn" href="<%= CargaDesdeDrive(curso.urlhtml_curso) %>">
                                            Preparate para el curso <i class="fa-solid fa-file"></i>
                                            </a>
                                        </div>
                                        <div class="col">
                                            <a class="btn" href="<%= CargaDesdeDrive(curso.urlsilabo_curso) %>">
                                            Sílabo <i class="fa-solid fa-book"></i>
                                            </a>
                                        </div>
                                        </div>
                                        <div class="row mb-3">
                                            <a class="btn btn-success" style="width: 100%;" href="https://wa.me/593998788651?text=Hola,%20estoy%20interesado%20en%20este%20curso%20<%= curso.titulo_curso %>" target="_blank" rel="noopener noreferrer">
                                            <i class="fa-brands fa-whatsapp"></i> Escríbenos
                                            </a>
                                        </div>
                                    </div>
                                    </div>
                                </div>
                            </div>
                        <% } %>
                      <!-- End Course Card-->
                    </div>
                <% } %>
              </div>
            </div>
          </div>
        </div>
    </div>
    <script>
        function handleKeyPress(e) {
            var key = e.which || e.keyCode;
            if (key === 13) {
                buscar();
                return false;
            }
            return true;
        }

        function buscar() {
            var textoBusqueda = document.getElementById('<%= txtBuscar.ClientID %>').value;
            window.location.href = 'DataAcademy.aspx?textoBusqueda=' + encodeURIComponent(textoBusqueda);
        }
        function limpiarBusqueda() {
            
            window.location.href = 'DataAcademy.aspx';
        }
    </script>
</asp:Content>
