public class Example2 {
	public Set<String> getUniqueContactNames() {
        Set<String> uniqueContactNames = new Set<String>();
        List<Contact> allContacts = [SELECT Name FROM Contact];
        
        for(Contact cont: allContacts) {
            uniqueContactNames.add(cont.Name);
        }
        return uniqueContactNames;
    }
}