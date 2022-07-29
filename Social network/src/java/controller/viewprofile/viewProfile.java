/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.viewprofile;

import dao.FriendDao;
import dao.GameDao;
import dao.PostDao;
import dao.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modal.Friend;
import modal.Game;
import modal.Post;
import modal.Product;
import modal.User;

/**
 *
 * @author duynh
 */
@WebServlet(name = "viewProfile", urlPatterns = {"/viewProfile"})
@MultipartConfig(maxFileSize = 16177215)
public class viewProfile extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer id = null;
        User user = (User) session.getAttribute("account");
        String id_str = request.getParameter("id");
        

        
        if (id_str != null) {
            try {
                id = Integer.parseInt(id_str);
            } catch (NumberFormatException e) {
                response.setContentType("text/html;charset=UTF-8");
                try (PrintWriter out = response.getWriter()) {
                    out.println("<!DOCTYPE html>");
                    out.println("<html>");
                    out.println("<head>");
                    out.println("<title>Error Page</title>");
                    out.println("</head>");
                    out.println("<body>");
                    out.println("</body>");
                    out.println("</html>");
                }
            }
        } else {
            if (user != null) {
                id = user.getID();

            }
        }

        if(user == null){
            request.getRequestDispatcher("Login").forward(request, response);
        }
        UserDao db = new UserDao();
        PostDao pdb = new PostDao();
        GameDao gdb = new GameDao();
        FriendDao fdb = new FriendDao();
        int totalpost = pdb.getTotalPost(id);
        ArrayList<User> userAccount = db.getProfile(id);
        ArrayList<Post> getHightLightPost = pdb.displayhighlight(id);
        List<Game> gamelist = gdb.getUsergame(id);
        ArrayList<Friend> friendlist = fdb.getFriendList(id);
        ArrayList<Friend> userFriend = fdb.getFriendList(user.getID());
        int countFriend = fdb.getTotalFriend(id);
        
        //testing
        request.setAttribute("userFriend", userFriend);
        //acutual
        
        request.setAttribute("userAccount", userAccount.get(0));
        request.setAttribute("gamelist", gamelist);
        
        request.setAttribute("user", user);
        request.setAttribute("totalpost", totalpost);
        System.out.println(getHightLightPost);
        request.setAttribute("getHightLightPost", getHightLightPost);
        request.setAttribute("userFriend", userFriend);
        request.setAttribute("friendlist", friendlist);
        request.setAttribute("countFriend", countFriend);
        request.getRequestDispatcher("view/Profile/Profile.jsp").forward(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
