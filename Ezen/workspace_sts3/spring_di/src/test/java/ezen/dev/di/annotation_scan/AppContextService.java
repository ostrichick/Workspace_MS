package ezen.dev.di.annotation_scan;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

//어노테이션기반 스프링컨테이너 설정클래스에서 컴포넌트 스캔을 이용할 경우
// @ComponenetScan 붙임

@ComponentScan(basePackages = {"ezen.dev.di.annotation_scan"})
@Configuration 
public class AppContextService {

}
