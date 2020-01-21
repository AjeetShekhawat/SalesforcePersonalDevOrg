public class SwitchClassExample {
/*    public void someInteger(Integer num) {
        Integer n = num;
        switch on n {
            when 2 {
                System.debug('when block 2');
            }
            when 3 {
                System.debug('when block 3');
            }
            when else {
                System.debug('default');
            }
		}
    } */

    public static void testRunning() {
        if (Test.isRunningTest()) {
            System.debug('coming if');
        } else {
            System.debug('coming else');
        }
    }
}