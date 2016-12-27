// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.school.base.domain;

import com.school.base.domain.StudentLogin;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect StudentLogin_Roo_Json {
    
    public String StudentLogin.toJson() {
        return new JSONSerializer()
        .exclude("*.class").serialize(this);
    }
    
    public String StudentLogin.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(this);
    }
    
    public static StudentLogin StudentLogin.fromJsonToStudentLogin(String json) {
        return new JSONDeserializer<StudentLogin>()
        .use(null, StudentLogin.class).deserialize(json);
    }
    
    public static String StudentLogin.toJsonArray(Collection<StudentLogin> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String StudentLogin.toJsonArray(Collection<StudentLogin> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<StudentLogin> StudentLogin.fromJsonArrayToStudentLogins(String json) {
        return new JSONDeserializer<List<StudentLogin>>()
        .use("values", StudentLogin.class).deserialize(json);
    }
    
}
