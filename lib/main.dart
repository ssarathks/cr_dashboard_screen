import 'package:ass_cr_dashboard/constants/theme_constants.dart';
import 'package:ass_cr_dashboard/providers/coins/coins_provider.dart';
import 'package:ass_cr_dashboard/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CoinsProvider())],
      child: MaterialApp(
        title: 'Cr Dashboard',
        theme: ThemeConstants.lightTheme,
        darkTheme: ThemeConstants.darkTheme,
        themeMode: ThemeMode.dark,
        home: const Home(),
      ),
    );
  }
}
