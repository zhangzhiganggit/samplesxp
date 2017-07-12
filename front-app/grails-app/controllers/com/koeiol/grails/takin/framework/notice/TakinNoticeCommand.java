package com.koeiol.grails.takin.framework.notice;

import com.koeiol.grails.takin.framework.core.notice.TakinPage;
import grails.validation.Validateable;
import groovy.lang.Closure;
import org.springframework.validation.Errors;

import java.util.List;
import java.util.Map;

/**
 * Created by xuh on 16/8/20.
 */
public class TakinNoticeCommand extends TakinPage<TakinNoticeItem> implements Validateable {

    // in args.
    private String username;
    private String noticeType;
    private String noticeCategory;

    // out properties.
    private int alertCount;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getNoticeType() {
        return noticeType;
    }

    public void setNoticeType(String noticeType) {
        this.noticeType = noticeType;
    }

    public String getNoticeCategory() {
        return noticeCategory;
    }

    public void setNoticeCategory(String noticeCategory) {
        this.noticeCategory = noticeCategory;
    }

    public int getAlertCount() {
        return alertCount;
    }

    public void setAlertCount(int alertCount) {
        this.alertCount = alertCount;
    }

    @Override
    public Errors getErrors() {
        return null;
    }

    @Override
    public Boolean hasErrors() {
        return null;
    }

    @Override
    public void clearErrors() {

    }

    @Override
    public boolean validate() {
        return false;
    }

    @Override
    public boolean validate(Closure<?>... adHocConstraintsClosures) {
        return false;
    }

    @Override
    public boolean validate(Map<String, Object> params) {
        return false;
    }

    @Override
    public boolean validate(Map<String, Object> params, Closure<?>... adHocConstraintsClosures) {
        return false;
    }

    @Override
    public boolean validate(List fieldsToValidate) {
        return false;
    }

    @Override
    public boolean validate(List fieldsToValidate, Closure<?>... adHocConstraintsClosures) {
        return false;
    }

    @Override
    public boolean validate(List fieldsToValidate, Map<String, Object> params) {
        return false;
    }

    @Override
    public boolean validate(List fieldsToValidate, Map<String, Object> params, Closure<?>... adHocConstraintsClosures) {
        return false;
    }

    @Override
    public void setErrors(Errors errors) {

    }
}
