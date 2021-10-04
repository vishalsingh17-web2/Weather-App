import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:weather/models/autocomplete.dart';
import 'dart:convert' as convert;

import 'package:weather/models/constants.dart';

class BackendService {
  static Future<List<Map<String, dynamic>>> getSuggestions(String query) async {
    if (query.isEmpty && query.length < 3) {
      return Future.value([]);
    }
    var url = Uri.parse(Constant.autoComplete + '&q=' + query);

    var response = await http.get(url);
    List<Autocom> suggestions = [];
    if (response.statusCode == 200) {
      Iterable json = convert.jsonDecode(response.body);
      suggestions =
          List<Autocom>.from(json.map((model) => Autocom.fromJson(model)));

      print('Number of suggestion: ${suggestions.length}.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return Future.value(suggestions
        .map((e) => {
              "id": e.id,
              "name": e.name,
              "region": e.region,
              "country": e.country,
              "lat": e.lat,
              "lon": e.lon,
              "url": e.url,
            })
        .toList());
  }
}
