import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank{
  stable var currentValue :Float=300;
  // currentValue:=300;
  //let id=3904875932845;
  // Debug.print(debug_show(currentValue,id));
  // type Time = Int;
  // let now : () -> Time;S
  stable var startTime=Time.now();
  // startTime:=Time.now();
  // Debug.print(debug_show(startTime));

  public func topup(amount:Float){
    currentValue+=amount;
    Debug.print(debug_show(currentValue));
  };
  //topup();
  public func withdraw(amount:Float){
    let tempval: Float=currentValue-amount;
    if(tempval>=0){
      currentValue-=amount;
      Debug.print(debug_show(currentValue));
    }else{
      //currentValue:=currentValue;
      Debug.print(" too large amount !Invalid amount");
    }
  };
  public query func checkBalance():async Float{
    return currentValue;
  };
  public func compound(){
    let currentTime=Time.now();
    let timeElapsedNS=currentTime-startTime;
    let timeElapsedS=timeElapsedNS/1000000000;
    currentValue:=currentValue * (1.01 ** Float.fromInt( timeElapsedS));
    startTime:=currentTime;
  };
}