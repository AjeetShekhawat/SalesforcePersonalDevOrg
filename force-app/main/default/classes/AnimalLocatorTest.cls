// 'Apex Integration Services' trailhead for superbadge
@isTest
private class AnimalLocatorTest{
    @isTest static  void AnimalLocatorMock1() {
        Test.SetMock(HttpCallOutMock.class, new AnimalLocatorMock());
        string result=AnimalLocator.getAnimalNameById(3);
        string expectedResult='trailhead';
        System.assertEquals(result, expectedResult);
    }
}