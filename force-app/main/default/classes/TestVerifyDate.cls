// 'Apex Testing' trailhead for superbadge 
@isTest
public class TestVerifyDate {
    @isTest static void testSuperBadge() {
        VerifyDate.CheckDates(System.today(), System.today()+5);
    }
    
    @isTest static void testSuperBadge1() {
        VerifyDate.CheckDates(System.today() +5, System.today());
    }
}