import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  final Uri url;

  NetworkHelper({
    required this.url,
  });

  Future getData() async {
    var response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      print(data);

      var decodeData = jsonDecode(data);

      return decodeData;
    } else {
      print(response.statusCode);
    }
  }
}
