// 'Apex Testing' trailhead for superbadge 
@isTest
public class TestRestrictContactByName {
	@isTest static void testSuperBadgeTrigger() {
        Contact con = new Contact();
        con.LastName = 'INVALIDNAME';
        Insert con;
    }
}