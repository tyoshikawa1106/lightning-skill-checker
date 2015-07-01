/**
 * SkillChecker
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
public with sharing class SkillCheckerDao {

    /**
     * コンストラクタ
     */
    public SkillCheckerDao() {
        
    }

    /**
     * プロフィールスキル取得
     */
    public List<ProfileSkill> getProfileSkills(String searchKey) {

        String key = searchKey + '%';

        return [
            SELECT
                 Id
                ,Name
                ,UserCount
            FROM
                ProfileSkill
            WHERE
                Name LIKE: key
            ORDER BY Name ASC
            LIMIT 200
        ];
    }

    /**
     * プロフィールスキルユーザ取得
     */
    public List<ProfileSkillUser> getProfileSkillUsers(List<ProfileSkill> profileSkills) {
        return [
            SELECT
                 Id
                ,User.Name
                ,User.SmallPhotoUrl
                ,EndorsementCount
                ,ProfileSkillId
            FROM
                ProfileSkillUser
            WHERE
                ProfileSkillId IN: profileSkills
            ORDER BY EndorsementCount DESC, User.Name ASC
            LIMIT 2000
        ];
    }
}