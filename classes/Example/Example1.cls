public class Example1 {
    public List<String> getUniqueNames() {
        List<SObject> AllContacts = [SELECT name FROM contact];
        List<String> uniqueName = new List<String>();
        boolean f;
        System.debug(AllContacts.size());
        for (Integer i = 0; i < AllContacts.size(); i++) {
            f = true;
            for (Integer j = 0; j < uniqueName.size(); j++) {
                if (AllContacts[i].get('name') == uniqueName[j]) {
                    f = false;
                }
            }
            if (f != false) {
                uniqueName.add(String.valueof(AllContacts[i].get('name')));
            }
        }
        System.debug(uniqueName.size());
        return uniqueName;
    }


    public static void DeleteDublicateApiFieldName(String ApiNameObject, List<String> ListNameFields) {
        String strForFields;
        List <String> UniqueListValue = new List<String>();
        List <SObject> DoublecateListValue = new List<SObject>();
        for(String str : ListNameFields){
            if(strForFields == null) {
                strForFields = str;
            }
            else {
                strForFields = strForFields + ',' + str;
            }
        }
        List<SObject> FieldslistSobject = Database.query('SELECT ' + strForFields + ' FROM ' + ApiNameObject );
        System.debug(FieldslistSobject);

        for(SObject value : FieldslistSobject) {
            String FieldLine;
            for(String str : ListNameFields ) {
                FieldLine = FieldLine + (String)value.get(str);
            }
            if(UniqueListValue.contains(FieldLine)) {
                DoublecateListValue.add(value);
            }
            else{
                UniqueListValue.add(FieldLine);

            }
        }
        System.debug('lalala' + DoublecateListValue);
     delete DoublecateListValue;
    }
}