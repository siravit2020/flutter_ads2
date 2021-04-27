import 'package:flutter/material.dart';

import 'package:flutter_ads2/page/home/home_page.dart';
import 'package:flutter_ads2/provider/banner_ad_provider.dart';
import 'package:flutter_ads2/provider/interstitial_ad_provider.dart';
import 'package:flutter_ads2/provider/native_ad_provider.dart';
import 'package:flutter_ads2/provider/reward_ad_provider.dart';

import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<InterstitialAdProvider>(
          create: (_) => InterstitialAdProvider(),
        ),
        ChangeNotifierProvider<RewardAdProvider>(
          create: (_) => RewardAdProvider(),
        ),
        ChangeNotifierProvider<NativeAdProvider>(
          create: (_) => NativeAdProvider(),
        ),
        Provider<BannerAdProvider>(
          create: (_) => BannerAdProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      title: 'Material App',
      home: HomePage(),
    );
  }
}
