import 'dart:convert';

import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  String apiKey = '197DC8E1-9D0C-4B7C-9495-E6A3285AE879';

  dynamic getCoinData({
    required String token,
    required String currency,
  }) async {
    var url = Uri.https(
      'rest.coinapi.io',
      '/v1/exchangerate/BTC/USD',
      {'apikey': apiKey},
    );

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      double rate = decodedData['rate'];

      return rate;
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}
