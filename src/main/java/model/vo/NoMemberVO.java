package model.vo;

public class NoMemberVO {

    private String tel;
    private String name;
    private String email;
    private String address;
    private String passowrd;

    public void setPassowrd(String passowrd) {
        this.passowrd = passowrd;
    }

    public String getPassowrd() {
        return passowrd;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getAddress() {
        return address;
    }
}
