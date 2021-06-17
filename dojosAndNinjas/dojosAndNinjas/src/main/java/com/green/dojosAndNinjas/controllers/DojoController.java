package com.green.dojosAndNinjas.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.green.dojosAndNinjas.models.Dojo;
import com.green.dojosAndNinjas.models.Ninja;
import com.green.dojosAndNinjas.services.DojoNinjaService;

@Controller
public class DojoController {
	
private final DojoNinjaService dojoNinjaService;
	
	public DojoController(DojoNinjaService dojoNinjaService) {
		this.dojoNinjaService = dojoNinjaService;
	}
	
	@GetMapping("dojos/new")
	public String index(Model model, @ModelAttribute("dojo") Dojo dojo) {
		List<Dojo> allDojos = this.dojoNinjaService.findAllDojos();
		model.addAttribute("allDojos", allDojos);
		return "index.jsp";
	}
	
//	@GetMapping("dojos/{id}")
//	public String getOneDojo(@PathVariable("id") Long id, Model model) {
//		Dojo dojo = this.dojoNinjaService.getOneDojo(id);
//		model.addAttribute("dojo", dojo);
//		return "dojoShow.jsp";
//	}
	
	
	@PostMapping("/createDojo")
	public String create(Model model, @Valid @ModelAttribute("dojo") Dojo dojo, BindingResult result) {
		if (result.hasErrors()) {
			List<Dojo> allDojos = this.dojoNinjaService.findAllDojos();
			model.addAttribute("allDojos", allDojos);
			return "index.jsp";
		}
		else {
			Dojo newDojo = dojoNinjaService.createDojo(dojo);
			return "redirect:/dojos/" + newDojo.getId();
		}
	}
	
	
	@GetMapping("dojos/ninjas/new")
	public String ninjaCreate(Model model, @ModelAttribute("ninja") Ninja ninja) {
		List<Dojo> allDojos = this.dojoNinjaService.findAllDojos();
		model.addAttribute("allDojos", allDojos);
		return "ninjaNew.jsp";
	}
	
	@PostMapping("/createNinja")
	public String createNinja(@Valid @ModelAttribute("ninja") Ninja ninja, BindingResult result) {
		if (result.hasErrors()) {
			return "ninjaNew.jsp";
		}
		else {
			this.dojoNinjaService.createNinja(ninja);
			return "redirect:/dojos/new";
		}
	}
	
	@GetMapping("/dojos/{id}")
	public String dojoShow(@PathVariable("id") Long id, Model model) {
		Dojo dojo = this.dojoNinjaService.getOneDojo(id);
		model.addAttribute("dojoToShow", dojo);
		return "dojoShow.jsp";
	}
}
