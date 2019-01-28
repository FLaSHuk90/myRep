/**
 * Created by User on 02.11.2018.
 */

public with sharing class RecurseMetods {
    static String viewStringNumb = '';
    static String viewConverteNumb = '';

    public static void reverseCharNumber (Integer incomingNumber) {
        Integer outComingNumber = 0;
        String str = (String.valueOf(incomingNumber));
        viewStringNumb = viewStringNumb + str.right(1);

        if(str.length() > 1 ) {
            System.debug(str.right(1));
            str = str.removeEnd(str.right(1));
            outComingNumber = Integer.valueOf(str);
            ReverseCharNumber(outComingNumber);
        }
        else if(str.length() == 1) {
            System.debug(viewStringNumb );
        }
    }

    public static void convertedTensInDouble (Integer inComingNumber) {
        Integer modd = 0;
        modd = Math.mod(inComingNumber,2);
        viewConverteNumb = viewConverteNumb + String.valueOf(modd);
        if(inComingNumber >= 2){
            convertedTensInDouble(inComingNumber/2);
        }
        else if (inComingNumber < 2){

            System.debug(viewConverteNumb.reverse());
            System.debug('111100010101110010101101000111');
        }

    }
}