<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>

<title>Estabelecimento</title>
<s:head />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="frontend/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="frontend/js/scriptcep.js"></script>
<script type="text/javascript" src="frontend/js/mascaravalidacao.js"></script>
<script type="text/javascript" src="frontend/js/jspdf.js"></script>
<script type="text/javascript" src="frontend/js/jspdf.min.js"></script>
<script type="text/javascript" src="frontend/js/jquery.js"></script>
<script type="text/javascript" src="frontend/js/jquery.min.js"></script>


</head>

<body>
	<div class="container">
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">Estabelecimentos</a>
				</div>
			</div>
		</nav>
	</div>
	<br>
	<br>

	<div class="container">
		<div class="col-sm-offset-3 col-sm-6">
			<h1>Cadastro de Estabelecimento</h1>
		</div>
		<form action="saveOrUpdateEstabelecimento">
		<s:push value="estabelecimento">

			<s:hidden name="id" value="%{id}" />


			<div class="group-group">
				<div class="col-sm-offset-3 col-sm-4">
					<label for="codigo">Código: </label> <input type="text"
						name="codigo" class="form-control" id="codigo"
						placeholder="digite um código">
				</div>
			</div>

			<div class="col-sm-offset-3 col-sm-4">
				<label for="situacao">Situação: </label>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-3 col-sm-4">
					<select class="form-control" name="situacao">
						<option value="Ativo">Ativo</option>
						<option value="Desativado">Desativado</option>
					</select>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-3 col-sm-4">
					<label for="descricao">Descricão:</label> <input type="text"
						name="descricao" class="form-control" id="descricao"
						placeholder="digite uma descrição">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-3 col-sm-4">
					<label for="cep">CEP:</label> <input type="text" maxlength="10"
						onblur="pesquisacep(this.value);" onBlur="ValidaCep(form1.cep)"
						name="cep" class="form-control"
						onKeyPress="MascaraCep(form1.cep);" id="cep"
						placeholder="digite um CEP">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-3 col-sm-4">
					<label for="rua">Rua:</label> <input id="rua" type="text"
						name="rua" class="form-control" placeholder="digite uma rua">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-3 col-sm-4">
					<label for="bairro">Bairro:</label> <input id="bairro" type="text"
						name="bairro" class="form-control" placeholder="digite um bairro">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-3 col-sm-4">
					<label for="cidade">Cidade:</label> <input type="text"
						name="cidade" class="form-control" id="cidade"
						placeholder="digite um cidade">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-3 col-sm-4">
					<label for="uf">UF:</label> <input type="text" name="uf"
						class="form-control" id="uf" placeholder="digite um estado">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-3 col-sm-4">
					<label for="ibge">IBGE:</label> <input type="text" name="ibge"
						class="form-control" id="ibge" placeholder="IGBE">
				</div>
			</div>
			  
			<div style="margin-top:  25px" class="col-sm-4">
				                               
				<button onclick="saveOrUpdateEstabelecimento"
					class="btn btn-primary btn-md">Salvar</button>
			</div>
			</s:push>
		</form>
	</div>
	<br>



	<div id="conteudo" class="container">
	<div  class="col-sm-offset-3 col-sm-6">
		<h1>Lista de Dados</h1>
	</div>

		<br>
		<s:if test="estabelecimentoList.size() > 0">
			<table  class="table table-hover">
				<thead>
					<tr>
						<th>Código</th>
						<th>Situação</th>
						<th>Descrição</th>
						<th>CEP</th>
						<th>Rua</th>
						<th>Bairro</th>
						<th>Cidade</th>
						<th>UF</th>
						<th>IBGE</th>
<!-- 						<th id="editor">Editar</th> -->
<!-- 						<th id="editor">Deletar</th> -->
					</tr>
				</thead>
				<s:iterator value="estabelecimentoList"
					status="estabelecimentoStatus">
					<tr
						class="<s:if test="#estabelecimentoStatus.odd == true ">odd</s:if><s:else>even</s:else>">
						<td><s:property value="codigo" /></td>
						<td><s:property value="situacao" /></td>
						<td><s:property value="descricao" /></td>
						<td><s:property value="cep" /></td>
						<td><s:property value="rua" /></td>
						<td><s:property value="bairro" /></td>
						<td><s:property value="cidade" /></td>
						<td><s:property value="uf" /></td>
						<td><s:property value="ibge" /></td>
						<td id="editor"><s:url id="editURL" action="editEstabelecimento">
								<s:param name="id" value="%{id}">
								</s:param>
							</s:url> <s:a href="%{editURL}">
								<button type="button" class="btn btn-primary"
									class="btn btn-primary btn-md">Editar</button>
							</s:a></td>
						<td id="editor"><s:url id="deleteURL" action="deleteEstabelecimento">
								<s:param name="id" value="%{id}"></s:param>

							</s:url> <s:a href="%{deleteURL}">
								<button type="button" class="btn btn-danger"
									class="btn btn-primary btn-md">Excluir</button>
							</s:a></td>
					</tr>
				</s:iterator>
			</table>

		</s:if>
	</div>
	<div id="editor"></div>
	<button id="btGerarPDF">gerar PDF</button>
</body>

<script>
	var doc = new jsPDF('l', 'mm', [700, 300]);
	var specialElementHandlers = {
		'#editor' : function(element, renderer) {
			return true;
		}
	};

	$('#btGerarPDF').click(function() {
		doc.fromHTML($('#conteudo').html(), 30, 30, {
			'width' : 170,
			'elementHandlers' : specialElementHandlers
		});
		doc.save('tabela-pdf.pdf');
	});
</script>
</html>