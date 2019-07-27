// 'Apex Testing' trailhead for superbadge 
public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer noOfContacts, String lastName) {
        List<Contact> conList = new List<Contact>();
        for(Integer i = 0; i < noOfContacts; i++) {
            Contact c = new Contact();
            c.FirstName = 'Test ' + i;
            c.LastName = lastName;
            conList.add(c);
        }
        return conList;
    }
}