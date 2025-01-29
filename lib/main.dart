import 'package:spleenify_task/AppUtils/app_imports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CommonProvider()),
      ],
      child: MaterialApp(
        title: 'Spleenify',
        theme: AppThemes().lightTheme,
        darkTheme: AppThemes().darkTheme,
        home: const SplashScreen(),
      ),
    );
  }
}


