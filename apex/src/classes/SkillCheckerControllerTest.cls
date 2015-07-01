/**
 * SkillChecker
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
@isTest
private class SkillCheckerControllerTest {

    private static User testAdminUser = SkillCommonTester.getLoginUser();

    /**
     * コンストラクタ
     */
    static testMethod void SkillCheckerControllerTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            SkillCheckerController cls = new SkillCheckerController();
            
            Test.stopTest();

            System.assertEquals(String.isEmpty(cls.searchKey), true);
        }
    }

    /**
     * プロフィールスキル情報取得
     */
    static testMethod void getProfileSkillsTest1() {
        
        System.runAs(testAdminUser) {

            String searchKey = '';

            Test.startTest();
            
            List<SkillCheckerWrapper> results = SkillCheckerController.getProfileSkills(searchKey);
            
            Test.stopTest();

            System.assertEquals(results.isEmpty(), true);
        }
    }

    /**
     * プロフィールスキル情報取得
     */
    static testMethod void getProfileSkillsTest2() {
        
        System.runAs(testAdminUser) {

            String skillName = 'Apex';
            ProfileSkill profileSkill = SkillCommonTester.createProfileSkill(skillName, true);
            ProfileSkillUser profileSkillUser = SkillCommonTester.createProfileSkillUser(profileSkill, testAdminUser, true);

            Test.startTest();
            
            String searchKey = skillName;
            List<SkillCheckerWrapper> results = SkillCheckerController.getProfileSkills(searchKey);
            
            Test.stopTest();

            System.assertEquals(results.size(), 1);
        }
    }
}