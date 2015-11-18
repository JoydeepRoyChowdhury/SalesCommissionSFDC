public with sharing class TestController2 {
 



    private final Fundraiser__c account;

 

    public TestController2 () {

        account = [SELECT Id, Name FROM Fundraiser__c

                   WHERE Id = 'a002800000HVCqB'];

    }

 

    public Fundraiser__c getAccount() {

        return account;

    }

 

    public PageReference save() {

        update account;

        return null;
    }
}