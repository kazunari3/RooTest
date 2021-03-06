// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package rootest.org.com.web;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;
import rootest.org.com.domain.Timer;
import rootest.org.com.web.ApplicationConversionServiceFactoryBean;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    declare @type: ApplicationConversionServiceFactoryBean: @Configurable;
    
    public Converter<Timer, String> ApplicationConversionServiceFactoryBean.getTimerToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<rootest.org.com.domain.Timer, java.lang.String>() {
            public String convert(Timer timer) {
                return new StringBuilder().append(timer.getMessage()).toString();
            }
        };
    }
    
    public Converter<Long, Timer> ApplicationConversionServiceFactoryBean.getIdToTimerConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, rootest.org.com.domain.Timer>() {
            public rootest.org.com.domain.Timer convert(java.lang.Long id) {
                return Timer.findTimer(id);
            }
        };
    }
    
    public Converter<String, Timer> ApplicationConversionServiceFactoryBean.getStringToTimerConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, rootest.org.com.domain.Timer>() {
            public rootest.org.com.domain.Timer convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Timer.class);
            }
        };
    }
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(getTimerToStringConverter());
        registry.addConverter(getIdToTimerConverter());
        registry.addConverter(getStringToTimerConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
}
