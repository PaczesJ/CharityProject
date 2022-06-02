package pl.coderslab.charity;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.dao.DonationDao;
import pl.coderslab.charity.dao.InstitutionDao;


@Controller
@RequestMapping("/")
public class HomeController {

    private final InstitutionDao institutionDao;
    private final DonationDao donationDao;

    public HomeController(InstitutionDao institutionDao, DonationDao donationDao) {
        this.institutionDao = institutionDao;
        this.donationDao = donationDao;
    }

//     Display institutions
    @GetMapping("/")
    public String displayInstitutionsBagsAndDonations(Model model) {
        model.addAttribute("institutions", institutionDao.findAll());
        model.addAttribute("bags", donationDao.sumBags());
        model.addAttribute("donations", donationDao.numberOfDonations());
        return "index";
    }
}
