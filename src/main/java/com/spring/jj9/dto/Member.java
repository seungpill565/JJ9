package com.spring.jj9.dto;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

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
    private String member_rePassword;
    //idCheck
    private String check_id;
}