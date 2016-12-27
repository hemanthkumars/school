// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.school.base.domain;

import com.school.base.domain.StaffAttendance;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect StaffAttendance_Roo_Json {
    
    public String StaffAttendance.toJson() {
        return new JSONSerializer()
        .exclude("*.class").serialize(this);
    }
    
    public String StaffAttendance.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(this);
    }
    
    public static StaffAttendance StaffAttendance.fromJsonToStaffAttendance(String json) {
        return new JSONDeserializer<StaffAttendance>()
        .use(null, StaffAttendance.class).deserialize(json);
    }
    
    public static String StaffAttendance.toJsonArray(Collection<StaffAttendance> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String StaffAttendance.toJsonArray(Collection<StaffAttendance> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<StaffAttendance> StaffAttendance.fromJsonArrayToStaffAttendances(String json) {
        return new JSONDeserializer<List<StaffAttendance>>()
        .use("values", StaffAttendance.class).deserialize(json);
    }
    
}
