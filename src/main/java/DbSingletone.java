/**
 * DB Singltone
 * 데이터베이스 싱글톤화
 */
public class DbSingletone {
    private static DbSingletone dbSingletone;

    private static final String dbDriver = "oracle.jdbc.driver.OracleDriver";

    // TODO 개인 Db 포트에 맞게 변경할것
    private static final String dbUrl = "jdbc:oracle:thin:@localhost:1521:orcl1";
    private static final String dbUser = "scott";
    private static final String dbPass = "tiger";

    public DbSingletone() throws Exception {
        Class.forName(dbDriver);
    }

    public static DbSingletone getInstance() throws Exception{
        if (dbSingletone == null) {
            dbSingletone = new DbSingletone();
        }
        return dbSingletone;
    }
}
