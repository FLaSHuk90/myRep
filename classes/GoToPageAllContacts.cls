public class GoToPageAllContacts {

    public String name {get; set;}

    public GoToPageAllContacts(apexPages.standardController std ){

    }

   public PageReference getChange () {
        PageReference pref = new PageReference ('/apex/AllContactsForOrg');
        return pref;
    }
}