package co.grandcircus.lab24;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.grandcircus.lab24.dao.PartyOptionRepository;
import co.grandcircus.lab24.dao.PartyRepository;
import co.grandcircus.lab24.entity.Party;
import co.grandcircus.lab24.entity.PartyOption;

@Controller
public class PartyController {
	
	@Autowired
	private PartyRepository partyRepository;
	@Autowired
	private PartyOptionRepository partyOptionRepository;
	
	@RequestMapping("/")
	public String listParties(@RequestParam(value="keyword",required=false) String keyword, Model model) {
		if(keyword != null && !keyword.isEmpty()) {
			List<Party> parties = partyRepository.findByNameContainingIgnoreCase(keyword);
			model.addAttribute("parties", parties);
		}else {
			List<Party> parties = partyRepository.findAll();
			model.addAttribute("parties", parties);
		}

		return "home";
	}
	
	@RequestMapping("/vote/{id}")
	public String listPartyOptions(@PathVariable("id") Long id, Model model) {
		
		model.addAttribute("partyOptions", partyOptionRepository.findByPartyId(id));
		Party party = partyRepository.findById(id).orElse(null);
		model.addAttribute("party", party);

		return "/vote";
	}
	@RequestMapping("/add-vote/{id}")
	public String addVote(@PathVariable("id") Long id, Model model) {
		PartyOption option = partyOptionRepository.findById(id).orElse(null);
		Integer currVotes = option.getVotes();
		option.setVotes(currVotes + 1);
		partyOptionRepository.save(option);
		return "redirect:/";
	}
	@RequestMapping("/review/{id}")
	public String listReview(@PathVariable("id") Long id, Model model) {
		model.addAttribute("partyOptions", partyOptionRepository.findByPartyId(id));
		Party party = partyRepository.findById(id).orElse(null);
		model.addAttribute("party", party);
		return "review";
		
	}
	@RequestMapping("/add-option")
	public String addOption(@RequestParam String name, @RequestParam String description, Model model) {
		PartyOption newOption = new PartyOption();
		newOption.setName(name);
		newOption.setDescription(description);
		newOption.setVotes(0);
		partyOptionRepository.save(newOption);
		return "redirect:/";
		
	}
	@RequestMapping("/admin")
	public String listPartiesAdmin(Model model) {
		
		List<Party> parties = partyRepository.findAll();
		model.addAttribute("parties", parties);

		return "admin";
	}
	@RequestMapping("/add-party")
	public String showCreateForm(Model model) {
		
		
		model.addAttribute("title","Add a Party");
		return "party-form";
	}
	
	@PostMapping("/add-party")
	public String submitCreateForm(Party party) {
				
		partyRepository.save(party);
		
		return "redirect:/admin";
	}
	
	@RequestMapping("/edit")
	public String showEditForm(@RequestParam(value="id",required=false) Long id, Model model) {
		
		// findById returns an Optional<Type>
		// we must give a default value (if no instance is found)
		Party party = partyRepository.findById(id).orElse(null);
		
		model.addAttribute("party", party);
		model.addAttribute("title","Edit a Party");
		return "party-form";
	}
	
	@PostMapping("/edit")
	public String submitEditForm(Party party) {
		
		partyRepository.save(party);
		
		return "redirect:/admin";
	}
	@RequestMapping("/delete/{id}")
	public String removeParty(@PathVariable("id") Long id) {
		
		partyRepository.deleteById(id);
		
		return "redirect:/admin";
	}
	
	

}
