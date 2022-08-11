package io.github.talelin.latticy.service.impl;

import io.github.talelin.latticy.dto.company.CreateOrUpdateCompanyDTO;
import io.github.talelin.latticy.mapper.CompanyMapper;
import io.github.talelin.latticy.model.BookDO;
import io.github.talelin.latticy.model.CompanyDO;
import io.github.talelin.latticy.model.UserDO;
import io.github.talelin.latticy.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CompanyServiceImpl implements CompanyService {
    @Autowired
    private CompanyMapper companyMapper;

    @Override
    public boolean createCompany(CreateOrUpdateCompanyDTO validator){
        CompanyDO company = new CompanyDO();
        company.setCompanyName(validator.getCompanyName());
        company.setCompanyTin(validator.getCompanyTin());
        company.setCompanyScc(validator.getCompanyScc());
        return companyMapper.insert(company) > 0;
    }

    @Override
    public CompanyDO getById(Integer id) {
        CompanyDO company = companyMapper.selectById(id);
        return company;
    }

    @Override
    public boolean deleteById(Integer id){
        return companyMapper.deleteById(id) > 0;
    }

    @Override
    public boolean updateCompany(CompanyDO company,CreateOrUpdateCompanyDTO validator){
        company.setCompanyName(validator.getCompanyName());
        company.setCompanyTin(validator.getCompanyTin());
        company.setCompanyScc(validator.getCompanyScc());
        return companyMapper.updateById(company) > 0;
    }

    @Override
    public List<CompanyDO> findAll(){
        List<CompanyDO> companys = companyMapper.selectList(null);
        return companys;
    }

    @Override
    public List<UserDO> selectPersonList(Integer companyid) {
        List<UserDO> userDOS = companyMapper.selectPersonList(companyid);
        return userDOS;
    }
}
