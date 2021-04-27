
import 'package:flutter_ads2/provider/native_ad_provider.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:flutter/material.dart';

class NativeInlinePage extends StatefulWidget {
  @override
  State createState() => _NativeInlinePageState();
}

class _NativeInlinePageState extends State<NativeInlinePage> {
  static final _kAdIndex = 4;
  final items = List<String>.generate(30, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    final nativeAdProvider = Provider.of<NativeAdProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Native'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          if (!nativeAdProvider.loading && index == _kAdIndex) {
            return Container(
              child: AdWidget(ad: nativeAdProvider.nativeAd),
              height: 72.0,
              alignment: Alignment.center,
            );
          } else {
            return ListTile(
              title: Text(items[index]),
              onTap: () {},
            );
          }
        },
      ),
    );
  }
}
