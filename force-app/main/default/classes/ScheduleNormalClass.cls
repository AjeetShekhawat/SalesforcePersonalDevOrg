public with sharing class ScheduleNormalClass {
    public ScheduleNormalClass() {
        System.debug('In constructor');
    }
    public static void demo() {
        System.debug('Hi 123');
    }
}


/* 
We can schedule normal class also.
Scheduler class for this class is : ScheduleNormalClassSchedulable

ScheduleNormalClassSchedulable m = new ScheduleNormalClassSchedulable();
String sch = '0 0 8 1/1 * ? *';
String jobID = system.schedule('Schedule this class', sch, m);

*/