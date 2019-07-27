public with sharing class ScheduleNormalClassSchedulable implements Schedulable {
    public ScheduleNormalClassSchedulable() {

    }
    public void execute(SchedulableContext sc) {
        ScheduleNormalClass scInstance = new ScheduleNormalClass();
    }
}