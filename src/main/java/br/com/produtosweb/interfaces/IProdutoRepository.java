package br.com.produtosweb.interfaces;

import java.util.List;

import br.com.produtosweb.entities.Produto;

public interface IProdutoRepository {
	
	void create(Produto produto) throws Exception;
	
	List<Produto> findAll(String nome) throws Exception;
		
}
