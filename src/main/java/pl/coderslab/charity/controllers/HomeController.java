package pl.coderslab.charity.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.repositories.DonationRepository;
import pl.coderslab.charity.repositories.InstitutionRepository;


@Controller
@RequestMapping("/")
public class HomeController {
    private final InstitutionRepository institutionRepository;
    private final DonationRepository donationRepository;
    public HomeController(InstitutionRepository institutionRepository, DonationRepository donationRepository) {
        this.institutionRepository = institutionRepository;
        this.donationRepository = donationRepository;
    }

//     Display homepage with(institutions, bags and donations)
    @GetMapping("/")
    public String displayInstitutionsBagsAndDonations(Model model) {
        model.addAttribute("institutions", institutionRepository.findAll());
        model.addAttribute("bags", donationRepository.sumQuantity());
        model.addAttribute("donations", donationRepository.count());
        return "index";
    }
}
