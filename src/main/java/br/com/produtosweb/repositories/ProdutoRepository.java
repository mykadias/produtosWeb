package br.com.produtosweb.repositories;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import br.com.produtosweb.entities.Produto;
import br.com.produtosweb.factories.ConnectionFactory;
import br.com.produtosweb.helpers.DateHelper;
import br.com.produtosweb.interfaces.IProdutoRepository;

public class ProdutoRepository implements IProdutoRepository{

	@Override
	public void create(Produto produto) throws Exception {
		
		Connection connection =  ConnectionFactory.getConnection();
		
		PreparedStatement statement = connection.prepareStatement("insert into produto(nome, descricao, preco, quantidade, validade) values (?, ?, ?, ?, ?)");
		
		statement.setString(1, produto.getNome());
		statement.setString(2, produto.getDescricao());
		statement.setDouble(3, produto.getPreco());
		statement.setInt(4, produto.getQuantidade());
		statement.setString(5, DateHelper.formatToString(produto.getValidade()));

		
		statement.execute();
		statement.close();
		
		connection.close();
	}

	@Override
	public List<Produto> findAll(String nomeProduto) throws Exception {
		
		Connection connection = ConnectionFactory.getConnection();
		
		PreparedStatement statement = connection.prepareStatement("select * from produto where nome like ? ");
		statement.setString(1, "%" + nomeProduto +"%");
		ResultSet resultSet = statement.executeQuery();
		
		List<Produto> produtos = new ArrayList<Produto>();

		while (resultSet.next()) {

			Produto produto = new Produto();

			produto.setIdProduto(resultSet.getInt("idproduto"));
			produto.setNome(resultSet.getString("nome"));
			produto.setValidade(DateHelper.formatToDate(resultSet.getString("validade")));
			produto.setQuantidade(resultSet.getInt("quantidade"));
			produto.setPreco(resultSet.getDouble("preco"));
			produto.setDescricao(resultSet.getString("descricao"));

			produtos.add(produto); 
		}

		connection.close();

		return produtos; 

	}

	
}
