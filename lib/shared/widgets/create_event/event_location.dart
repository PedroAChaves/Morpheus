import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:morpheus/shared/themes/app_colors.dart';

import '../../themes/app_colors.dart';
import '../purchase_page/editable_text_field.dart';

class CreateEventLocation extends StatefulWidget {
  const CreateEventLocation({Key? key}) : super(key: key);

  @override
  State<CreateEventLocation> createState() => _CreateEventLocationState();
}

class _CreateEventLocationState extends State<CreateEventLocation> {
  // final List<CountryState> _states = [];
  // final List<StateCity> _cities = [];
  // final bool _hasSelectedState = false;
  // String? _selectedState;
  // String? _selectedCity;
  // final bool _hasSelectedEvent = false;
  // late Position currentPosition;

  // late NearbyEventsProvider nearbyEventsProvider;
  // late FavoritesAppEventsProvider favorites;

  // Future<void> _fetchStates() async {
  //   final response = await http.get(
  //     Uri.parse(
  //       "https://api.countrystatecity.in/v1/countries/BR/states",
  //     ),
  //     headers: {
  //       "X-CSCAPI-KEY": dotenv.get('COUNTRY_STATE_CITY_API_KEY'),
  //       'Content-type': 'application/json',
  //       'Accept': 'application/json',
  //     },
  //   );

  //   final List<dynamic> data = jsonDecode(response.body);
  //   setState(() => _states.clear());

  //   for (var element in data) {
  //     setState(() {
  //       _states.add(
  //         CountryState(element['name'], element['iso2']),
  //       );
  //     });
  //   }
  // }

  // Future<void> _fetchCities(String stateCode) async {
  //   final response = await http.get(
  //     Uri.parse(
  //       "https://api.countrystatecity.in/v1/countries/BR/states/$stateCode/cities",
  //     ),
  //     headers: {
  //       "X-CSCAPI-KEY": dotenv.get('COUNTRY_STATE_CITY_API_KEY'),
  //       'Content-type': 'application/json',
  //       'Accept': 'application/json',
  //     },
  //   );

  //   final List<dynamic> data = jsonDecode(response.body);
  //   setState(() => _cities.clear());

  //   for (var element in data) {
  //     setState(() {
  //       _cities.add(
  //         StateCity(element['name']),
  //       );
  //     });
  //   }
  // }

  // Future<List<AppEvent>> _fetchNearbyEvents(double latitude, longitude) async {
  //   final response = await http.get(Uri.parse("http://localhost:3000/events"));
  //   final value = List.from(jsonDecode(response.body));
  //   List<AppEvent> events =
  //       value.map<AppEvent>((e) => AppEvent.fromJson(e)).toList();
  //   return events;
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   _fetchStates();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          '1. Onde seu evento vai acontecer?',
          style: TextStyle(
            fontSize: 18,
            color: Color.fromARGB(255, 145, 87, 0),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 15.0, bottom: 8),
          child: Text(
            'Nome do local:',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.start,
          ),
        ),
        const EditableTextField(
          labelText: '',
        ),
        const Padding(
          padding: EdgeInsets.only(top: 15.0, bottom: 8),
          child: Text(
            'CEP:',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.start,
          ),
        ),
        TextField(
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            CepInputFormatter(),
          ],
          cursorColor: AppColors.primary,
          decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary, width: 2),
            ),
            border: OutlineInputBorder(),
            floatingLabelStyle: TextStyle(color: AppColors.primary),
            fillColor: Colors.transparent,
            filled: true,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 15.0, bottom: 8),
          child: Text(
            'Rua/Av:',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.start,
          ),
        ),
        const EditableTextField(
          labelText: '',
        ),
        const Padding(
          padding: EdgeInsets.only(top: 15.0, bottom: 8),
          child: Text(
            'Número:',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.start,
          ),
        ),
        TextField(
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          cursorColor: AppColors.primary,
          decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary, width: 2),
            ),
            border: OutlineInputBorder(),
            floatingLabelStyle: TextStyle(color: AppColors.primary),
            fillColor: Colors.transparent,
            filled: true,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 15.0, bottom: 8),
          child: Text(
            'Complemento:',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.start,
          ),
        ),
        const EditableTextField(
          labelText: '',
        ),
        const Padding(
          padding: EdgeInsets.only(top: 15.0, bottom: 8),
          child: Text(
            'Bairro:',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.start,
          ),
        ),
        const EditableTextField(
          labelText: '',
        ),
        const Padding(
          padding: EdgeInsets.only(top: 15.0, bottom: 8),
          child: Text(
            'Cidade:',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.start,
          ),
        ),
        const EditableTextField(
          labelText: '',
        ),
        const Padding(
          padding: EdgeInsets.only(top: 15.0, bottom: 8),
          child: Text(
            'Estado:',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.start,
          ),
        ),
        const EditableTextField(
          labelText: '',
        ),
        // Consumer<SelectedEventProvider>(
        //   builder: ((context, value, child) {
        //     return Column(
        //       children: [
        //         Container(
        //           color: AppColors.primary,
        //           height: 200,
        //           child: const SearchMap(),
        //         ),
        //       ],
        //     );
        //   }),
        // ),
      ],
    );
  }
}
