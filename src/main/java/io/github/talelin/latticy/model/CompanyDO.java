package io.github.talelin.latticy.model;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;


@Data
@TableName("lin_company")
@EqualsAndHashCode(callSuper = true)
public class CompanyDO extends BaseModel implements Serializable {

    private static final long serialVersionUID = 3968784595972358534L;

    private String companyName;

    private String companyTin;//纳税人识别号

    private String companyScc;//统一社会信用代码
}
