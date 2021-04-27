import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_ads2/provider/banner_ad_provider.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

class BannerPage extends StatefulWidget {
  const BannerPage({Key key}) : super(key: key);

  @override
  _BannerPageState createState() => _BannerPageState();
}

class _BannerPageState extends State<BannerPage> {
  final items = List<String>.generate(30, (i) => "Item $i");
  List<Object> list;
  BannerAd banner;
  @override
  void initState() {
    list = List.from(items);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final adState = Provider.of<BannerAdProvider>(context);
    for (int i = list.length - 2; i >= 0; i -= 10) {
      list.insert(
        i,
        BannerAd(
          size: AdSize(
              width: MediaQuery.of(context).size.width.toInt(), height: 50),
          adUnitId: adState.bannerAdUnitId,
          listener: adState.adBannerListener,
          request: AdRequest(),
        )..load(),
      );
    }
    banner = BannerAd(
      size:
          AdSize(width: MediaQuery.of(context).size.width.toInt(), height: 50),
      adUnitId: adState.bannerAdUnitId,
      listener: adState.adBannerListener,
      request: AdRequest(),
    )..load();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Banner'),
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Normal',
              ),
              Tab(
                text: 'InLine',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('${items[index]}'),
                      );
                    },
                  ),
                ),
                banner == null
                    ? SizedBox(
                        height: 50,
                      )
                    : Container(
                        height: 50,
                        child: AdWidget(ad: banner),
                      )
              ],
            ),
            Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      print(list.length);
                      if (list[index] is String)
                        return ListTile(
                          title: Text('${list[index]}'),
                        );
                      else
                        return Container(
                          height: 50,
                          child: AdWidget(ad: list[index] as BannerAd),
                        );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
