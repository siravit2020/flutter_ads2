import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
export 'package:provider/provider.dart';
class RewardAdProvider extends ChangeNotifier {
  bool _loading = true;
  RewardedAd myRewarded;
  int _coin = 0;

  RewardAdProvider() {
    myRewarded = result();
  }

  set coin(int val) {
    _coin = val;
    notifyListeners();
  }

  get coin => _coin;

  set loading(val) {
    _loading = val;
    notifyListeners();
  }

  get loading => _loading;

  String get rewardAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/5224354917';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/1712485313';
    }
    throw new UnsupportedError("Unsupported platform");
  }

  RewardedAd result() {
    return RewardedAd(
      adUnitId: rewardAdUnitId,
      request: AdRequest(),
      listener: AdListener(
        onRewardedAdUserEarnedReward: (RewardedAd ad, RewardItem reward) {
          print(reward.type);
          print(reward.amount);
          coin += 10;
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
        onAdClosed: (ad) {
          ad.dispose();
          myRewarded = result();
        },
        onAdLoaded: (ad) {
          loading = false;
        },
      ),
    )..load().then((value) => loading = true);
  }
}