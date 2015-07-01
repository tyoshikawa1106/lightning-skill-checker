({
	gotoDetail : function(component, helper, event) {
		var navEvt = $A.get("e.force:navigateToSObject");
		navEvt.setParams({
			"recordId": component.get("v.item.profileSkill.Id"),
			"slideDevName": "detail"
		});
		navEvt.fire();
	},
})