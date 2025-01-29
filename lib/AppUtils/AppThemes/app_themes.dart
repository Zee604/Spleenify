import 'package:flutter/services.dart';
import 'package:spleenify_task/AppUtils/app_imports.dart';

class AppThemes{

  //light theme
  ThemeData get lightTheme{
    return ThemeData(
        fontFamily: 'Outfit',
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark
          )
        ),
        textTheme: TextTheme(
            titleMedium: TextStyle(
                fontFamily: 'Playfair',
                fontWeight: FontWeight.w600,
                fontSize: 18
            ),

            bodyMedium: TextStyle(
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w400,
                fontSize: 16
            )
        )
    );
  }


  //dark theme (for now its light mode color scheme but as per client requirements it would be...)
  ThemeData get darkTheme{
    return ThemeData(
        fontFamily: 'Outfit',
        useMaterial3: true,
        textTheme: TextTheme(
            titleMedium: TextStyle(
                fontFamily: 'Playfair',
                fontWeight: FontWeight.w400,
                fontSize: 18
            ),

            bodyMedium: TextStyle(
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w400,
                fontSize: 16
            )
        )
    );
  }

}