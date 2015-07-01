/**
 * SkillChecker
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
@isTest
private class SkillCheckerDaoTest {

    private static SkillCheckerDao dao = new SkillCheckerDao();
    private static User testAdminUser = SkillCommonTester.getLoginUser();

    /**
     * プロフィールスキル取得
     */
    static testMethod void getProfileSkillsTest1() {
        
        System.runAs(testAdminUser) {

            String searchKey = '';

            Test.startTest();
            
            List<ProfileSkill> results = dao.getProfileSkills(searchKey);
            
            Test.stopTest();

            System.assertEquals(results.isEmpty(), true);
        }
    }

    /**
     * プロフィールスキル取得
     */
    static testMethod void getProfileSkillsTest2() {
        
        System.runAs(testAdminUser) {

            String skillName = 'Apex';
            ProfileSkill profileSkill = SkillCommonTester.createProfileSkill(skillName, true);

            String searchKey = skillName;

            Test.startTest();
            
            List<ProfileSkill> results = dao.getProfileSkills(searchKey);
            
            Test.stopTest();

            System.assertEquals(results.size(), 1);
        }
    }

    /**
     * プロフィールスキルユーザ取得
     */
    static testMethod void getProfileSkillUsersTest1() {
        
        System.runAs(testAdminUser) {

            List<ProfileSkill> profileSkills = new List<ProfileSkill>();

            Test.startTest();
            
            List<ProfileSkillUser> results = dao.getProfileSkillUsers(profileSkills);
            
            Test.stopTest();

            System.assertEquals(results.isEmpty(), true);
        }
    }

    /**
     * プロフィールスキルユーザ取得
     */
    static testMethod void getProfileSkillUsersTest2() {
        
        System.runAs(testAdminUser) {

            String skillName = 'Apex';
            ProfileSkill profileSkill = SkillCommonTester.createProfileSkill(skillName, true);

            List<ProfileSkill> profileSkills = new List<ProfileSkill>();
            profileSkills.add(profileSkill);

            ProfileSkillUser profileSkillUser = SkillCommonTester.createProfileSkillUser(profileSkill, testAdminUser, true);

            Test.startTest();
            
            List<ProfileSkillUser> results = dao.getProfileSkillUsers(profileSkills);
            
            Test.stopTest();

            System.assertEquals(results.size(), 1);
        }
    }
}