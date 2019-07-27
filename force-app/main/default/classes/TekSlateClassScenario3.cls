public class TekSlateClassScenario3 {
   
        public static void textFieldChange1(List<Account> listFromTrigger) {
             if(System.Label.FieldUpdate == 'yes') {
                for(Account acc : listFromTrigger) {
                    acc.site = 'world';
                }
             }
    	}
        public static void textFieldChange2(List<Account> listFromTrigger) {
            if(System.Label.FieldUpdate == 'yes') {
                for(Account acc : listFromTrigger) {
                    acc.site = 'world';
                }
             }
        }
}