import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:morpheus/models/event.dart';
import 'package:morpheus/modules/Events/event.dart';
import 'package:morpheus/providers/home/favorites_events.dart';
import 'package:morpheus/providers/search/nearby_events.dart';
import 'package:morpheus/providers/search/selected_event.dart';
import 'package:morpheus/shared/functions/get_geo_position.dart';
import 'package:morpheus/shared/themes/app_colors.dart';
import 'package:morpheus/shared/widgets/search/country_state.dart';
import 'package:morpheus/shared/widgets/search/map/google_map.dart';
import 'package:morpheus/shared/widgets/search/see_events_button.dart';
import 'package:morpheus/shared/widgets/search/state_city.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<CountryState> _states = [];
  final List<StateCity> _cities = [];
  bool _hasSelectedState = false;
  String? _selectedState;
  String? _selectedCity;
  final bool _hasSelectedEvent = false;
  late Position currentPosition;

  late NearbyEventsProvider nearbyEventsProvider;
  late FavoritesAppEventsProvider favorites;

  Future<void> _fetchStates() async {
    final response = await http.get(
      Uri.parse(
        "https://api.countrystatecity.in/v1/countries/BR/states",
      ),
      headers: {
        "X-CSCAPI-KEY": dotenv.get('COUNTRY_STATE_CITY_API_KEY'),
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
    );

    final List<dynamic> data = jsonDecode(response.body);
    setState(() => _states.clear());

    for (var element in data) {
      setState(() {
        _states.add(
          CountryState(element['name'], element['iso2']),
        );
      });
    }
  }

  Future<void> _fetchCities(String stateCode) async {
    final response = await http.get(
      Uri.parse(
        "https://api.countrystatecity.in/v1/countries/BR/states/$stateCode/cities",
      ),
      headers: {
        "X-CSCAPI-KEY": dotenv.get('COUNTRY_STATE_CITY_API_KEY'),
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
    );

    final List<dynamic> data = jsonDecode(response.body);
    setState(() => _cities.clear());

    for (var element in data) {
      setState(() {
        _cities.add(
          StateCity(element['name']),
        );
      });
    }
  }

  Future<List<AppEvent>> _fetchNearbyEvents(double latitude, longitude) async {
    final response = await http.get(Uri.parse("http://localhost:3000/events"));
    final value = List.from(jsonDecode(response.body));
    List<AppEvent> events =
        value.map<AppEvent>((e) => AppEvent.fromJson(e)).toList();
    return events;
  }

  @override
  void initState() {
    super.initState();
    _fetchStates();
  }

  @override
  Widget build(BuildContext context) {
    favorites = Provider.of<FavoritesAppEventsProvider>(context);
    nearbyEventsProvider = Provider.of<NearbyEventsProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Consumer<SelectedEventProvider>(
        builder: ((context, value, child) {
          return Column(
            children: [
              Container(
                color: AppColors.primary,
                height: value.hasValue
                    ? MediaQuery.of(context).size.height * 0.50
                    : MediaQuery.of(context).size.height * 0.56,
                width: double.infinity,
                child: const SearchMap(),
              ),
              Expanded(
                child: value.hasValue
                    ? Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 20,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return DetailScreen(
                                              event: value.event);
                                        },
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: value.event.id.toString(),
                                    child: Image.network(
                                      value.event.coverUrl,
                                      fit: BoxFit.fill,
                                      width: 300,
                                      height: 140,
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    IconButton(
                                      onPressed: () => value.clearValue(),
                                      icon: const Icon(Icons.close),
                                      color: AppColors.primary,
                                      iconSize: 34,
                                    ),
                                    IconButton(
                                      onPressed: () => value.setValue(
                                          nearbyEventsProvider.events[
                                              nearbyEventsProvider.events
                                                      .indexOf(value.event) +
                                                  1]),
                                      icon:
                                          const Icon(Icons.navigate_next_sharp),
                                      color: AppColors.primary,
                                      iconSize: 34,
                                    ),
                                    IconButton(
                                      onPressed: () => value.setValue(
                                        nearbyEventsProvider.events[
                                            nearbyEventsProvider.events
                                                    .indexOf(value.event) -
                                                1],
                                      ),
                                      icon: const Icon(Icons.navigate_before),
                                      color: AppColors.primary,
                                      iconSize: 34,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    value.event.name,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    value.event.startDateTime.toString(),
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    value.event.organizer.name,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    favorites.save(value.event);
                                    final snackBar = SnackBar(
                                      content: const Text(
                                          'Evento adicionado aos favoritos'),
                                      action: SnackBarAction(
                                          label: 'Desfazer',
                                          onPressed: () =>
                                              favorites.remove(value.event)),
                                    );

                                    // Find the ScaffoldMessenger in the widget tree
                                    // and use it to show a SnackBar.
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  },
                                  iconSize: 36,
                                  icon: Icon(
                                    favorites.events.contains(value.event)
                                        ? Icons.star
                                        : Icons.star_border,
                                    color: AppColors.accent,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Container(
                                    color: AppColors.accent,
                                    padding: const EdgeInsets.all(6),
                                    child: const Text(
                                      "Comprar ingressos",
                                      style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              'Explore eventos perto de você',
                              overflow: TextOverflow.fade,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                                color: Colors.black,
                              ),
                            ),
                            const Text(
                              'Encontre facilmente eventos ao seu redor a partir da sua localização atual ou selecionando um estado event cidade manualmente!',
                              overflow: TextOverflow.fade,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff746565),
                              ),
                            ),
                            SeeEventsButton(
                              icon: const Icon(
                                Icons.my_location_rounded,
                                color: Colors.white,
                              ),
                              text: const Text(
                                "Ver eventos perto de mim",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              onPress: () async {
                                Position position = await getCurrentPosition();
                                final events = await _fetchNearbyEvents(
                                  position.latitude,
                                  position.longitude,
                                );

                                nearbyEventsProvider.saveAll(events);
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: _hasSelectedState
                                      ? MediaQuery.of(context).size.width / 2.3
                                      : MediaQuery.of(context).size.width /
                                          1.12,
                                  child: DropdownButton<String>(
                                    hint: const Text(
                                      "Selecione um estado",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    icon: const Icon(Icons.arrow_downward),
                                    menuMaxHeight: 400,
                                    value: _selectedState,
                                    isExpanded: true,
                                    elevation: 16,
                                    style: const TextStyle(
                                      color: AppColors.primary,
                                      fontSize: 14,
                                    ),
                                    underline: Container(
                                      height: 2,
                                      color: AppColors.primary,
                                    ),
                                    onChanged: (String? newValue) async {
                                      setState(
                                        () {
                                          _selectedState = newValue!;
                                          _selectedCity = null;
                                        },
                                      );
                                      await _fetchCities(_selectedState!);
                                      setState(() => _hasSelectedState = true);
                                    },
                                    items: _states.map(
                                      (state) {
                                        return DropdownMenuItem(
                                          child: Text(
                                            state.name,
                                          ),
                                          value: state.code,
                                        );
                                      },
                                    ).toList(),
                                  ),
                                ),
                                Visibility(
                                  visible: _hasSelectedState,
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2.3,
                                    child: DropdownButton<String>(
                                      hint: const Text(
                                        "Selecione uma cidade",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      icon: const Icon(Icons.arrow_downward),
                                      menuMaxHeight: 400,
                                      value: _selectedCity,
                                      isExpanded: true,
                                      elevation: 16,
                                      style: const TextStyle(
                                        color: AppColors.primary,
                                        fontSize: 14,
                                      ),
                                      underline: Container(
                                        height: 2,
                                        color: AppColors.primary,
                                      ),
                                      onChanged: (String? newValue) {
                                        setState(
                                            () => _selectedCity = newValue!);
                                      },
                                      items: _cities.map(
                                        (city) {
                                          return DropdownMenuItem(
                                            child: Text(city.name),
                                            value: city.name,
                                          );
                                        },
                                      ).toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
              )
            ],
          );
        }),
      ),
    );
  }
}
