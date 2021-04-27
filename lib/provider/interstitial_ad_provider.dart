
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
export 'package:provider/provider.dart';


class InterstitialAdProvider extends ChangeNotifier {
  bool _loading = true;
  InterstitialAd interstitial;

  InterstitialAdProvider() {
    interstitial = result();
  }

  String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/1033173712';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/4411468910';
    }
    throw new UnsupportedError("Unsupported platform");
  }

  InterstitialAd result() {
    return InterstitialAd(
      adUnitId: interstitialAdUnitId,
      request: AdRequest(),
      listener: AdListener(
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
        onAdClosed: (ad) {
          ad.dispose();
          interstitial = result();
        },
        onAdLoaded: (ad) {
          loading = false;
        },
      ),
    )..load().then((value) => loading = true);
  }

  set loading(val) {
    _loading = val;
    notifyListeners();
  }

  get loading => _loading;
}