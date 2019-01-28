public class Example5 {
    public static void func() {
        List<contact> listContacts = [SELECT name FROM contact];
        List<contact> listNewContacts = new List<contact>();
        for(contact c: listContacts) {
            Boolean f = false;
            for(Integer i=0;i<listNewContacts.size();i++) {
                if(c.Name == listNewContacts[i].Name) {
                    f=true;
                }
            }
            if(f != true) {
              listNewContacts.add(c);
            }
        }
        delete listNewContacts;
        List<lead> allLead = [SELECT name FROM Lead];
        List<lead> allLeadnew = new List<lead>();
        for(lead c: allLead) {
            Boolean f = false;
            for(Integer i = 0; i < allLeadnew.size(); i++) {
                if(c.Name == allLeadnew[i].Name) {
                    f=true;
                }
            }
            if(f != true) {
              allLeadnew.add(c);
            }
        }
        delete allLeadnew;
    }
}