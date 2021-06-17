package com.green.dojosAndNinjas.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.green.dojosAndNinjas.models.Dojo;
import com.green.dojosAndNinjas.models.Ninja;
import com.green.dojosAndNinjas.repositories.DojoRepository;
import com.green.dojosAndNinjas.repositories.NinjaRepository;

@Service
public class DojoNinjaService {
	private final DojoRepository dojoRepository;
	private final NinjaRepository ninjaRepository;
	
	public DojoNinjaService(DojoRepository dojoRepository,NinjaRepository ninjaRepository) {
		this.dojoRepository = dojoRepository;
		this.ninjaRepository = ninjaRepository;
	}
	
	public List<Dojo> findAllDojos() {
		return (List<Dojo>) dojoRepository.findAll();
	}
	
	public Dojo getOneDojo(Long id) {
		return this.dojoRepository.findById(id).orElse(null);
	}
	
	public Dojo createDojo(Dojo dojo) {
		return dojoRepository.save(dojo);
	}
	
	
	public List<Ninja> findAllNinjas() {
		return (List<Ninja>)this.ninjaRepository.findAll();
	}
	
	public Ninja getOneNinja(Long id) {
		return this.ninjaRepository.findById(id).orElse(null);
	}
	
	public Ninja createNinja(Ninja ninja) {
		return ninjaRepository.save(ninja);
	}
}
