/**
 * SkillChecker
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
@isTest
private class SkillCheckerHelperTest {

    private static SkillCheckerHelper helper = new SkillCheckerHelper();
    private static User testAdminUser = SkillCommonTester.getLoginUser();

    /**
     * プロフィールスキルユーザマップ取得
     */
    static testMethod void getProfileSkillUserMapTest1() {
        
        System.runAs(testAdminUser) {

            List<ProfileSkillUser> profileSkillUsers = new List<ProfileSkillUser>();

            Test.startTest();
            
            Map<Id, List<ProfileSkillUser>> results = helper.getProfileSkillUserMap(profileSkillUsers);
            
            Test.stopTest();

            System.assertEquals(results.isEmpty(), true);
        }
    }

    /**
     * プロフィールスキルユーザマップ取得
     */
    static testMethod void getProfileSkillUserMapTest2() {
        
        System.runAs(testAdminUser) {

            String skillName = 'Apex';
            ProfileSkill profileSkill = SkillCommonTester.createProfileSkill(skillName, true);
            ProfileSkillUser profileSkillUser = SkillCommonTester.createProfileSkillUser(profileSkill, testAdminUser, true);
            List<ProfileSkillUser> profileSkillUsers = new List<ProfileSkillUser>();
            profileSkillUsers.add(profileSkillUser);
            profileSkillUsers.add(profileSkillUser);

            Test.startTest();
            
            Map<Id, List<ProfileSkillUser>> results = helper.getProfileSkillUserMap(profileSkillUsers);
            
            Test.stopTest();

            System.assertEquals(results.size(), 1);
            System.assertEquals(results.get(profileSkillUser.ProfileSkillId).size(), 2);
        }
    }

    /**
     * Map情報からプロフィールスキル情報取得
     */
    static testMethod void getTargetProfileSkillUsersTest1() {
        
        System.runAs(testAdminUser) {

            ProfileSkill skill = new ProfileSkill();
            Map<Id, List<ProfileSkillUser>> profileSkillUserMap = new Map<Id, List<ProfileSkillUser>>();

            Test.startTest();
            
            List<ProfileSkillUser> results = helper.getTargetProfileSkillUsers(skill, profileSkillUserMap);
            
            Test.stopTest();

            System.assertEquals(results.isEmpty(), true);
        }
    }

    /**
     * Map情報からプロフィールスキル情報取得
     */
    static testMethod void getTargetProfileSkillUsersTest2() {
        
        System.runAs(testAdminUser) {

            String skillName = 'Apex';
            ProfileSkill profileSkill = SkillCommonTester.createProfileSkill(skillName, true);
            ProfileSkillUser profileSkillUser = SkillCommonTester.createProfileSkillUser(profileSkill, testAdminUser, true);
            List<ProfileSkillUser> profileSkillUsers = new List<ProfileSkillUser>();
            profileSkillUsers.add(profileSkillUser);
            profileSkillUsers.add(profileSkillUser);

            Map<Id, List<ProfileSkillUser>> profileSkillUserMap = helper.getProfileSkillUserMap(profileSkillUsers);

            Test.startTest();
            
            List<ProfileSkillUser> results = helper.getTargetProfileSkillUsers(profileSkill, profileSkillUserMap);
            
            Test.stopTest();

            System.assertEquals(results.size(), 2);
        }
    }

    /**
     * ラッパーリスト取得
     */
    static testMethod void getWrapperListTest1() {
        
        System.runAs(testAdminUser) {

            List<ProfileSkill> profileSkills = new List<ProfileSkill>();
            Map<Id, List<ProfileSkillUser>> profileSkillUserMap = new Map<Id, List<ProfileSkillUser>>();

            Test.startTest();
            
            List<SkillCheckerWrapper> results = helper.getWrapperList(profileSkills, profileSkillUserMap);
            
            Test.stopTest();

            System.assertEquals(results.isEmpty(), true);
        }
    }

    /**
     * ラッパーリスト取得
     */
    static testMethod void getWrapperListTest2() {
        
        System.runAs(testAdminUser) {

            String skillName = 'Apex';
            ProfileSkill profileSkill = SkillCommonTester.createProfileSkill(skillName, true);

            List<ProfileSkill> profileSkills = new List<ProfileSkill>();
            profileSkills.add(profileSkill);

            ProfileSkillUser profileSkillUser = SkillCommonTester.createProfileSkillUser(profileSkill, testAdminUser, true);
            List<ProfileSkillUser> profileSkillUsers = new List<ProfileSkillUser>();
            profileSkillUsers.add(profileSkillUser);
            profileSkillUsers.add(profileSkillUser);

            Map<Id, List<ProfileSkillUser>> profileSkillUserMap = helper.getProfileSkillUserMap(profileSkillUsers);

            Test.startTest();
            
            List<SkillCheckerWrapper> results = helper.getWrapperList(profileSkills, profileSkillUserMap);
            
            Test.stopTest();

            System.assertEquals(results.size(), 1);
        }
    }
}