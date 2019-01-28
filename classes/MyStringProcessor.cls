/**
 * Created by User on 26.09.2018.
 */

public with sharing class MyStringProcessor implements StringProcessor{
/*
    List <String> list1 = new List <String>() ;
    List <String> list2 = new List <String>() ;
    MyStringProcessor mstr = new MyStringProcessor();


    for (integer i = 0; i < 10; i++){
    list1.add('listik ' + i);

}
//System.debug('list1 = ' + list1);
//System.debug(list1.size());
mstr.updateList(list1,list2);
*//*System.debug( 'list1 :' + list1);

for (integer j = 0; j < list1.size(); j++){

    list2.add(mstr.addPrefix(list1.get(j)));

}
system.debug( 'list2 :' + list2);
*/

    public String addPrefix (String str){
        return ('lala' + str);
    }

    public String addPostfix (String str){
        return (str + 'lala');
    }
    public String removeWhitespaces (String str){
        return (str.deleteWhitespace());
    }
    public  void updateList (List <String> list1 , List <String> list2){

    for (integer j = 0; j < list1.size(); j++){
           list2.add(addPrefix(list1.get(j)));
        }
        system.debug( 'list2 :' + list2);

    }
}