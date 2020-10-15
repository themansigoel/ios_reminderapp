import UIKit



func multipleDigitSum(n : Int) -> Int{
    var num = n
    var total = 0
    
    while(num < 10){
        var temp = num
        var sum = 0
        while (temp >= 0)
        {
             sum = sum + temp%10
        }
      temp = temp / 10
        total = sum
        
       
    }
     return total
}


func stringReversal(str : String)
{
    var arr  = Array( str);
    var i  = 0
    var result = " "
    while (i < arr.count)
    {
        var temp = arr[i]
        if (arr[i] == " ")
        {
            i += 1
        
        result = " \(temp)"
        }
        i = i + 1
    }
 
}
stringReversal(str: my name is mansi)
