// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.school.base.domain;

import com.school.base.domain.SmsStatus;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect SmsStatus_Roo_Json {
    
    public String SmsStatus.toJson() {
        return new JSONSerializer()
        .exclude("*.class").serialize(this);
    }
    
    public String SmsStatus.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(this);
    }
    
    public static SmsStatus SmsStatus.fromJsonToSmsStatus(String json) {
        return new JSONDeserializer<SmsStatus>()
        .use(null, SmsStatus.class).deserialize(json);
    }
    
    public static String SmsStatus.toJsonArray(Collection<SmsStatus> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String SmsStatus.toJsonArray(Collection<SmsStatus> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<SmsStatus> SmsStatus.fromJsonArrayToSmsStatuses(String json) {
        return new JSONDeserializer<List<SmsStatus>>()
        .use("values", SmsStatus.class).deserialize(json);
    }
    
}
