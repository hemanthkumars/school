// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.school.base.domain;

import com.school.base.domain.Examination;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect Examination_Roo_Json {
    
    public String Examination.toJson() {
        return new JSONSerializer()
        .exclude("*.class").serialize(this);
    }
    
    public String Examination.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(this);
    }
    
    public static Examination Examination.fromJsonToExamination(String json) {
        return new JSONDeserializer<Examination>()
        .use(null, Examination.class).deserialize(json);
    }
    
    public static String Examination.toJsonArray(Collection<Examination> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String Examination.toJsonArray(Collection<Examination> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<Examination> Examination.fromJsonArrayToExaminations(String json) {
        return new JSONDeserializer<List<Examination>>()
        .use("values", Examination.class).deserialize(json);
    }
    
}