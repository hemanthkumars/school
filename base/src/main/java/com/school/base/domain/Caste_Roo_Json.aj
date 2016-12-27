// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.school.base.domain;

import com.school.base.domain.Caste;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect Caste_Roo_Json {
    
    public String Caste.toJson() {
        return new JSONSerializer()
        .exclude("*.class").serialize(this);
    }
    
    public String Caste.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(this);
    }
    
    public static Caste Caste.fromJsonToCaste(String json) {
        return new JSONDeserializer<Caste>()
        .use(null, Caste.class).deserialize(json);
    }
    
    public static String Caste.toJsonArray(Collection<Caste> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String Caste.toJsonArray(Collection<Caste> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<Caste> Caste.fromJsonArrayToCastes(String json) {
        return new JSONDeserializer<List<Caste>>()
        .use("values", Caste.class).deserialize(json);
    }
    
}