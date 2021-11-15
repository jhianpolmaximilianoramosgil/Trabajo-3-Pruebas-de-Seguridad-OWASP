package controlador;

import dao.UsuarioDao;
import java.io.IOException;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import java.io.Serializable;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import lombok.Data;
import modelo.Usuario;
import servicios.EmailS;

@Data
@Named(value = "usuarioC")
@SessionScoped
public class UsuarioC implements Serializable {

    Usuario usuario;
    UsuarioDao dao;
    private int captcha = 0;
    private int intentos = 0;
    private boolean bloquear = false;


    //Representa a una clase
    //Objetos
    public UsuarioC() {

        usuario = new Usuario();
        dao = new UsuarioDao();
    }

    public void login() throws Exception {
        try {
            dao.login(usuario);
        } catch (Exception e) {
            System.out.println("Error en login_C " + e.getMessage());
        }
    }

    public void loginNivel() throws Exception {
        try {
            dao.loginNivel(usuario);
        } catch (Exception e) {
            System.out.println("Error en loginNivel_C" + e.getMessage());
        }
    }



//    public void refactorPWD() throws Exception {
//        
//        try {
//            String email = usuario.getEmail();
//            EmailS.refactorPWD(email);
//        } catch (Exception e) {
//            System.out.println("Error en refactorPWD_C" + e.getMessage());
//        }
//    }

    public void acceso() throws Exception {
        try {
            usuario = dao.login(usuario);
            this.login();
            if (dao.logueo == false) {
                intentos++;
                if (intentos == 1) {
                    setIntentos(1);
                    setCaptcha(0);
                    System.out.println("intentos igual " + intentos);
                    FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_FATAL, "LLEVAS 1 INTENTO FALLIDO", "Usuario Y/o Contraseña fallida"));
                    FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_FATAL, "LE QUEDAN 2 INTENTOS", ""));
                }
                if (intentos == 2) {
                    setIntentos(2);
                    setCaptcha(1);
//                    bloquear = true;
                    System.out.println("intentos igual " + intentos);
                    FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_FATAL, "LLEVAS 2 INTENTO FALLIDO", "Usuario Y/o Contraseña fallida"));
                    FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_FATAL, "LE QUEDA 1 INTENTO", ""));
                }
                if (intentos == 3) {
                    System.out.println("intentos igual " + intentos);
                    FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_FATAL, "LLEVAS 3 INTENTO FALLIDO", "Usuario Y/o Contraseña fallida"));
                    FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_FATAL, "BLOQUEANDO SOFTWARE POR SEGURIDAD", ""));
                    setIntentos(3);
                    bloquear = true;
                    if (bloquear) {
                        delayTiempo();
                    }
                    if (intentos == 3) {
                        setIntentos(0);
                        setCaptcha(0);
//                        bloquear = true;
                    }
                }
            } else {
                String usu = usuario.getUSUUSU();
                EmailS.sendNotification(usu);
                EmailS.sendIngresoUsuario(usu);
                FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("objetoUsuario", usuario);
                this.loginNivel();
                if (dao.nivel == 1) {
                    FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "¡ADELANTE!", "Ingreso Exitoso"));
                    FacesContext.getCurrentInstance().getExternalContext().redirect("/Trabajo3_OWASP/faces/vistas/Personal.xhtml");
                }
                if (dao.nivel == 2) {
                    FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "¡ADELANTE!", "Ingreso Exitoso"));
                    FacesContext.getCurrentInstance().getExternalContext().redirect("/Trabajo3_OWASP/faces/vistas/Personal.xhtml");
                }
            }
        } catch (Exception e) {
            System.out.println("Error en Acceso_C " + e.getMessage());
            e.printStackTrace();
        }
    }

    private static void delayTiempo() {
        try {
            Thread.sleep(1000);
        } catch (Exception e) {
            System.out.println("Error en delayTiempoC " + e.getMessage());
            e.printStackTrace();
        }
    }

    // Obtener el objeto de la sesión activa
    public static Usuario obtenerObjetoSesion() {
        return (Usuario) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("objetoUsuario");
    }

    // Si la sesión no está iniciada no permitirá entrar a otra vista de la aplicación
    public void seguridadSesion() throws IOException {
        if (obtenerObjetoSesion() == null) {
            FacesContext.getCurrentInstance().getExternalContext().redirect("/Trabajo3_OWASP/faces/vistas/Personal.xhtml");
        }
    }

    // Cerrar y limpiar la sesión y direccionar al xhtml inicial del proyecto
    public void cerrarSesion() throws IOException {
        FacesContext.getCurrentInstance().getExternalContext().getSessionMap().clear();
        FacesContext.getCurrentInstance().getExternalContext().redirect("/Sisregvg_ODAO/faces/Login.xhtml");
    }

    // Si la sesión está activa se redirecciona a la vista principal
    public void seguridadLogin() throws IOException {
        Usuario us = obtenerObjetoSesion();
        if (us != null) {
            FacesContext.getCurrentInstance().getExternalContext().
                    redirect("/Trabajo3_OWASP/faces/login_1.xhtml");
        }
    }

}
