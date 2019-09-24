<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EmployeesASPX._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        $(function () {
            $(document).ready(function () {
                var url = "/Default.aspx/GetAllEmployees";

                $.ajax({
                    type: "GET",                                              // tipo de request que estamos generando
                    url: 'Default.aspx/GetOneEmployee',                    // URL al que vamos a hacer el pedido
                    data: null,                                                // data es un arreglo JSON que contiene los parámetros que 
                    // van a ser recibidos por la función del servidor
                    contentType: "application/json; charset=utf-8",            // tipo de contenido
                    dataType: "json",                                          // formato de transmición de datos
                    async: true,                                               // si es asincrónico o no
                    success: function (resultado) {                            // función que va a ejecutar si el pedido fue exitoso
                        var name = resultado.d[1][1];
                        $('#FullName').text(name);
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) { // función que va a ejecutar si hubo algún tipo de error en el pedido
                        var error = eval("(" + XMLHttpRequest.responseText + ")");
                        alert(error.Message);
                    }
                });
            });
        });
    </script>
    <div class="row" id="formulario">
        <div class="col-md-5">
            <div class="jumbotron">
                <h1>Datos del empleado</h1>
                <div class="form-group" style="visibility: hidden; position: absolute">
                    <label for="EmploleeID">ID</label>
                    <input type="text" class="form-control" id="EmployeeID" placeholder="ID">
                </div>
                <div class="form-group">
                    <label for="Fullname">Nombre del empleado</label>
                    <input type="text" class="form-control" id="FullName" placeholder="Nombre completo">
                </div>
                <div class="form-group">
                    <label for="EmpCode">Código del empleado</label>
                    <input type="text" class="form-control" id="EmpCode" placeholder="Código">
                </div>
                <div class="form-group">
                    <label for="Mobile">Teléfono del empleado</label>
                    <input type="text" class="form-control" id="Mobile" placeholder="Teléfono">
                </div>
                <div class="form-group">
                    <label for="Position">Posición</label>
                    <select class="form-control" id="Position">
                        <option value="ENGINEER">Ingeniero</option>
                        <option value="OPERATOR">Operador</option>
                    </select>
                </div>
                <div class="form-group">
                    <input class="btn btn-primary" value="Guardar" id="btnSubmit" onclick="onSubmit()" />
                </div>
            </div>

        </div>
        <div class="col-md-6">
            <h1>Listado de empleados</h1>
            <table class="table" id="EmployeeList">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Código</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Telefono</th>
                        <th scope="col">Posición</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>

    <script type="text/javascript">
        function onSubmit() {
            var formData = readFormData();
            insertRecord(formData);
        }

        function readFormData() {
            var formData = {};
            //alert(document.getElementById("FullName").value + "");
            formData["FullName"] = document.getElementById("FullName").value;
            formData["EmpCode"] = document.getElementById("EmpCode").value;
            formData["Mobile"] = document.getElementById("Mobile").value;
            formData["Position"] = document.getElementById("Position").value;

            return formData;
        }

        function insertRecord(data) {
            var table = document.getElementById("EmployeeList").getElementsByTagName("tbody")[0];
            var newRow = table.insertRow(table.lenght);
            cell1 = newRow.insertCell(0);
            cell1.innerHTML = table.lenght;
            
            cell2 = newRow.insertCell(1);
            cell2.innerHTML = data.EmpCode;

            cell3 = newRow.insertCell(2);
            cell3.innerHTML = data.FullName;

            cell3 = newRow.insertCell(3);
            cell3.innerHTML = data.Mobile;

            cell5 = newRow.insertCell(4);
            cell5.innerHTML = data.Position;
        }


    </script>

</asp:Content>
