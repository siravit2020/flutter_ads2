import 'package:flutter/material.dart';
import 'package:flutter_ads2/page/banner/banner_page.dart';
import 'package:flutter_ads2/page/interstitial/interstitial_page.dart';
import 'package:flutter_ads2/page/native/native_inline_page.dart';
import 'package:flutter_ads2/page/reward/reward_page.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff141414),
        body: FutureBuilder<InitializationStatus>(
          future: _initGoogleMobileAds(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/google-admob-logo.png',
                    height: 80,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Google Admob Tutorial',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  AdsTypesItem(
                    type: 1,
                    title: 'แบนเนอร์',
                  ),
                  AdsTypesItem(
                    type: 2,
                    title: 'โฆษณาคั่นระหว่างหน้า',
                  ),
                  AdsTypesItem(
                    type: 3,
                    title: 'ให้รางวัล',
                  ),
                  AdsTypesItem(
                    type: 4,
                    title: 'เนทีฟ',
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 24,
                    ),
                    SizedBox(width: 8.0),
                    Text('Failed to initialize AdMob SDK'),
                  ],
                ),
              );
            }
            return Center(
              child: SizedBox(
                child: CircularProgressIndicator(),
                width: 48.0,
                height: 48.0,
              ),
            );
          },
        ),
      ),
    );
  }

  Future<InitializationStatus> _initGoogleMobileAds() {
    return MobileAds.instance.initialize();
  }
}

class AdsTypesItem extends StatelessWidget {
  const AdsTypesItem({
    Key key,
    this.type,
    this.title,
  }) : super(key: key);
  final int type;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        switch (type) {
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BannerPage()),
            );

            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => InterstitialPage()),
            );
            break;
          case 3:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RewardPage()),
            );
            break;
          case 4:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NativeInlinePage()),
            );
            break;
          default:
        }
      },
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: Color(0xff1f1f1f),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Image.asset(
              'assets/icons/ads$type-icon.png',
              height: 40,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
