import Foundation

protocol Secret{
  func display()
  func LuckMeter()
}
class sumOfDigits:Secret{
  private var num:Int;
  var res:Int;
  init(num:Int){
    self.num=num
    self.res=0
  }
  func display(){
    while(num > 0 || res > 9){
      if(num == 0){
        num=res 
        res=0
      }
      self.res+=num%10
      self.num=num/10
    }
  }
  func LuckMeter(){
    switch(self.res/3){
      case 0:
      print("::::::::::::::::::::::::::::::::::::::::")
      print("-----100% LUCK 🍀-----")
      print("                                        ")
      print("All Belongs To You")
      case 1:
      print("::::::::::::::::::::::::::::::::::::::::")
      print("-----75% LUCK ☘️-----")
      print("                                        ")
      print("The only thing that overcomes hard luck is hard work.")
      case 2:
      print("::::::::::::::::::::::::::::::::::::::::")
      print("-----50% LUCK 🌱-----")
      print("                                        ")
      print("Concentration attracts luck factor.")
      case 3:
      print("::::::::::::::::::::::::::::::::::::::::")
      print("-----30% LUCK 🍁-----")
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
  var luckyNumber=0
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
    self.luckyNumber=SOD.res/3
  }
}
class BoostFortune{
  var cou=0
  let date = Date()
  let calendar = Calendar.current
  let minutes:Int
  let seconds:Int
  var Timer:Float
  init(){
    print("Click \'ENTER\' and start task to boost your luck or \"0\" to menu")
    self.minutes = self.calendar.component(.minute, from: date)
    self.seconds = self.calendar.component(.second, from: date)
    self.Timer=0
  }
  func task(){
    var task1:String
    var task2:String
    var task3:String
    let diff1:Float
    let diff2:Float
    let diff3:Float
    self.Timer=Float(self.minutes)+Float(self.seconds)/60.0
    print("Enter \"BOOST\"") //task 1
    task1=readLine()!
    task1=task1.uppercased()
    diff1=abs((Float(self.minutes)+Float(self.seconds)/60.0)-self.Timer)
    if(task1 == "BOOST"){
      self.cou+=1
    }
    self.Timer=Float(self.minutes)+Float(self.seconds)/60.0
    print("Enter \"LUCKY\" ")  //task 2
    task2=readLine()!
    task2=task2.uppercased()
    diff2=abs((Float(self.minutes)+Float(self.seconds)/60.0)-self.Timer)
    if(task2 == "LUCKY" && diff1 >= diff2 ){
      self.cou+=1
    }
    self.Timer=Float(self.minutes)+Float(self.seconds)/60.0
    print("Enter \"GOODA\" ")   //task 3
    task3=readLine()!
    task3=task3.uppercased()
    diff3=abs((Float(self.minutes)+Float(self.seconds)/60.0)-self.Timer)
    if(task1 == "GOODA" && diff2 > diff3){
      self.cou+=1
    }
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
if(obj1.luckyNumber != 0){
  print("\n-----PRESS \"1\" TO BOOST YOUR LUCK-----")
  let anmi=readLine()
if(anmi != ""){
  print("\n\n::::::::::::::::::::::::::::::::::::::::\n");
  print("-----THIS IS FORTUNE BOOSTER-----");
  print("Here you can boost your luck");
  print("\nyour current luck is \(obj1.luckyNumber)\n")
  let obj2=BoostFortune()
  let tasks=readLine()
  if(tasks == ""){
    obj2.task()
    if(obj2.cou == 3){
      obj1.luckyNumber-=1
      obj1.CalculateFortune()
    }
    else{
      print("\n Finsh task early as possible and correctly \n")
    }
  }
  else if(tasks == "0"){
    continue
  }
  
}
else{
break
}
}
  
  else{
print("\n-----PRESS ENTER TO RETRY-----")
let anmi=readLine()
if(anmi != ""){
  break
}
  }
}
