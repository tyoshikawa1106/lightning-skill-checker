/**
 * SkillChecker
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
@isTest
private class SkillCheckerWrapperTest {

    private static User testAdminUser = SkillCommonTester.getLoginUser();

    /**
     * コンストラクタ
     */
    static testMethod void SkillCheckerWrapperTest1() {
        
        System.runAs(testAdminUser) {
            Test.startTest();
            
            SkillCheckerWrapper cls = new SkillCheckerWrapper();
            
            Test.stopTest();

            System.assertEquals(String.isEmpty(cls.profileSkill.Id), true);
            System.assertEquals(cls.profileSkillUsers.isEmpty(), true);
        }
    }

    /**
     * コンストラクタ
     */
    static testMethod void SkillCheckerWrapperTest2() {
        
        System.runAs(testAdminUser) {

            String skillName = 'Apex';
            ProfileSkill profileSkill = SkillCommonTester.createProfileSkill(skillName, true);
            ProfileSkillUser profileSkillUser = SkillCommonTester.createProfileSkillUser(profileSkill, testAdminUser, true);
            // List
            List<ProfileSkillUser> profileSkillUsers = new List<ProfileSkillUser>();
            profileSkillUsers.add(profileSkillUser);

            Test.startTest();
            
            SkillCheckerWrapper cls = new SkillCheckerWrapper(profileSkill, profileSkillUsers);
            
            Test.stopTest();

            System.assertEquals(String.isNotEmpty(cls.profileSkill.Id), true);
            System.assertEquals(cls.profileSkillUsers.isEmpty(), false);
        }
    }
}