package model.vo;

public class MemberVO {

            private String tel;
            private String name;
            private String id;
            private String jumin;
            private String email;
            private String password;
            private String address;
            private String grade;

            public void setTel(String tel) {
                this.tel = tel;
        }

    public void setName(String name) {
        this.name = name;
    }

    public void setId(String id) {
        this.id = id;
    }

        public void setJumin(String jumin) {
            this.jumin = jumin;
        }

        public void setEmail(String email) {
            this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setGrade(String grade) {
        this.grade = grade;
}

    public void setPoint(int point) {
        this.point = point;
    }

    public String getTel() {
        return tel;
    }

    public String getName() {
        return name;
    }

    public String getId() {
        return id;
    }

    public String getJumin() {
        return jumin;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getAddress() {
        return address;
    }

    public String getGrade() {
        return grade;
    }

    public int getPoint() {
        return point;
    }

    private int point;

}
