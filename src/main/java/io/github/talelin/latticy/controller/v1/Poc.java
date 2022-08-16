package io.github.talelin.latticy.controller.v1;

import io.github.talelin.autoconfigure.exception.NotFoundException;
import io.github.talelin.core.annotation.GroupRequired;
import io.github.talelin.core.annotation.PermissionMeta;
import io.github.talelin.latticy.dto.book.CreateOrUpdateBookDTO;
import io.github.talelin.latticy.model.BookDO;
import io.github.talelin.latticy.service.BookService;
import io.github.talelin.latticy.vo.CreatedVO;
import io.github.talelin.latticy.vo.DeletedVO;
import io.github.talelin.latticy.vo.UpdatedVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.Positive;
import java.util.List;

/**
 * @author pedro@TaleLin
 * @author Juzi@TaleLin
 */
@RestController
@RequestMapping("/v1/poc")
@Validated
@Api(value="POC接口",tags="POC")
public class Poc {

    @Autowired
    private BookService bookService;
    private String originKey = "12345678";

    // 提供原始秘钥:长度64位,8字节
    // 根据给定的字节数组构建一个秘钥
    private SecretKeySpec key = new SecretKeySpec(originKey.getBytes(), "DES");

    @RequestMapping(value = "**",produces="application/json;charset=UTF-8")
    @ResponseBody
    @ApiOperation(value="POC模块",httpMethod = "POST",notes = "发送加密DES加密的返回数据（encode参数）到该接口即可")
    public String deDes(@RequestParam(value = "encode", required = false, defaultValue = "fK7bsmRFf5U8j+ZdjCsmUiZuHoJJT4VfLWGG63YD/tiV2TaM36omqw==") String encode) throws Exception {

        Cipher cipher = this.getDes();
        // 解密
        // 2.对工具类对象进行初始化
        cipher.init(Cipher.DECRYPT_MODE, key);
        // 3.用加密工具类对象对密文进行解密
        byte[] decode = Base64.decodeBase64(encode);
        byte[] decipherByte = cipher.doFinal(decode);
        String decipherText = new String(decipherByte);
        return decipherText;
    }

    @GetMapping("/endes")
    @ApiOperation(value="加密数据模块",notes = "发送URL编码后的plainText参数到该路由即可返回加密后的数据")
    public String enDes(@RequestParam(value = "plainText", required = false, defaultValue = "请传入des加密的encode参数") String plainText) throws Exception {

        Cipher cipher = this.getDes();
        // 3.用加密工具类对象对明文进行加密
        byte[] encipherByte = cipher.doFinal(plainText.getBytes());
        // 防止乱码，使用Base64编码
        String encode = Base64.encodeBase64String(encipherByte);
        return encode;
    }

    public Cipher getDes() throws Exception{

        // 加密
        // 1.获取加密算法工具类
        Cipher cipher = Cipher.getInstance("DES");
        // 2.对工具类对象进行初始化,
        // mode:加密/解密模式
        // key:对原始秘钥处理之后的秘钥
        cipher.init(Cipher.ENCRYPT_MODE, key);
        return cipher;

    }



}
