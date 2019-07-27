public class PracticeClass {
    public static void test(List<Contact> conList) {
        for(Contact con : conList) {
            if(con.AccountId != null) {
                con.addError('Access Denied');
            }
        }
    }
}