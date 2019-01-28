/**
 * Created by User on 25.09.2018.
 */
/* SKRIPT

Rectangle rect = new Rectangle();
Integer j = 4;
for(integer i = 1; i<=9; i++)  {
++j;
System.debug(rect.setCreateNewSentence(i,j));
System.debug('perimetr = ' + rect.getCalculationPerimeter(i,j));
System.debug( 'area = ' + rect.getCalculationArea(i,j));
System.debug(rect.RectangleOrSquare(i,j));
}

*/

public with sharing class Rectangle {

    Integer length, width ;

    public String setCreateNewSentence(integer a, integer b){
        if ((a == null || b == null) ||( a <= 0 || b <= 0)) {
            return ('Введите данные');
        }
        else {
            length = a;
            width = b;
            return ('length = ' + length + ' width = ' + width);
        }
    }

    public String getCalculationPerimeter(integer a, integer b){
       if((a == null || b == null) ||( a <= 0 || b <= 0)) {
           return 'Введите корректные данные';
       }
       else {
           return String.valueOf((a + b) * 2) ;
       }
    }

    public String getCalculationArea(integer a, integer b){
        if ((a == null || b == null) ||( a <= 0 || b <= 0)) {
            return 'Введите корректные данные';
        }
        else
            return String.valueOf( a * b);
    }

    public String RectangleOrSquare (integer a, integer b){
     if ((a == null || b == null) ||( a <= 0 || b <= 0)) {
         return ('Введите данные');
     }
     else {
        if(a == b){
            return 'You have a square';
        }
        else
            return 'You have a rectangle';
        }
    }

}