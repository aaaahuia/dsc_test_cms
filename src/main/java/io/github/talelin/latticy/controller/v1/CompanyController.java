package io.github.talelin.latticy.controller.v1;


import io.github.talelin.autoconfigure.exception.NotFoundException;
import io.github.talelin.core.annotation.GroupRequired;
import io.github.talelin.core.annotation.PermissionMeta;
import io.github.talelin.latticy.dto.company.CreateOrUpdateCompanyDTO;
import io.github.talelin.latticy.model.CompanyDO;
import io.github.talelin.latticy.model.CompanyDO;
import io.github.talelin.latticy.service.CompanyService;
import io.github.talelin.latticy.vo.CreatedVO;
import io.github.talelin.latticy.vo.DeletedVO;
import io.github.talelin.latticy.vo.UpdatedVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.Positive;
import java.util.List;

@RestController
@RequestMapping("/v1/company")
@Validated
public class CompanyController {
    @Autowired
    private CompanyService companyService;

    @PostMapping("")
    public CreatedVO CreateCompany(@RequestBody @Validated CreateOrUpdateCompanyDTO validator){
        companyService.createCompany(validator);
        return new CreatedVO(12);
    }

    @GetMapping("")
    public List<CompanyDO> getCompanys() {
        List<CompanyDO> companys = companyService.findAll();
        return companys;
    }

    @GetMapping("/{id}")
    public CompanyDO getCompany(@PathVariable(value = "id") @Positive(message = "{id.positive}") Integer id) {
        CompanyDO company = companyService.getById(id);
        if (company == null) {
            throw new NotFoundException(10022);
        }
        return company;
    }
    
    @PutMapping("/{id}")
    public UpdatedVO updateCompany(@PathVariable("id") @Positive(message = "{id.positive}") Integer id, @RequestBody @Validated CreateOrUpdateCompanyDTO validator) {
        CompanyDO company = companyService.getById(id);
        if (company == null) {
            throw new NotFoundException(10022);
        }
        companyService.updateCompany(company, validator);
        return new UpdatedVO(13);
    }

    @DeleteMapping("/{id}")
    @GroupRequired
    @PermissionMeta(value = "删除图书", module = "图书")
    public DeletedVO deleteCompany(@PathVariable("id") @Positive(message = "{id.positive}") Integer id) {
        CompanyDO company = companyService.getById(id);
        if (company == null) {
            throw new NotFoundException(10022);
        }
        companyService.deleteById(company.getId());
        return new DeletedVO(14);
    }
}
