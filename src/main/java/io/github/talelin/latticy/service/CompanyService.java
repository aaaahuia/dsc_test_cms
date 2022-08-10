package io.github.talelin.latticy.service;

import io.github.talelin.latticy.dto.company.CreateOrUpdateCompanyDTO;
import io.github.talelin.latticy.model.BookDO;
import io.github.talelin.latticy.model.CompanyDO;

import java.util.List;

public interface CompanyService {

    boolean createCompany(CreateOrUpdateCompanyDTO validator);

    CompanyDO getById(Integer id);

    boolean deleteById(Integer id);

    boolean updateCompany(CompanyDO company,CreateOrUpdateCompanyDTO validator);

    List<CompanyDO> findAll();
}
