<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Consulta de produtos</title>

<!-- folhas de estilo CSS -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css" />

</head>
<body>
	<!-- mensagens -->
	<jsp:include page="/WEB-INF/components/mensagens.jsp"></jsp:include>


		<h5>Consulta de Produtos</h5>
		<p>Informe o nome do produto que deseja consultar.</p>
		<hr/>

		<form action="consultar-produto" method="post">

				<div class="row mb-3">
				<div class="col-md-3">
					<label>Nome do Produto</label>
					<form:input path="model.nome" type="text" class="form-control"
						placeholder="Digite aqui" />
				</div>
			</div>

			<div class="row mb-3">
				<div class="col-md-3">
					<input type="submit" value="Consultar produtos"
						class="btn btn-dark" />
				</div>
			</div>
			<div class="row mb-3">
				<div class ="col-md-3">
					<a href="/produtosweb/" class="btn btn-dark"> 
						<label>Voltar</label></a>
				</div>
			</div>
		</form>
		<c:if test="${produtos.size() > 0}">

			<table class="table table-hover table-sm mt-3">
				<thead>
					<tr>
						<th>Nome do produto</th>
						<th>Validade</th>
						<th>Quantidade</th>
						<th>Preço</th>
						<th>Descrição</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${produtos}" var="prod">
				<tr>
							<td>${prod.nome}</td>
							<td><fmt:formatDate value="${prod.validade}" pattern="dd/MM/yyyy"/></td>
							<td>${prod.quantidade}</td>
							<td>${prod.preco}</td>
							<td>${prod.descricao}</td>	
				</tr>
				</c:forEach>
				</tbody>
					<tfoot>
					<tr>
						<td class="6">Quantidade de produtos registrados: ${produtos.size()}</td>
					</tr>
				</tfoot>
			</table>
		</c:if>
				
	<!-- arquivos de extensão javascript -->
	<script src="resources/js/bootstrap.min.js"></script>

	<!-- biblioteca do jquery -->
	<script src="resources/js/jquery-3.6.0.min.js"></script>

	<!-- biblioteca do jquery validation -->
	<script src="resources/js/jquery.validate.min.js"></script>
	<script src="resources/js/additional-methods.min.js"></script>
	<script src="resources/js/messages_pt_BR.min.js"></script>

</body>
</html>