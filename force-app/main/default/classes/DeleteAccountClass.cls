public class DeleteAccountClass {
    public static void deleteAccount(List<Account> acclist) {
        for(Account acc : acclist) {
            if(acc.id != null) {
                acc.addError('Access Denied');
            }
        }
    }
}