
import "dart:io";
import 'package:firebase_admob/firebase_admob.dart';

class AdMobService{

String getAdMobAppId(){
  if(Platform.isAndroid){
    //realaddid
    return  "ca-app-pub-6517770398502887~3454401061";
  }
  return null;
}

String getBannerAdId(){
  if(Platform.isAndroid){
   
    //for test "ca-app-pub-3940256099942544/6300978111";
    return "ca-app-pub-6517770398502887/4021662684";
  }
  return null;

}

String getInterstitialAdId(){
  if(Platform.isAndroid){
   
    
    //for test id " ca-app-pub-3940256099942544/1033173712"

    return "ca-app-pub-6517770398502887/8222623967";
  }
  return null;

}

//return interstial adds

InterstitialAd getnewTripInterstitial(){
  return InterstitialAd(
    adUnitId: "ca-app-pub-6517770398502887/8222623967",
    listener:(MobileAdEvent event) {
    print("InterstitialAd event is $event");
  }, 
     );
}

   

}