global class AccountSendEmail {
    @future(callout=true)
    public static void sendEmail() { 
      EmailTemplate et = [SELECT Id,Subject, Body FROM EmailTemplate WHERE Name ='Event Change Piclist'];
		  List<string> toAddress = new List<string>();
		  toAddress.add('anya.didukhh@gmail.com');
		  Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
 	    mail.setTemplateId(et.Id);
  		mail.setToAddresses(toAddress);
      mail.setSubject(et.subject);
      mail.setHTMLBody(et.Body);
      mail.setSaveAsActivity(false);
      mail.setUseSignature(false);
	  	List<Messaging.SingleEmailMessage> allmsg = new List<Messaging.SingleEmailMessage>();
	  	allmsg.add(mail);

      try {
        Messaging.sendEmail(allmsg,false);
          return;
          } catch (Exception e) {
          System.debug(e.getMessage());
          }
      }
}