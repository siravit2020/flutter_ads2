import 'package:flutter/material.dart';
import 'package:flutter_ads2/provider/interstitial_ad_provider.dart';

class InterstitialPage extends StatefulWidget {
  InterstitialPage({Key key}) : super(key: key);

  @override
  _InterstitialPageState createState() => _InterstitialPageState();
}

class _InterstitialPageState extends State<InterstitialPage> {
  @override
  Widget build(BuildContext context) {
    final interstitialProvider = context.read<InterstitialAdProvider>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Interstitial'),
        ),
        body: Center(
          child: TextButton(
            onPressed: () {
              interstitialProvider.interstitial.show();
            },
            child: StatusButton(),
          ),
        ),
      ),
    );
  }
}

class StatusButton extends StatelessWidget {
  const StatusButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool loading = context.watch<InterstitialAdProvider>().loading;
    print(loading);
    return Text(loading ? 'Loading' : 'Show');
  }
}
