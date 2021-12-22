package test.dao;

import com.me.wamp.dao.UserDAO;
import com.me.wamp.pojo.Playlist;
import com.me.wamp.pojo.User;

public class MainClass {

    public static void main(String[] args) {
        // TODO Auto-generated method stub
        User user = new User();
        user.setUsername("test");
        user.setPassword("test");
        user.setRole("user");
        user.setPlaylist(new Playlist());

        UserDAO userdao = new UserDAO();
        userdao.createUser(user);
    }

}
