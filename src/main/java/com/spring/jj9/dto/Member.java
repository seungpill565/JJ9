package com.spring.jj9.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Member {

    private String member_id;
    private String member_password;
    private String member_email;
    private String member_phoneNum;
    private Date member_birthday;
    private Integer member_point;
    private String member_name;
    private String member_nickName;
    private String member_comments;
    private String member_level;


    //鍮꾨�踰덊샇 �옱�솗�씤�씠 �븘�슂

    
    //비밀번호 재확인이 필요

    private String member_rePassword;
    //idCheck
    private String check_id;
}