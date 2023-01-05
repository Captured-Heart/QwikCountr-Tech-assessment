import 'dart:convert';
import 'dart:developer';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

//THE ENDPOINTS AND APIKEY ARE TO BE HIDDEN/PRIVATE, I LEFT THEM OPEN FOR THE SAKE OF THE ASSESSMENT
const String apiEndpoint = 'http://api.marketstack.com/v1';
const String apiKey = 
// '75ba10322a956d2e149e72db15865714';
'a34582540f05920bd1655891f07d3233';

class HttpRequestHelper {
  static Future<dynamic> getSymbols() async {
    var url = Uri.parse('$apiEndpoint/tickers?access_key=$apiKey');
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      log(url.toString());

      // log('Get request successful $decodedData'); //
      return decodedData;
    } else {
      return 'failed';
    }
  }

  static Future<dynamic> getStocks(String symbol) async {
    var url = Uri.parse('$apiEndpoint/eod?access_key=$apiKey&symbols=$symbol');

    try {
      http.Response response = await http.get(url);
      log(url.toString());

      if (response.statusCode == 200) {
        String data = response.body;
        var decodedData = jsonDecode(data);
        log(url.toString());

        log('Get request successful $decodedData'); //
        return decodedData;
      } else {
        return 'failed';
      }
    } catch (e) {
      return 'failed';
    }
  }
}
