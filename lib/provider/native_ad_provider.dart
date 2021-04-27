import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
export 'package:provider/provider.dart';
class NativeAdProvider extends ChangeNotifier {
  bool _loading = true;
  NativeAd nativeAd;

  NativeAdProvider() {
    nativeAd = result();
  }

  set loading(val) {
    _loading = val;
    notifyListeners();
  }

  get loading => _loading;

  String get nativeAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/2247696110';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/3986624511';
    }
    throw new UnsupportedError("Unsupported platform");
  }

  NativeAd result() {
    return NativeAd(
      adUnitId: nativeAdUnitId,
      factoryId: 'listTile',
      request: AdRequest(),
      listener: AdListener(
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
       
        onAdLoaded: (ad) {
          loading = false;
        },
      ),
    )..load().then((value) => loading = true);
  }
}
