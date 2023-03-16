import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/features/coin/data/coin_data.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  CoinData coinData = CoinData();
  List<Widget> priceList = [];
  late int? rateInt = 0;

  void getInitCoinData({
    required String token,
    required String currency,
  }) async {
    double data = await coinData.getCoinData(token: token, currency: currency);
    print(data.toInt());

    rateInt = data.toInt();

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getInitCoinData(
      token: 'BTC',
      currency: 'USD',
    );
  }

  DropdownButton<String> getAndroidPicker() {
    return DropdownButton(
      value: selectedCurrency,
      items: [
        for (String currency in currenciesList)
          DropdownMenuItem(
            value: currency,
            child: Text(currency),
          )
      ],
      onChanged: (value) {
        if (value == null) return;
        selectedCurrency = value;
        setState(() {});
      },
    );
  }

  CupertinoPicker getIOSPicker() {
    return CupertinoPicker(
      itemExtent: 32,
      onSelectedItemChanged: (selectedIndex) {
        print(currenciesList[selectedIndex]);
      },
      children: [
        for (String currency in currenciesList) Text(currency),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            color: Colors.lightBlueAccent,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 28,
              ),
              child: Text(
                '1 BTC = ${rateInt ?? "?"} USD',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            height: 150,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(
              bottom: 30,
            ),
            color: Colors.lightBlue,
            child: Platform.isIOS ? getIOSPicker() : getAndroidPicker(),
          ),
        ],
      ),
    );
  }
}
