package com.yan1less.otakus.mapper;

import com.yan1less.otakus.pojo.information;
import com.yan1less.otakus.pojo.user;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminMapper {
    List<user> loadAllUser(@Param("startrow") Integer startrow,
                           @Param("pagesize") Integer pagesize);

    Integer getUserTotalCount();

    List<user> loadUsers(@Param("startrow") Integer startrow,
                         @Param("pagesize") Integer pagesize);




    //以下是删除用户的
    Integer DeleteFriendTableDataByUserID(String id);
    Integer DeleteFriendTableDataByFriendID(String id);
    Integer DeleteUserTableData(String id);
    Integer DeletePictureTableData(String id);
    Integer DeleteMediaTableData(String id);
    Integer DeleteInformationTableData(String id);
    Integer DeleteCommentTableData(String id);
    Integer DeleteFriendMessageTableDataByFrom(String id);
    Integer DeleteFriendMessageTableDataByTo(String id);

    //加载所有帖子
    List<information> LoadAllInfo();
}
