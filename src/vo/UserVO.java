package vo;

/**
 * 회원 정보 class
 */
//TODO 더 추가할거 생각
public class UserVO {
    private String id;
    private String pw;
    private String grade; // 회원 등급
    private String memberName;  // 회원이름
    private int tel;    // 회원 전화번호
    private String address; // 회원 주소

    public UserVO() {
    }

    public UserVO(String id, String pw, String grade, String memberName, int tel, String address) {
        this.id = id;
        this.pw = pw;
        this.grade = grade;
        this.memberName = memberName;
        this.tel = tel;
        this.address = address;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPw() {
        return pw;
    }

    public void setPw(String pw) {
        this.pw = pw;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    public int getTel() {
        return tel;
    }

    public void setTel(int tel) {
        this.tel = tel;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
