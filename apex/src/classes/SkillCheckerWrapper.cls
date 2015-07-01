/**
 * SkillChecker
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
public with sharing class SkillCheckerWrapper {
    
    @AuraEnabled
    public ProfileSkill profileSkill {get; set;}
    @AuraEnabled
    public List<ProfileSkillUser> profileSkillUsers {get; set;}

    /**
     * コンストラクタ
     */
    public SkillCheckerWrapper() {
        this.profileSkill = new ProfileSkill();
        this.profileSkillUsers = new List<ProfileSkillUser>();
    }

    /**
     * コンストラクタ
     */
    public SkillCheckerWrapper(ProfileSkill skill, List<ProfileSkillUser> skillUsers) {
        this.profileSkill = skill;
        this.profileSkillUsers = skillUsers;
    }
}