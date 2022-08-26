package com.spring.jj9.dto;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class Free_board {

    Integer fboard_id;
    String member_id;
    String fboard_title;
    String fboard_content;
    Date fboard_date;

}
