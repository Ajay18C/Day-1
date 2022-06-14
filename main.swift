/*class Secret{
  func display(){}
  func LuckMeter(){}
}
class sumOfDigits:Secret{
  private var num:Int;
  private var res:Int;
  init(num:Int){
    self.num=num
    self.res=0
  }
  override func display(){
    while(num > 0 || res > 9){
      if(num == 0){
        num=res 
        res=0
      }
      self.res+=num%10
      self.num=num/10
    }
  }
  override func LuckMeter(){
    switch(self.res/3){
      case 0:
      print("::::::::::::::::::::::::::::::::::::::::")
      print("-----100% LUCK🍀-----")
      print("                                        ")
      print("All Belongs To You")
      case 1:
      print("::::::::::::::::::::::::::::::::::::::::")
      print("-----75% LUCK☘️-----")
      print("                                        ")
      print("The only thing that overcomes hard luck is hard work.")
      case 2:
      print("::::::::::::::::::::::::::::::::::::::::")
      print("-----50% luck🌱-----")
      print("                                        ")
      print("Concentration attracts luck factor.")
      case 3:
      print("::::::::::::::::::::::::::::::::::::::::")
      print("-----30% LUCK🍁-----")
      print("                                        ")
      print("Luck is believing you’re lucky.")
      default:
      print("::::::::::::::::::::::::::::::::::::::::")
    }
  }
}
class FortuneTeller{
  private var name:String;
  private var age:Int;
  private var color:String;
  var sum=0;
  var luckyNum=0;
  init(name:String,age:Int,color:String){
    self.name=name;
    self.age=age;
    self.color=color
  }
  func CalculateFortune(){
    let nameArray=Array(self.name);
    for i in nameArray{
      sum+=Int(i.asciiValue!)
    }
    sum+=age
    let colorArray=Array(self.color);
    for i in colorArray{
      sum+=Int(i.asciiValue!)
    }
    let SOD=sumOfDigits(num:sum)//creating object for sumOfDigits class as SOD
    SOD.display()
    SOD.LuckMeter()
  }
}
//____main function____

var nameList=[String?]()
var temp=""
while(true){
print("                                        ")
print("                                        ")
print("::::::::::::::::::::::::::::::::::::::::");
print("-----THIS IS FORTUNE TELLER MACHINE-----");
print();
print("*****ENTER YOUR NAME ***** :");
let name=readLine();//get name from user
print("*****ENTER YOUR AGE ***** :");
let age=Int(readLine()!);//get age from user
temp=name!+String(age!)
if nameList.contains(temp){
  print("-----ALREADY DONE-----")
  break
}
nameList.append(temp)
print("*****ENTER YOUR FAVORITE COLOR ***** :");
let color=readLine();//get fav color from user
let obj1=FortuneTeller(name:name!,age:age!,color:color!);//creating object for FortuneTeller class as obj1
obj1.CalculateFortune()//calling class method using object
print("                                        ")
print("-----PRESS ENTER TO RETRY-----")
let anmi=readLine()
if(anmi != ""){
  break
}
}
*/
print("Enter 1 to check your Luck \n\nEnter 2 to boost your luck")
let choice=Int(readLine()!) 
var luck :Int
switch choice {
  case 2:
  print("\n\n::::::::::::::::::::::::::::::::::::::::\n");
  print("-----THIS IS FORTUNE BOOSTER-----");
  print();
  default:
    break
}