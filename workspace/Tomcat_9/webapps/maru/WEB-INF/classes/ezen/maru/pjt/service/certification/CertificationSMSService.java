package ezen.maru.pjt.service.certification;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import ezen.maru.pjt.common.MaruInfo;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service("cert_sms")
public class CertificationSMSService implements CertificationService {

  public void certifiedPhoneNumber(String phoneNumber, String cerNum) {
    String api_key = MaruInfo.COOLSMS_APIKEY;
    String api_secret = MaruInfo.COOLSMS_APISECRET;
    Message coolsms = new Message(api_key, api_secret);
    // 4 params(to, from, type, text) are mandatory. must be filled
    HashMap<String, String> params = new HashMap<String, String>();
    params.put("to", phoneNumber); // 수신전화번호
    params.put("from", MaruInfo.ADMIN_PHONE); // 발신자전화번호.
    params.put("type", "SMS");
    params.put("text", "[마루] 회원 가입을 위한 휴대폰 인증번호는" + " [" + cerNum + "] " + "입니다.");
    params.put("app_version", "test app 1.2"); // application name and version
    try {
      JSONObject obj = (JSONObject) coolsms.send(params);
      System.out.println(obj.toString());
    } catch (CoolsmsException e) {
      System.out.println(e.getMessage());
      System.out.println(e.getCode());
    }
  }

}
