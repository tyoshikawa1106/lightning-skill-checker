({
    doInit : function(component) {
		var searchKey = '';
        var action = this.getSearchAction(component, searchKey);
        $A.enqueueAction(action);
	},
    searchKeyChange : function(component, event) {
        var searchKey = event.getParam("searchKey");
        var action = this.getSearchAction(component, searchKey);
        $A.enqueueAction(action);
    },
    getSearchAction : function(component, searchKey) {
    	var action = component.get("c.getProfileSkills");
        action.setParams({
          "searchKey": searchKey
        });
        action.setCallback(this, function(data) {
            component.set("v.records", data.getReturnValue());
        });
		return action;
	},
})