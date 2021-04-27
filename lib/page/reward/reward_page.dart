import 'package:flutter/material.dart';
import 'package:flutter_ads2/provider/reward_ad_provider.dart';


class RewardPage extends StatefulWidget {
  RewardPage({Key key}) : super(key: key);

  @override
  _RewardPageState createState() => _RewardPageState();
}

class _RewardPageState extends State<RewardPage> {
  

  @override
  Widget build(BuildContext context) {
    final rewardProvider = context.read<RewardAdProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Reward'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/dollar.png',
                height: 50,
              ),
              SizedBox(
                height: 10,
              ),
              CountCoin(),
              SizedBox(
                height: 50,
              ),
              TextButton(
                onPressed: () {
                  rewardProvider.myRewarded.show();
                },
                child: TextButtonClick(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TextButtonClick extends StatelessWidget {
  const TextButtonClick({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loading = context.watch<RewardAdProvider>().loading;
    return Text(loading?'Loading':'Get coin');
  }
}

class CountCoin extends StatelessWidget {
  const CountCoin({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final p = context.watch<RewardAdProvider>();
    return Text('Coin : ${p.coin}');
  }
}
