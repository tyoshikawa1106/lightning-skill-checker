/**
 * SkillChecker
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
public with sharing class SkillCommonTester {
    
    /**
     * テスト実行ユーザ取得
     */
    public static User getLoginUser() {
        return new User(Id = UserInfo.getUserId());
    }

    /**
     * テスト実行ページ取得
     */
    public static PageReference getPageReference() {
        return new PageReference('PageReference');
    }

    /**
     * プロフィールスキル
     */
    public static ProfileSkill createProfileSkill(String skillName, Boolean isInsert) {
        
        ProfileSkill profileSkill = new ProfileSkill(
            Name = skillName
        );
        
        if (isInsert) {
            insert profileSkill;
        }
        return profileSkill;
    }

    /**
     * プロフィールスキルユーザ
     */
    public static ProfileSkillUser createProfileSkillUser(ProfileSkill profileSkill, User user, Boolean isInsert) {
        
        ProfileSkillUser profileSkillUser = new ProfileSkillUser(
             ProfileSkillId = profileSkill.Id
            ,UserId = user.Id
        );
        
        if (isInsert) {
            insert profileSkillUser;
        }
        return profileSkillUser;
    }
}