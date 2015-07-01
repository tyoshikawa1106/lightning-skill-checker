/**
 * SkillChecker
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
public with sharing class SkillCheckerController {

    private static SkillCheckerHelper helper = new SkillCheckerHelper();
    private static SkillCheckerDao dao = new SkillCheckerDao();
    // 検索キー
    public String searchKey {get; set;}

    /**
     * コンストラクタ
     */
    public SkillCheckerController() {
        this.searchKey = '';
    }

    /**
     * プロフィールスキル情報取得
     */
    @RemoteAction @AuraEnabled
    public static List<SkillCheckerWrapper> getProfileSkills(String searchKey) {
        // 初期化
        List<SkillCheckerWrapper> wrapperList = new List<SkillCheckerWrapper>();
        // プロフィールスキル情報取得
        List<ProfileSkill> profileSkills = dao.getProfileSkills(searchKey);
        // プロフィールスキルユーザ取得
        List<ProfileSkillUser> profileSkillUserList = dao.getProfileSkillUsers(profileSkills);
        // プロフィールスキルユーザマップ取得
        Map<Id, List<ProfileSkillUser>> profileSkillUserMap = helper.getProfileSkillUserMap(profileSkillUserList);
        // ラッパークラスにセット
        wrapperList = helper.getWrapperList(profileSkills, profileSkillUserMap);

        return wrapperList;
    }
}