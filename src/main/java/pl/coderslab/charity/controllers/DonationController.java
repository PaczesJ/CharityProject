package pl.coderslab.charity.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.entities.Category;
import pl.coderslab.charity.entities.Donation;
import pl.coderslab.charity.entities.Institution;
import pl.coderslab.charity.repositories.CategoryRepository;
import pl.coderslab.charity.repositories.DonationRepository;
import pl.coderslab.charity.repositories.InstitutionRepository;

import javax.validation.Valid;
import javax.validation.Validator;
import java.util.Collection;

@Controller
@RequestMapping("/")
public class DonationController {
    private final CategoryRepository categoryRepository;
    private final InstitutionRepository institutionRepository;
    private final DonationRepository donationRepository;
    private final Validator validator;

    public DonationController(CategoryRepository categoryRepository, InstitutionRepository institutionRepository, DonationRepository donationRepository, Validator validator) {
        this.categoryRepository = categoryRepository;
        this.institutionRepository = institutionRepository;
        this.donationRepository = donationRepository;
        this.validator = validator;
    }

    @GetMapping("/form")
    public String displayForm(Model model) {
        model.addAttribute("donation", new Donation());
        return "form";
    }
    @PostMapping("/form")
    public String processForm(@Valid Donation donation, BindingResult result) {
        if(result.hasErrors()) {
            return "redirect:/form";
        }
        donationRepository.save(donation);
        return "redirect:/formConfirmation";
    }
    @GetMapping("/formConfirmation")
    public String displayConfirmation() {
        return "form-confirmation";
    }

    @ModelAttribute("categories")
    public Collection<Category> categories() {
        return this.categoryRepository.findAll();
    }
    @ModelAttribute("institutions")
    public Collection<Institution> institutions() {
        return this.institutionRepository.findAll();
    }

}
