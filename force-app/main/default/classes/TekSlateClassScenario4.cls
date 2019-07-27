public class TekSlateClassScenario4 {
    public static void leadSalutationInsert(LIST<Lead> leadList) {
        for(Lead leadSal : leadList) {
            leadSal.FirstName = 'Mr.' + leadSal.FirstName;
        }
    }
    public static void leadSalutationUpdate(LIST<Lead> leadList) {
        for(Lead leadSal : leadList) {
            leadSal.FirstName = 'Mr.' + leadSal.FirstName;
        }
    }
}