({
    searchKeyChange : function(component, event) {
        var searchInput = component.find("searchInput");
	    var searchValue = searchInput.get("v.value");
        
        var myEvent = $A.get("e.c:LightningSkillSearchKeyChange");
        myEvent.setParams({"searchKey": searchValue});
        myEvent.fire();
    },
})