// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.school.base.domain;

import com.school.base.domain.PaymentType;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect PaymentType_Roo_Json {
    
    public String PaymentType.toJson() {
        return new JSONSerializer()
        .exclude("*.class").serialize(this);
    }
    
    public String PaymentType.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(this);
    }
    
    public static PaymentType PaymentType.fromJsonToPaymentType(String json) {
        return new JSONDeserializer<PaymentType>()
        .use(null, PaymentType.class).deserialize(json);
    }
    
    public static String PaymentType.toJsonArray(Collection<PaymentType> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String PaymentType.toJsonArray(Collection<PaymentType> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<PaymentType> PaymentType.fromJsonArrayToPaymentTypes(String json) {
        return new JSONDeserializer<List<PaymentType>>()
        .use("values", PaymentType.class).deserialize(json);
    }
    
}