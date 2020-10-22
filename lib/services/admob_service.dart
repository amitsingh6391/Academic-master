import "dart:io";
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

class AdMobService {
  String getAdMobAppId() {
    if (Platform.isAndroid) {
      //realaddid
      //return  "ca-app-pub-4709741532241387~6971656435";
      return "ca-app-pub-5023637575934146~1394088201"; //2==1

    }
    return null;
  }

  String getInterstitialAdId() {
    if (Platform.isAndroid) {
      // return "ca-app-pub-3940256099942544/1033173712";

      return "ca-app-pub-5023637575934146/6570107854"; //5==4
    }
    return null;
  }

//return interstial adds

  InterstitialAd getnewTripInterstitial() {
    return InterstitialAd(
      adUnitId: "ca-app-pub-5023637575934146/6570107854", //5==4
      listener: (MobileAdEvent event) {
        print("InterstitialAd event is $event");
      },
    );
  }

  createReawrdAdAndLoad() {
    RewardedVideoAd.instance.load(
        adUnitId: "ca-app-pub-5023637575934146/1295216909",
        targetingInfo: MobileAdTargetingInfo());
    RewardedVideoAd.instance.listener =
        (RewardedVideoAdEvent event, {String rewardType, int rewardAmount}) {
      switch (event) {
        case RewardedVideoAdEvent.rewarded:

          ///
          break;
        default:
      }
      print("********createReawrdAdAndLoad $event*********");
    };
  }
}
