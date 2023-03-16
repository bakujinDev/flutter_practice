import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/features/coin/data/coin_data.dart';
import 'package:flutter_practice/features/coin/widget/price_card.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  CoinData coinData = CoinData();

  String selectedCurrency = currenciesList[0];
  Map<String, String> coinValues = {};
  bool isWaiting = false;

  void getData() async {
    isWaiting = true;

    try {
      coinValues = await coinData.getCoinData(currency: selectedCurrency);

      isWaiting = false;

      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
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
        selectedCurrency = currenciesList[selectedIndex];
        setState(() {});
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (String crypto in cryptoList)
                PriceCard(
                  crypto: crypto,
                  rateInt: isWaiting ? '?' : coinValues[crypto] ?? '0',
                  currency: selectedCurrency,
                )
            ],
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
