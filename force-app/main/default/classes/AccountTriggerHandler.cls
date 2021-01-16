public with sharing class AccountTriggerHandler extends TriggerHandler {
    private Map<Id, Account> newAccMap;
    private Map<Id, Account> OldAccMap;
    

    public AccountTriggerHandler() {
        this.newAccMap = (Map<Id, Account>) Trigger.newMap;
        this.OldAccMap = (Map<Id, Account>) Trigger.oldMap;
    }

    public override void beforeUpdate() {
        for(Account acc : (List<Account>)Trigger.new ) {
        	Account aOld = OldAccMap.get(acc.Id);
            if(acc.Type != aOld.Type){
            
                AccountSendEmail.sendEmail();
   		}
	}
    }
}