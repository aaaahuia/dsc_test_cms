package io.github.talelin.latticy.dto.company;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotEmpty;

@Data
@NoArgsConstructor
public class CreateOrUpdateCompanyDTO {

    @NotEmpty(message = "{company.title.length}")
    @Length(max=50,message = "{company.title.length}")
    private String companyName;

    @NotEmpty(message = "{company.title.length}")
    @Length(max=50,message = "{company.title.length}")
    private String companyScc;

    @NotEmpty(message = "{company.title.length}")
    @Length(max=50,message = "{company.title.length}")
    private String companyTin;
}
