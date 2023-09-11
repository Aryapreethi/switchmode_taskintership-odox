import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:switchdark/provider/changetheme.dart';
import 'package:switchdark/screen/nav.dart';

void main() async{
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp( {super.key,});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => ThemeProvider(),
      child: Builder(
        builder: (context) {
          final provider=Provider.of<ThemeProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            themeMode: provider.themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
                appBarTheme: const AppBarTheme(
                color: Colors.white
              ),

              colorScheme: const ColorScheme.light(
                background: Colors.white,primary: Colors.black,
               
              ),
              useMaterial3: true,
            ),
            darkTheme:  ThemeData(
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.black
              ),
              colorScheme: const ColorScheme.dark(
                background: Colors.black,
                primary: Colors.white,
              ),
              useMaterial3: true,
              brightness: Brightness.dark),
            home: const Homebar(),
          );
        }
      ),
    );
  }
}



