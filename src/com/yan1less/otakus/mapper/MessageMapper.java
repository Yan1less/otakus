package com.yan1less.otakus.mapper;

import com.yan1less.otakus.pojo.friend_message;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MessageMapper {
    String SearchFriendNameByID(String friend_id);

    String SearchFriendIDByName(String friendName);
    //提交信息
    Integer SubmitMessage(friend_message fm);

    List<friend_message> PrepareUserMessage(@Param("user_id") String user_id,
                                            @Param("start") int i,
                                            @Param("total") int pagesize);

    Integer SearchCountByUserID(String user_id);
}
