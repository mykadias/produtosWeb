package br.com.produtosweb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.produtosweb.helpers.DateHelper;
import br.com.produtosweb.entities.Produto;
import br.com.produtosweb.models.CadastroModel;
import br.com.produtosweb.repositories.ProdutoRepository;

@Controller
public class CadastroController {

	@RequestMapping(value = "/")
	public ModelAndView cadastro() {

		ModelAndView modelAndView = new ModelAndView("cadastro");

		modelAndView.addObject("model", new CadastroModel());

		return modelAndView;

	}

	@RequestMapping(value = "/cadastro-produto", method = RequestMethod.POST)
	public ModelAndView cadastroProduto(CadastroModel model) {

		ModelAndView modelAndView = new ModelAndView("cadastro");

		try {
	
				Produto produto = new Produto();

				produto.setNome(model.getNome());
				produto.setDescricao(model.getDescricao());
				produto.setPreco(model.getPreco());
				produto.setQuantidade(model.getQuantidade());
				produto.setValidade(DateHelper.formatToDate(model.getValidade()));

				ProdutoRepository produtoRepository = new ProdutoRepository();
				produtoRepository.create(produto);

				modelAndView.addObject("mensagem", "O produto foi cadastrado com sucesso!");
					


		} catch (Exception e) {
			modelAndView.addObject("mensagem", e.getMessage());
		}


        modelAndView.addObject("model", new CadastroModel());
        
		return modelAndView;

	}
}
