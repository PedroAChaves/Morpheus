import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:morpheus/models/create_event.dart';
import 'package:morpheus/providers/home/favorites_events.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await dotenv.load(fileName: ".env");
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<FavoritesAppEventsProvider>(
        create: (_) => FavoritesAppEventsProvider(),
      ),
    ], child: const App()),
  );
}

//https://www.figma.com/file/wEszKrRonhLV9tm4UDd4tn/TCC?node-id=0%3A1

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Morpheus',
      theme: ThemeData(),
      darkTheme: ThemeData(backgroundColor: const Color.fromARGB(0, 0, 0, 0)),
      themeMode: ThemeMode.dark,
      home: const CreateEvent(),
    );
  }
}
