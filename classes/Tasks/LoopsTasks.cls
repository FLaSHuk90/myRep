public class LoopsTasks {

  /**
   * Returns the 'Fizz','Buzz' or an original number as String using the following rules:
   * 1) return original number as String
   * 2) but if number multiples of three return 'Fizz'
   * 3) for the multiples of five return 'Buzz'
   * 4) for numbers which are multiples of both three and five return 'FizzBuzz'
   *
   * @param {number} num
   * @return {any}
   *
   * @example
   *   2 =>  '2'
   *   3 => 'Fizz'
   *   5 => 'Buzz'
   *   4 => '4'
   *  15 => 'FizzBuzz'
   *  20 => 'Buzz'
   *  21 => 'Fizz'
   *
   */
  public static String getFizzBuzz(Integer num) {
    String str = '';
    if(Math.mod(num,3) == 0 && Math.mod(num,5) == 0){
      str = 'FizzBuzz';
    }
    else if ((Math.mod(num,3) == 0 && Math.mod(num,5) != 0)){
      str = 'Fizz';
    }
    else if ((Math.mod(num,5) == 0 && Math.mod(num,3) != 0)) {
      str = 'Buzz';
    }
    else
      str = String.valueOf(num);


    return str;
  }

  /**
   * Returns the factorial of the specified integer n.
   *
   * @param {number} n
   * @return {number}
   *
   * @example:
   *   1  => 1
   *   5  => 120
   *   10 => 3628800
   */
  public static Integer getFactorial(Integer num) {
    integer f = 1;
    for(integer i = 0; i<= num; i++){
      if(i<2){
        f=1;
        System.debug('aaaa' + f);
      }
      else {
      f = f * i;
        System.debug('eeee' + f);
      }
    }
    System.debug(f);
    return f;
  }

  /**
   * Returns the sum of integer numbers between n1 and n2 (inclusive).
   *
   * @param {number} n1
   * @param {number} n2
   * @return {number}
   *
   * @example:
   *   1,2   =>  3  ( = 1+2 )
   *   5,10  =>  45 ( = 5+6+7+8+9+10 )
   *   -1,1  =>  0  ( = -1 + 0 + 1 )
   */
  public static Integer getSumBetweenNumbers(Integer num1, Integer num2) {
    integer sum =0;
    for(integer i = num1; i <= num2; i++){
      sum += i;
    }

    return sum;
  }

  /**
   * Returns true, if a triangle can be built with the specified sides a,b,c and false in any other ways.
   *
   * @param {number} a
   * @param {number} b
   * @param {number} c
   * @return {bool}
   *
   * @example:
   *   1,2,3    =>  false
   *   3,4,5    =>  true
   *   10,1,1   =>  false
   *   10,10,10 =>  true
   */
  public static Boolean isTriangle(Integer a, Integer b, Integer c) {
    Boolean bol;
    if(a + b > c && b + c > a && a + c > b){
      bol = true;
    }
    else {
      bol = false;
    }
    return bol;
  }

  /**
   * Returns true, if two specified axis-aligned rectangles overlap, otherwise false.
   * Each rectangle representing by Map<String, Integer> 
   *  {
   *     top: 5,
   *     left: 5,
   *     width: 20,
   *     height: 10
   *  }
   * 
   *  (5;5)
   *     -------------  
   *     |           | 
   *     |           |  height = 10
   *     ------------- 
   *        width=20    
   * 
   * NOTE: Please use canvas coordinate space (https://developer.mozilla.org/en-US/docs/Web/API/Canvas_API/Tutorial/Drawing_shapes#The_grid),
   * it differs from Cartesian coordinate system.
   * 
   * @param {Map<String, Integer>} rect1
   * @param {Map<String, Integer>} rect2
   * @return {bool}
   *
   * @example:
   *   { top: 0, left: 0, width: 10, height: 10 },
   *   { top: 5, left: 5, width: 20, height: 20 }    =>  true
   * 
   *   { top: 0, left: 0, width: 10, height: 10 },
   *   { top:20, left:20, width: 20, height: 20 }    =>  false
   *  
   */
  public static Boolean doRectanglesOverlap(Map<String, Integer> rect1, Map<String, Integer> rect2) {
        Integer le1 = rect1.get('left') + rect1.get('width');
        Integer to1 = rect1.get('top') + rect1.get('height');

    System.debug(le1);
    System.debug(to1);
        Boolean bol;
     if (le1 < rect2.get('left')  || to1 < rect2.get('top'))
     {
       bol = false;
     }
    else {
      bol = true;
    }
System.debug(bol);
    return bol;
  }

  /**
   * Returns true, if point lies inside the circle, otherwise false.
   * Circle is:
   *     Center Map<String, Double>: {
   *       x: 5,       
   *       y: 5
   *     },        
   *     Radius Integer: 20
   * Point is Map<String, Double> 
   *  {
   *     x: 5,
   *     y: 5
   *  }
   * 
   * @param {Map<String, Double>} center
   * @param {Integer} raduis
   * @param {Map<String, Double>} point
   * @return {bool}
   *
   * @example:
   *   center: { x:0, y:0 }, radius: 10, point: { x:0, y:0 }     => true
   *   center: { x:0, y:0 }, radius:10,  point: { x:10, y:10 }   => false
   *   
   */
  public static Boolean isInsideCircle(Map<String, Double> center, Integer radius, Map<String, Double> point) {
    Boolean ss = false ;
   if((Math.pow((point.get('x')- center.get('x')),2) + Math.pow((point.get('y') - center.get('y')),2)) < Math.pow(radius,2))
    {
      ss = true;
    }
    return ss;

  }

  /**
   * Returns the first non repeated char in the specified strings otherwise returns null.
   *
   * @param {string} str
   * @return {string}
   *
   * @example:
   *   'The quick brown fox jumps over the lazy dog' => 'T'
   *   'abracadabra'  => 'c'
   *   'entente' => null
   */
  public static String findFirstSingleChar(String str) {

    String pov = '';
    Integer count =0;
    for(integer i =0; i <str.length(); i++){
      for(integer j =0; j < str.length(); j++){
        if(str.substring(i,i+1).equals(str.substring(j,j+1))){
         /* System.debug('111 ='+ j+ str.substring(  i,i+1));
          System.debug('222 =' + i + str.substring( j,j+1));*/
          count ++;
          System.debug(count);
          if(count >= 2){
            count = 0;
            break;
          }
          }
          }
      if(count == 1){
        pov = pov + str.substring(i, i + 1);
        break;
      }
    }
    if(pov.length() == 0){
      pov = null;
    }
    System.debug(pov);
    return pov;
  }

  /**
   * Returns the string representation of math interval, specified by two points and include / exclude flags.
   * See the details: https://en.wikipedia.org/wiki/Interval_(mathematics)
   *
   * Please take attention, that the smaller number should be the first in the notation
   *
   * @param {number} a
   * @param {number} b
   * @param {bool} isStartIncluded
   * @param {bool} isEndIncluded
   * @return {string}
   *
   * @example
   *   0, 1, true, true   => '[0, 1]'
   *   0, 1, true, false  => '[0, 1)'
   *   0, 1, false, true  => '(0, 1]'
   *   0, 1, false, false => '(0, 1)'
   * Smaller number has to be first :
   *   5, 3, true, true   => '[3, 5]'
   *
   */
  public static String getIntervalString(Integer a, Integer b, Boolean isStartIncluded, Boolean isEndIncluded) {
    String str;
    String start;
    String ended;
    if(isStartIncluded == true) {
      start = '[';
    }
      else {
        start = '(';
    }

    if(isEndIncluded == true){
      ended = ']';
    }
    else
    {
      ended =')';
    }
    str = ( start + String.valueOf(a) + ', ' + String.valueOf(b) + ended);
    return str;
  }

  /**
   * Reverse the specified string (put all chars in reverse order)
   *
   * @param {string} str
   * @return {string}
   *
   * @example:
   * 'The quick brown fox jumps over the lazy dog' => 'god yzal eht revo spmuj xof nworb kciuq ehT'
   * 'abracadabra' => 'arbadacarba'
   * 'rotator' => 'rotator'
   * 'noon' => 'noon'
   */
  public static String reverseString(String str) {
    str = str.reverse();
    return str;
  }

  /**
   * Reverse the specified integer number (put all digits in reverse order)
   *
   * @param {number} num
   * @return {number}
   *
   * @example:
   *   12345 => 54321
   *   1111  => 1111
   *   87354 => 45378
   *   34143 => 34143
   */
  public static Integer reverseInteger(Integer num) {
    String str = String.valueOf(num).reverse();

    return Integer.valueOf(str);
  }

  /**
   * Returns the digital root of integer:
   *   step1 : find sum of all digits
   *   step2 : if sum > 9 then goto step1 otherwise return the sum
   *
   * @param {number} n
   * @return {number}
   *
   * @example:
   *   12345 ( 1+2+3+4+5 = 15, 1+5 = 6) => 6
   *   23456 ( 2+3+4+5+6 = 20, 2+0 = 2) => 2
   *   10000 ( 1+0+0+0+0 = 1 ) => 1
   *   165536 (1+6+5+5+3+6 = 26,  2+6 = 8) => 8
   */
  public static Integer getDigitalRoot(Integer num) {
    integer sum = 0;
    String a = String.valueOf(num);

        for (integer i = 0; i < a.length(); i++) {
          sum += Integer.valueof(a.substring(i, i + 1));
        }
        if(sum > 9){
          String e = String.valueOf(sum);
          sum =0;
          for( integer j = 0; j < e.length(); j++){
            sum += Integer.valueof(e.substring(j, j + 1));
          }
        }


    System.debug(sum);


    return sum;
  }

  /**
   * Returns true if the specified string has the balanced brackets and false otherwise.
   * Balanced means that is, whether it consists entirely of pairs of opening/closing brackets
   * (in that order), none of which mis-nest.
   * Brackets include [],(),{},<>
   *
   * @param {string} str
   * @return {boolean}
   *
   * @example:
   *   '' => true
   *   '[]'  => true
   *   '{}'  => true
   *   '()   => true
   *   '[[]' => false
   *   ']['  => false
   *   '[[][][[]]]' => true
   *   '[[][]][' => false
   *   '{)' = false
   *   '{[(<{[]}>)]}' = true 
   */
  public static Boolean isBracketsBalanced(String str) {
    String a1 = '['; Integer aa1 = 0;
    String a2 = ']'; integer aa2 = 0;
    String b1 = '{'; Integer bb1 = 0;
    String b2 = '}'; Integer bb2 = 0;
    String c1 = '('; Integer cc1 = 0;
    String c2 = ')'; Integer cc2 = 0;
    String e1 = '<'; Integer ee1 = 0;
    String e2 = '>'; Integer ee2 = 0;
    boolean cc = true;


    for (integer i = 0; i < str.length(); i++) {
      if (str != null) {
        if (str.substring(i, i + 1) == a1) {
          aa1++;
        } else if (str.substring(i, i + 1) == a2) {
          aa2++;
        } else if (str.substring(i, i + 1) == b1) {
          bb1++;
        } else if (str.substring(i, i + 1) == b2) {
          bb2++;
        } else if (str.substring(i, i + 1) == c1) {
          cc1++;
        } else if (str.substring(i, i + 1) == c2) {
          cc2++;
        } else if (str.substring(i, i + 1) == e1) {
          ee1++;
        } else if (str.substring(i, i + 1) == e2) {
          ee2++;
        } else {
          System.debug(' гони скобки');
        }
        // System.debug('a= ' + a + ' b= ' + b + ' c= ' + c + ' e= ' + e);
      } else {
        cc = false;
        break;
      }
      if (aa2 > aa1 || bb2 > bb1 || cc2 > cc1 || ee2 > ee1) {
        cc = false;
        break;
      } else {
        cc = false;
      }
      if (aa1 == aa2 && bb1 == bb2 && cc1 == cc2 && ee1 == ee2) {
        cc = true;
      }
      if (str.substring(i, i + 1).equals(a2) && str.substring(i - 1, i).equals(b1) || str.substring(i, i + 1).equals(a2) && str.substring(i - 1, i).equals(c1) || str.substring(i, i + 1).equals(a2) && str.substring(i - 1, i).equals(e1)) {
        cc = false;
        break;
      } else if ((str.substring(i, i + 1).equals(b2) && str.substring(i - 1, i).equals(a1) || str.substring(i, i + 1).equals(b2) && str.substring(i - 1, i).equals(c1) || str.substring(i, i + 1).equals(b2) && str.substring(i - 1, i).equals(e1))) {
        cc = false;
        break;
      } else if ((str.substring(i, i + 1).equals(c2) && str.substring(i - 1, i).equals(a1) || str.substring(i, i + 1).equals(c2) && str.substring(i - 1, i).equals(b1) || str.substring(i, i + 1).equals(c2) && str.substring(i - 1, i).equals(e1))) {
        cc = false;
        break;
      } else if ((str.substring(i, i + 1).equals(e2) && str.substring(i - 1, i).equals(a1) || str.substring(i, i + 1).equals(e2) && str.substring(i - 1, i).equals(c1) || str.substring(i, i + 1).equals(e2) && str.substring(i - 1, i).equals(b1))) {
        cc = false;
        break;
      }
    }
    return cc;
  }

  /**
   * Returns the human readable string of time period specified by the start and end time.
   * The result string should be constrcuted using the folliwing rules:
   *
   * ---------------------------------------------------------------------
   *   Difference                 |  Result
   * ---------------------------------------------------------------------
   *    0 to 45 seconds           |  a few seconds ago
   *   45 to 90 seconds           |  a minute ago
   *   90 seconds to 45 minutes   |  2 minutes ago ... 45 minutes ago
   *   45 to 90 minutes           |  an hour ago
   *  90 minutes to 22 hours      |  2 hours ago ... 22 hours ago
   *  22 to 36 hours              |  a day ago
   *  36 hours to 25 days         |  2 days ago ... 25 days ago
   *  25 to 45 days               |  a month ago
   *  45 to 345 days              |  2 months ago ... 11 months ago
   *  345 to 545 days (1.5 years) |  a year ago
   *  546 days+                   |  2 years ago ... 20 years ago
   * ---------------------------------------------------------------------
   *
   * @param {DateTime} startDate
   * @param {DateTime} endDate
   * @return {string}
   *
   * @example
   *   DateTime('2000-01-01 01:00:00'), DateTime('2000-01-01 01:00:01')  => 'a few seconds ago'
   *   DateTime('2000-01-01 01:00:00'), DateTime('2000-01-01 01:00:05')  => '5 minutes ago'
   *   DateTime('2000-01-01 01:00:00'), DateTime('2000-01-02 03:00:05')  => 'a day ago'
   *   DateTime('2000-01-01 01:00:00'), DateTime('2015-01-02 03:00:05')  => '15 years ago'
   *
   */
  public static String timespanToHumanString(DateTime startDate, DateTime endDate) {

    Integer seconds = endDate.second() - startDate.second();
    Integer minuts = endDate.minute() - startDate.minute();
    Integer hours = endDate.hour() - startDate.hour();
    Integer days = endDate.day() - startDate.day();
    Integer months = endDate.month() - startDate.month();
    Integer year = endDate.year() - startDate.year();
    String str = '';

    if (year == 0 && months == 0 && days == 0 && hours == 0 && minuts == 0 && seconds != 0 && seconds <= 45) {
      str = 'a few seconds ago';
    }

    else if (year == 0 && months == 0 && days == 0 && hours == 0 && minuts == 0 && seconds != 0 && seconds > 45) {
      str = 'a minute ago';
    }

    else if (year == 0 && months == 0 && days == 0 && hours == 0 && minuts >= 0 && minuts <= 1 && seconds <= 30) {
      str = 'a minute ago';
    }

    else if (year == 0 && months == 0 && days == 0 && hours == 0 && minuts >= 1 && minuts <= 45) {
      if (seconds <= 30 && minuts < 45) {
        str = (minuts + ' minutes ago');
      } else if (seconds > 30 && minuts < 45) {
        str = ((minuts + 1) + ' minutes ago');
      } else if (minuts == 45 && seconds == 0) {
        str = (minuts + ' minutes ago');
      } else if (minuts == 45 && seconds > 0) {
        str = 'an hour ago';
      }
    }

    else if (year == 0 && months == 0 && days == 0 && hours == 0 && minuts >= 45) {
      str = 'an hour ago';
    }

    else if (year == 0 && months == 0 && days == 0 && hours < 2 && (hours == 1 && minuts <= 30 && seconds <= 0)) {
      str = 'an hour ago';
    }

    else if (year == 0 && months == 0 && days == 0 && hours >= 1 && hours <= 22) {
      if (hours >= 2 && minuts <= 30) {
        str = hours + ' hours ago';
        if (minuts == 30 && seconds > 0) {
          str = (hours + 1) + ' hours ago';
        }
      } else {
        str = (hours + 1) + ' hours ago';
      }
      if (hours == 22 && seconds > 0) {
        str = 'a day ago';
      }
    }

    else if (year == 0 && months == 0 && days == 0 && hours > 22 && hours <= 36) {
      str = 'a day ago';
    }

    else if (year == 0 && months == 0 && days <= 2) {
      str = 'a day ago';
    }
    if (year == 0 && months == 0 && days >= 1 && days <= 25) {
      if (days == 1 && hours >= 12 && (minuts > 0 || seconds > 0)) {
        str = (days + 1) + ' days ago';
      } else if ((minuts == 30 && seconds > 0)) {
        str = (days + 1) + ' days ago';
      } else if (minuts <= 30 && seconds == 0 && hours <= 12 && days > 1) {
        str = days + ' days ago';
      }
    }

    if (year == 0 && months == 0 && (days == 25 && (minuts > 0 || seconds > 0))) {
      str = 'a month ago';
    } else if (year == 0 && months == 1) {
      if (days < 15) {
        str = 'a month ago';
      }
        else if (days >=15){
            str = months +1 + ' months ago';
        }
    }
    else if (year == 0 && months > 2 && months <= 11) {
      str = months + ' months ago';
    }
      if(days > 15  && months >3 && months !=11)
      {
          str = months + 1 +' months ago';
      }

    else if(year == 0 && months == 11 && (days > 10 || minuts > 0 || seconds >0)){
        str = 'a year ago';
    }

    else if(year ==1 && months < 6)  {
        str = 'a year ago';
    }
    else if( year > 2 || (year == 2 && months > 6)){
        str = year + ' years ago';
    }


    return str;
  }
}