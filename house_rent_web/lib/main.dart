import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_rent_web/constants.dart';
import 'package:house_rent_web/screens/main/main_screen.dart';
import 'package:provider/provider.dart';

import 'controllers/MenuController.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: mainColor,
          ),
          primaryColor: Colors.white,
          canvasColor: Colors.white,
          textTheme: GoogleFonts.notoSansTextTheme(Theme
              .of(context)
              .textTheme)
              .apply()
              .copyWith(
              headline6: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),
            headline5: Theme.of(context).textTheme.headline5!.copyWith(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 13
            ),
            subtitle1: Theme.of(context).textTheme.subtitle1!.copyWith(
              color: mainColor,
              fontWeight: FontWeight.bold,
              fontSize: 15
            )
          )
      ),
      home: MultiProvider(
          providers: [
            ChangeNotifierProvider(
                create: (context) => MenuController()
            )
          ],
          child: MainScreen()
      ),
    );
  }
}