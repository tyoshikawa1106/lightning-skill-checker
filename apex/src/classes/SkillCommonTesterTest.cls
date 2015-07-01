/**
 * SkillChecker
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
@isTest
private class SkillCommonTesterTest {

    private static User testAdminUser = SkillCommonTester.getLoginUser();

    /**
     * テスト実行ユーザ取得
     */
    static testMethod void getLoginUserTest() {
        
        System.runAs(testAdminUser) {
            Test.startTest();
            
            User result1 = SkillCommonTester.getLoginUser();
            System.assertEquals(result1.Id, UserInfo.getUserId());
            
            Test.stopTest();
        }
    }

    /**
     * テスト実行ページ取得
     */
    static testMethod void getPageReferenceTest() {
        
        System.runAs(testAdminUser) {
            Test.startTest();
            
            PageReference result = SkillCommonTester.getPageReference();
            System.assertEquals(result.getUrl(), new PageReference('PageReference').getUrl());
            
            Test.stopTest();
        }
    }

    /**
     * プロフィールスキル
     */
    static testMethod void createProfileSkillTest() {
        
        System.runAs(testAdminUser) {

            String skillName = 'Apex';
            
            Test.startTest();
            
            // INSERTなし
            ProfileSkill result = SkillCommonTester.createProfileSkill(skillName, false);
            System.assertEquals(String.isEmpty(result.Id), true);
            
            // INSERTあり
            result = SkillCommonTester.createProfileSkill(skillName, true);
            System.assertEquals(String.isNotEmpty(result.Id), true);
            
            Test.stopTest();
        }
    }

    /**
     * プロフィールスキルユーザ
     */
    static testMethod void createProfileSkillUserTest() {
        
        System.runAs(testAdminUser) {

            String skillName = 'Apex';
            ProfileSkill profileSkill = SkillCommonTester.createProfileSkill(skillName, true);
            
            Test.startTest();
            
            // INSERTなし
            ProfileSkillUser result = SkillCommonTester.createProfileSkillUser(profileSkill, testAdminUser, false);
            System.assertEquals(String.isEmpty(result.Id), true);
            
            // INSERTあり
            result = SkillCommonTester.createProfileSkillUser(profileSkill, testAdminUser, true);
            System.assertEquals(String.isNotEmpty(result.Id), true);
            
            Test.stopTest();
        }
    }
}