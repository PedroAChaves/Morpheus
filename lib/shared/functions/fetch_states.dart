import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:morpheus/shared/widgets/search/country_state.dart';

Future<List<CountryState>> fetchStates(String country) async {
  final List<CountryState> states = [];

  try {
    final response = await http.get(
      Uri.parse(
        "https://api.countrystatecity.in/v1/countries/$country/states",
      ),
      headers: {
        "X-CSCAPI-KEY": dotenv.get('COUNTRY_STATE_CITY_API_KEY'),
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
    );

    final List<dynamic> data = jsonDecode(response.body);
    for (var element in data) {
      states.add(CountryState(element['name'], element['iso2']));
    }

    return states;
  } catch (e) {
    return Future.error(e);
  }
}
