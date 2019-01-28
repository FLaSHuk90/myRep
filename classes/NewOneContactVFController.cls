public class NewOneContactVFController {
    public Contact contact {get; set;}

    public NewOneContactVFController(){
        try{
            contact = [SELECT name FROM contact WHERE Id =:ApexPages.CurrentPage().getParameters().get('id')];
        }catch (Exception e){
            contact = new Contact(FirstName = 'Уася', LastName = 'пупкин');
        }
    }

   public PageReference allContacts() {
       PageReference pageRef = new PageReference('/apex/NewPageAllContacts');
       return  pageRef;
   }
}