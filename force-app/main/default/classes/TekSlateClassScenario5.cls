public class TekSlateClassScenario5 {
    public static void addTeamMember(List<Opportunity> oppList) {
        set<id> usrSet = new Set<id>();
        for(Opportunity op : oppList) {
            usrSet.add(op.OwnerId);
        }
        List<User> usrList = [select id, name from user where ID IN : usrSet];
        LIST<OpportunityTeamMember> opm = new LIST<OpportunityTeamMember>();
        OpportunityTeamMember opTM = new OpportunityTeamMember();
        for(User u : usrList) {
            opTM.OpportunityId = u.id;
            opTM.TeamMemberRole = 'dev';
            opm.add(opTM);
        }
        if(opm.size() > 0) {
            insert opm;
        }
    }
}