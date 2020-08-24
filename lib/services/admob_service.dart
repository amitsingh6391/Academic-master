
import "dart:io";
import 'package:firebase_admob/firebase_admob.dart';

class AdMobService{

String getAdMobAppId(){
  if(Platform.isAndroid){
    //realaddid
    //return  "ca-app-pub-4709741532241387~6971656435";
    return  "ca-app-pub-5023637575934146~1394088201"; //2==1

  }
  return null;
}

String getBannerAdId(){
  if(Platform.isAndroid){
   
    //for test "ca-app-pub-3940256099942544/6300978111";
   // return "ca-app-pub-4709741532241387/8710638730";
   return "ca-app-pub-5023637575934146/9990478111";//2==1
  }

  return null;

}

String getInterstitialAdId(){
  if(Platform.isAndroid){
   
    
    //for test id " ca-app-pub-3940256099942544/1033173712"

    return "ca-app-pub-5023637575934146/6570107854";//5==4
  }
  return null;

}

//return interstial adds

InterstitialAd getnewTripInterstitial(){
  return InterstitialAd(
    adUnitId: "ca-app-pub-5023637575934146/6570107854",//5==4
    listener:(MobileAdEvent event) {
    print("InterstitialAd event is $event");
  }, 
     );
}

   

}