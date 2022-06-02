package br.com.produtosweb.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.produtosweb.entities.Produto;
import br.com.produtosweb.models.ConsultaModel;
import br.com.produtosweb.repositories.ProdutoRepository;

@Controller
public class ConsultaController {

	@RequestMapping(value = "consulta")
	public ModelAndView consulta() {
		ModelAndView modelAndView = new ModelAndView ("consulta");
		
		modelAndView.addObject("model", new ConsultaModel());
		return modelAndView;
		
	}
	@RequestMapping(value = "consultar-produto", method = RequestMethod.POST)
	public ModelAndView consultarProdutos(ConsultaModel model) {
		
		ModelAndView modelAndView = new ModelAndView("consulta");
		
		try {
			
			ProdutoRepository produtoRepository = new ProdutoRepository();
			List<Produto> produtos = produtoRepository.findAll(model.getNome());
			
			 
			modelAndView.addObject("produtos", produtos);
			
			modelAndView.addObject("mensagem_sucesso", produtos.size() + "\nproduto(s) encontrado(s) com sucesso!");
			
		} 
		catch (Exception e) {
			modelAndView.addObject("mensagem_erro", e.getMessage());
		}
		
		
		modelAndView.addObject("model", new ConsultaModel());
		return modelAndView;
	}
}
