/**
 * SkillChecker
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
public with sharing class SkillCheckerHelper {

    /**
     * コンストラクタ
     */
    public SkillCheckerHelper() {
        
    }

    /**
     * プロフィールスキルユーザマップ取得
     */
    public Map<Id, List<ProfileSkillUser>> getProfileSkillUserMap(List<ProfileSkillUser> profileSkillUsers) {

        Map<Id, List<ProfileSkillUser>> profileSkillUserMap = new Map<Id, List<ProfileSkillUser>>();
        for (ProfileSkillUser skillUser : profileSkillUsers) {
            List<ProfileSkillUser> wkSkillUsers = new List<ProfileSkillUser>();
            if (profileSkillUserMap.containsKey(skillUser.ProfileSkillId)) {
                wkSkillUsers = profileSkillUserMap.get(skillUser.ProfileSkillId);
            }
            // Add List
            wkSkillUsers.add(skillUser);
            // Add Map
            profileSkillUserMap.put(skillUser.ProfileSkillId, wkSkillUsers);
        }

        return profileSkillUserMap;
    }

    /**
     * Map情報からプロフィールスキル情報取得
     */
    public List<ProfileSkillUser> getTargetProfileSkillUsers(ProfileSkill skill, Map<Id, List<ProfileSkillUser>> profileSkillUserMap) {
        List<ProfileSkillUser> skillUsers = new List<ProfileSkillUser>();
        if (profileSkillUserMap.containsKey(skill.Id)) {
            skillUsers = profileSkillUserMap.get(skill.Id);
        }

        return skillUsers;
    }

    /**
     * ラッパーリスト取得
     */
    public List<SkillCheckerWrapper> getWrapperList(List<ProfileSkill> profileSkills, Map<Id, List<ProfileSkillUser>> profileSkillUserMap) {
        List<SkillCheckerWrapper> wrapperList = new List<SkillCheckerWrapper>();
        for (ProfileSkill skill : profileSkills) {
            // Map情報からプロフィールスキル情報取得
            List<ProfileSkillUser> targetProfileSkillUsers = this.getTargetProfileSkillUsers(skill, profileSkillUserMap);
            // Add List
            wrapperList.add(new SkillCheckerWrapper(skill, targetProfileSkillUsers));
        }

        return wrapperList;
    }
}