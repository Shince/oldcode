package servlet;

import java.text.SimpleDateFormat;
import java.util.*;
import java.io.*;

public class ChatService 
{
    private static ChatService cs;
    private Properties userList;

    private LinkedList<String> chatMsg;

    private ChatService()
    {
    }

    public static ChatService instance()
    {
        if (cs == null)
        {
            cs = new ChatService();
        }
        return cs;
    }

    public boolean validLogin(String user , String pass) 
        throws IOException
    {
        if (loadUser().getProperty(user) == null)
        {
            return false;
        }
        if (loadUser().getProperty(user).equals(pass))
        {
            return true;
        }
        return false;
    }

    public boolean addUser(String name , String pass)
        throws Exception
    {
        if (userList == null)
        {
            userList = loadUser();
        }
        if (userList.containsKey(name))
        {
            throw new Exception("用户名已经存在，请重新选择用户名");
        }
        userList.setProperty(name , pass);
        saveUserList();
        return true;
    }


    public String getMsg()
    {
        if (chatMsg == null)
        {
            chatMsg = new LinkedList<String>();
            return "";
        }
        String result = "";
        for (String tmp : chatMsg)
        {
            result += tmp + "\n";
        }
        return result;
    }

    public void addMsg(String user , String msg)
    {
        if (chatMsg == null)
        {
            chatMsg = new LinkedList<String>();
        }
        if (chatMsg.size() > 40)
        {
            chatMsg.removeFirst();
        }
        Calendar cal  = Calendar.getInstance();
        SimpleDateFormat formatter = new SimpleDateFormat("MM-dd HH:mm");
        chatMsg .add(user + "说("+formatter.format(cal.getTime())+")：" + msg);
    }

    private Properties loadUser()throws IOException
    {
        if (userList == null)
        {
            File f = new File("userFile.properties");
            if (!f.exists())
                f.createNewFile() ;            
            userList = new Properties();
            userList.load(new FileInputStream(f)); 
        }
        return userList;
    }

    private boolean saveUserList()throws IOException
    {
        if (userList == null)
        {
            return false;
        }
        userList.store(new FileOutputStream("userFile.properties"), "userList");
        return true;
    }
}
