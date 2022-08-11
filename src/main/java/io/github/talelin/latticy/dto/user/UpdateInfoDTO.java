package io.github.talelin.latticy.dto.user;

import lombok.*;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.Email;

/**
 * @author pedro@TaleLin
 */
@NoArgsConstructor
@Data
public class UpdateInfoDTO {

    @Email(message = "{email}")
    private String email;

    @Length(min = 2, max = 10, message = "{nickname.length}")
    private String nickname;

    @Length(min = 2, max = 10, message = "{username.length}")
    private String username;

    @Length(max = 500, message = "{avatar.length}")
    private String avatar;

    @Length(max = 50, message = "{idcard.length}")
    private String idcard;

    @Length(max = 24, message = "{phonenumber.length}")
    private String phonenumber;

    @Length(max = 500, message = "{address.length}")
    private String address;

    @Length(max = 50, message = "{bankcard.length}")
    private String bankcard;

    @Length(max = 50, message = "{txz.length}")
    private String txz;

    @Length(max = 1000, message = "{reamrks.length}")
    private String remarks;
}
