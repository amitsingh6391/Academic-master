
import "dart:io";
import 'package:firebase_admob/firebase_admob.dart';

class AdMobService{

String getAdMobAppId(){
  if(Platform.isAndroid){
    return "ca-app-pub-9875174510591808~9846801050";
  }
  return null;
}

String getBannerAdId(){
  if(Platform.isAndroid){
    return "ca-app-pub-9875174510591808/4522870922";
    //for test "ca-app-pub-3940256099942544/6300978111";
    //return "ca-app-pub-3940256099942544/6300978111";
  }
  return null;

}

String getInterstitialAdId(){
  if(Platform.isAndroid){
    // return "ca-app-pub-5023637575934146/9314601983";
    
    //for test id " ca-app-pub-3940256099942544/1033173712"

    return "ca-app-pub-9875174510591808/9583625917";
  }
  return null;

}

//return interstial adds

InterstitialAd getnewTripInterstitial(){
  return InterstitialAd(
    adUnitId: "ca-app-pub-9875174510591808/9583625917",
    listener:(MobileAdEvent event) {
    print("InterstitialAd event is $event");
  }, 
     );
}

   

}