public class AntClass {
    public AntClass() {
        System.debug('coming in constructor');
    }
    public static void antClassMethod() {
        Savepoint sp = Database.setSavepoint();
        try {
            
            Account acc= new Account();
            acc.Name = 'try catch';
            acc.Total_Contact__c = 50;
            Insert acc;
            System.debug('inserting in ' + acc);

            Contact con = new Contact();
            con.Email = 'child@gmail.com';
            Insert con;
            System.debug('inserting con ' + con);

            System.debug('Account Id after rollback ' + acc);

        } catch (Exception ex) {
            Database.rollback(sp);
            System.debug('coming in Ex ' + ex.getMessage());
        }
        /*
        Account acc= new Account();
        acc.Name = 'try catch';
        Insert acc;
        System.debug('inserting in ' + acc);
        Contact con = new Contact();
     // con.LastName = 'child'; // Required field missing
        con.Email = 'child@gmail.com';
        Insert con;
        System.debug('inserting con ' + con);
        */
    }
}