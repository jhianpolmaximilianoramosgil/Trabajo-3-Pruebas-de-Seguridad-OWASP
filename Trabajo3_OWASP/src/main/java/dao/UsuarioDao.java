package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import modelo.Usuario;

public class UsuarioDao extends Conexion {

public static Boolean logueo = false;
    public static int nivel = 0;

    public Usuario login(Usuario usuario) throws Exception {
        Usuario user = new Usuario();
        String sql = "select USUUSU, PWDUSU, LEVUSU from USUARIO where USUUSU=? and PWDUSU=? ";
        try {
            PreparedStatement ps = this.conectar().prepareStatement(sql);
            ps.setString(1, usuario.getUSUUSU());
            ps.setString(2, usuario.getPWDUSU());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user.setUSUUSU(rs.getString("USUUSU"));
                user.setPWDUSU(rs.getString("PWDUSU"));
                user.setLEVUSU(rs.getInt("LEVUSU"));
                logueo = true;
            } else {
                logueo = false;
            }
            ps.close();
            rs.close();
            return user;
        } catch (Exception e) {
            System.out.println("Errorr en login_D " + e.getMessage());
            e.printStackTrace();
            throw e;
        }
    }

    public int loginNivel(Usuario usuario) throws Exception {
        String sql = "select USUUSU, PWDUSU, LEVUSU from USUARIO where USUUSU=? and PWDUSU=? ";
        try {
            PreparedStatement ps = (PreparedStatement) this.conectar().prepareStatement(sql);
            ps.setString(1, usuario.getUSUUSU());
            ps.setString(2, usuario.getPWDUSU());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                nivel = rs.getInt("LEVUSU");
                logueo = true;
            } else {
                logueo = false;
            }
            ps.close();
            rs.close();
            return nivel;
        } catch (Exception e) {
            System.out.println("Errorr en loginNivel_D " + e.getMessage());
            e.printStackTrace();
            throw e;
        }
    }


    
}