<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!-- essa taglib é justamente para capturar os campos do formulário usando a model -->
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastro de Produto</title>

    <!-- folhas de estilo CSS -->
    <link rel="stylesheet" href="resources/css/bootstrap.min.css" />
    
    <!-- estilos para o jquery validation -->
    <style>
        label.error { color: red; }
        input.error, select.error, textarea.error { border: 2px solid red; }
    </style>

</head>
<body class="bg-dark">
	<div class="row mt-5">

		<div class="col-md-4 offset-md-4">
			<div class="card">
				<div class="card-body">
					<div class="text-center">

						<img src="https://cdn-icons-png.flaticon.com/64/6912/6912113.png"
							class="img-
							fluid" />
						<h4>Cadastro de Produtos</h4>
						<p>Informe os dados para cadastrar um produto</p>
					</div>

					<form id="formCadastro" action="cadastro-produto" method="post">

						<div class="mb-3">
							<label>Nome do Produto</label>
							<form:input path="model.nome" id="nome" type="text"
								name="nome" class="form-control" placeholder="Digite o nome do Produto"/>
						</div>

						<div class="mb-3">
							<label>Quantidade do Produto</label>
							<form:input path="model.quantidade" id="quatidade" type="number"
								name="quantidade" class="form-control" placeholder="Quantidade"/>
						</div>

						<div class="mb-3">
							<label>Preço do Produto</label> 
							<form:input path="model.preco" id="preco" type="number"
								name="preco" class="form-control" placeholder="R$"/>
						</div>
						<div class="mb-3">
							<label>Descrição do Produto</label>
							<form:textarea path="model.descricao" id="descricao" name="descricao" 
							type="text" class="form-control"
								placeholder="Descrição"></form:textarea>
						</div>
						<div class="mb-3">
							<label>Validade do Produto</label> 
							<form:input path="model.validade" type="date" id="validade" name="validade" class="form-control"/>

						</div>
						<div class="mb-3">
							<div class="d-grid">
								<input type="submit" value="Cadastrar Produto"
									class="btn btn-dark" />
							</div>
						</div>
						<div class="mb-3">
							<div class ="d-grid">
								<a href="/produtosweb/consulta" class="btn btn-dark"> 
									<label>Consultar Produto</label></a>
							</div>
						</div>
						<div class="mb-3 text-center">
							<strong class="text-primary"> ${mensagem} </strong>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	<!-- arquivos de extensão javascript -->
	<script src="resources/js/bootstrap.min.js"></script>

	<!-- biblioteca do jquery -->
	<script src="resources/js/jquery-3.6.0.min.js"></script>

	<!-- biblioteca do jquery validation -->
	<script src="resources/js/jquery.validate.min.js"></script>
	<script src="resources/js/additional-methods.min.js"></script>
	<script src="resources/js/messages_pt_BR.min.js"></script>

	<script>
		//função para inicializar ao código JavaScript (JQuery)
		$(document).ready(function(){
		
		$("#formCadastro").validate({
			rules : {
				'nome' : { required : true, minlength : 6, maxlength : 100 },
				'quantidade' : { required : true },
				'preco' : { required : true},
				'descricao' : { required : true, minlength : 0, maxlength : 500 },
				'validade' : { required : true }

			}
		});
		
	});
	
	</script>

</body>
</html>