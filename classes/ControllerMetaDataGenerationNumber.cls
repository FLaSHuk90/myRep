public with sharing class ControllerMetaDataGenerationNumber {
    public String yourNumber { get; set; }
    private String yourCity { get; set; }
    private Id userId;
    public String nameUser { get; set; }
    public Boolean hideButtons { get; set; }
    private String userNumber;
    private User userForId;
    List<User> allUsersOnOrg = new List<User>();

    public ControllerMetaDataGenerationNumber() {
        this.userId = UserInfo.getUserId();
        this.nameUser = UserInfo.getName();
        this.userForId = getCurrentUser();
        this.hideButtons = true;
    }

    private User getCurrentUser() {
        User userForId;
        allUsersOnOrg = [SELECT City,Car_Number__c FROM User WHERE id = :userId LIMIT 1];
        for (User oneUser : allUsersOnOrg) {
            if (oneUser.Id != userId) continue;
            userForId = oneUser;
        }
        return userForId;
    }
    private String generationShortNumber (){
        return String.valueOf(Math.random()).substring(2, 6);
    }

    public PageReference generateNewNumber() {
        String letterCode;
        Boolean containsCity = false;
        Integer regionCode = 0;
        String numbCode = generationShortNumber();
        List<User> allUsersOnOrgAllUsers = [SELECT Car_Number__c FROM User];
        List<Sities__mdt> allCity = [SELECT label,Region__c, Region__r.code__c FROM Sities__mdt];

        if (this.userForId.Car_Number__c == null) {
            for (Sities__mdt city : allCity) {
                if (city.label != this.userForId.City) continue;
                regionCode = Integer.valueOf(city.Region__r.code__c);
            }
            CodeNumber__c codForHierarchy = CodeNumber__c.getInstance(userId);
            letterCode = codForHierarchy.code__c;
            if (letterCode == null) {
                letterCode = 'NY';
            }

            if (regionCode != 0) {
                this.yourNumber = numbCode + ' ' + letterCode + '-' + String.valueOf(regionCode);
            } else {
                this.hideButtons = false;
                ApexPages.addMessage(new ApexPages.message(ApexPages.severity.WARNING, 'Not City'));
            }
            for (User oneUser : allUsersOnOrgAllUsers) {
                String carNumb = String.valueOf(oneUser.Car_Number__c);
                if (carNumb != this.yourNumber) continue;
                generateNewNumber();

            }
        } else {
            hideButtons = false;
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.WARNING, 'You Have Number ' + userForId.Car_Number__c));
        }
        return null;
    }
    public PageReference save() {
        for (User oneUser : this.allUsersOnOrg) {
            if (oneUser.id != this.userId) continue;
            oneUser.Car_Number__c = this.yourNumber;
        }
        try {
            update this.allUsersOnOrg;
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO, 'Save completed successfully'));
        } catch (Exception e) {
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.WARNING, e.getMessage()));
        }
        return null;
    }
    public PageReference generateNumbersForAllUsers() {
        String letterCode = '';
        Integer regionCode = 0;
        List<User> allUsersWithNumber = [SELECT Car_Number__c FROM User WHERE Car_Number__c != null];
        List<User> allUserWithOutNumber = [
                SELECT Car_Number__c,City
                FROM User
                WHERE Car_Number__c = null AND City != null AND Name != 'Automated Process'] ;
        List<Sities__mdt> allCity = [SELECT label,Region__c, Region__r.code__c FROM Sities__mdt];

        for (Sities__mdt city : allCity) {
            for (User oneUser : allUserWithOutNumber) {
                if (city.label == oneUser.City) {
                    regionCode = Integer.valueOf(city.Region__r.code__c);
                    String numbCode = generationShortNumber();
                    CodeNumber__c codForHierarchy = CodeNumber__c.getInstance(oneUser.id);
                    letterCode = codForHierarchy.code__c;
                    oneUser.Car_Number__c = numbCode + ' ' + letterCode + '-' + regionCode;
                }
            }
        }
        for (User userWithNumb : allUsersWithNumber) {
            for (User newUser : allUserWithOutNumber) {
                if (userWithNumb.Car_Number__c != newUser.Car_Number__c) continue;
                generateNumbersForAllUsers();
            }
        }
        try {
            update allUserWithOutNumber;
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO, 'Save completed successfully'));
        }   catch (Exception e) {
                ApexPages.addMessage(new ApexPages.message(ApexPages.severity.WARNING, e.getMessage()));
            }
        return null;
    }
}