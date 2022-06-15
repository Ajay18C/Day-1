import Foundation

protocol Secret{
  func display()
  func LuckMeter()
}
class sumOfDigits:Secret{
  private var num:Int;
  var res:Int;
  init(luk:Int){
    self.res=(luk-1)*3
    self.num=0
  }
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
      print("\n::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::\n")
      print("\t\t\t-----100% LUCK 🍀-----\n")
      print("\tAll Belongs To You")
      case 1:
      print("\n::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::\n")
      print("\t\t\t-----75% LUCK ☘️-----\n")
      print("\tThe only thing that overcomes hard luck is hard work.")
      case 2:
      print("\n::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::\n")
      print("\t\t\t-----50% LUCK 🌱-----\n")
      print("\tConcentration attracts luck factor.")
      case 3:
      print("\n::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::\n")
      print("\t\t\t-----30% LUCK 🍁-----\n")
      print("\tLuck is believing you’re lucky.")
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
  func addLuck(num:Int){
      let SOD1=sumOfDigits(luk:num)
      SOD1.LuckMeter()
    }
}
class BoostFortune{
  var cou=0
  var date = Date()
  var calendar = Calendar.current
  var minutes:Int
  var seconds:Int
  var Timer:Float
  init(){
    print("Click \'ENTER\' and start task to boost your luck or \"0\" to menu ",terminator:"")
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
    self.date = Date()
    self.calendar = Calendar.current
    self.minutes = self.calendar.component(.minute, from: date)
    self.seconds = self.calendar.component(.second, from: date)
    self.Timer=Float(self.minutes)+Float(self.seconds)/60.0
    print("Enter \"BOOST\" ",terminator:"") //task 1
    task1=readLine()!
    task1=task1.uppercased()
    self.date = Date()
    self.calendar = Calendar.current
    self.minutes = self.calendar.component(.minute, from: date)
    self.seconds = self.calendar.component(.second, from: date)
    diff1=abs((Float(self.minutes)+Float(self.seconds)/60.0)-self.Timer)
    if(task1 == "BOOST"){
      self.cou+=1
    }
    self.date = Date()
    self.calendar = Calendar.current
    self.minutes = self.calendar.component(.minute, from: date)
    self.seconds = self.calendar.component(.second, from: date)
    self.Timer=Float(self.minutes)+Float(self.seconds)/60.0
    print("Enter \"LUCKY\" ",terminator:"")  //task 2
    task2=readLine()!
    task2=task2.uppercased()
    self.date = Date()
    self.calendar = Calendar.current
    self.minutes = self.calendar.component(.minute, from: date)
    self.seconds = self.calendar.component(.second, from: date)
    diff2=abs((Float(self.minutes)+Float(self.seconds)/60.0)-self.Timer)
    if(task2 == "LUCKY" && diff1 > diff2 ){
      self.cou+=1
    }
    self.date = Date()
    self.calendar = Calendar.current
    self.minutes = self.calendar.component(.minute, from: date)
    self.seconds = self.calendar.component(.second, from: date)
    self.Timer=Float(self.minutes)+Float(self.seconds)/60.0
    print("Enter \"GOODA\" ",terminator:"")   //task 3
    task3=readLine()!
    task3=task3.uppercased()
    self.date = Date()
    self.calendar = Calendar.current
    self.minutes = self.calendar.component(.minute, from: date)
    self.seconds = self.calendar.component(.second, from: date)
    diff3=abs((Float(self.minutes)+Float(self.seconds)/60.0)-self.Timer)
    if(task3 == "GOODA" && diff2 > diff3){
      self.cou+=1
    }
  }
}
//____main function____

var nameList=[String?]()
var temp=""
while(true){
print("\n\n::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::\n");
print("\t\t\t-----THIS IS FORTUNE TELLER MACHINE-----");
print();
print("\t_____ ENTER YOUR NAME _____ : ",terminator:"");
let name=readLine();//get name from user
print("\n\t-----ENTER YOUR AGE ----- : ",terminator:"");
let age=Int(readLine()!);//get age from user
temp=name!+String(age!)
if nameList.contains(temp){
  print("\n\t-----ALREADY DONE-----")
  break
}
nameList.append(temp)
print("\n\t_____ ENTER YOUR FAVORITE COLOR _____ : ",terminator:"");
let color=readLine();//get fav color from user
let obj1=FortuneTeller(name:name!,age:age!,color:color!);//creating object for FortuneTeller class as obj1
obj1.CalculateFortune()//calling class method using object
if(obj1.luckyNumber != 0){
  print("\n\t-----PRESS \"1\" TO BOOST YOUR LUCK----- ",terminator:"")
  let anmi=readLine()
if(anmi != ""){
  print("\n\n::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::\n");
  print("\t\t\t-----THIS IS FORTUNE BOOSTER-----");
  print("Here you can boost your luck");
  print("\n\tyour current luck is \(obj1.luckyNumber)\n")
  let obj2=BoostFortune()
  let tasks=readLine()
  if(tasks == ""){
    obj2.task()
    if(obj2.cou == 3){
      obj1.addLuck(num:obj1.luckyNumber)
    }
    else{
      print("\n\t Finsh task early as possible and correctly \n")
    }
  }
  else if(tasks == "0"){
    continue
  }
  }
}
  
  else{
print("\n\t-----PRESS ENTER TO RETRY----- ",terminator:"")
let anmi=readLine()
if(anmi != ""){
  break
}
  }
}
