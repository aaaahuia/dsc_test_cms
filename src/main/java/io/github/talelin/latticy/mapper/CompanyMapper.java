package io.github.talelin.latticy.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.github.talelin.latticy.model.CompanyDO;
import io.github.talelin.latticy.model.UserDO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CompanyMapper extends BaseMapper<CompanyDO> {

    List<CompanyDO> selectByTitle(@Param("title") String title);

    List<UserDO> selectPersonList(@Param("companyid") Integer companyid);
}
