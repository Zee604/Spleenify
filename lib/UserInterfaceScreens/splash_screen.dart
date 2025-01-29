
import 'package:spleenify_task/AppUtils/app_imports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("${AppConstants.assetsPath}splash_bg.png"),
        fit: BoxFit.cover)
      ),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.46)
                ],
                begin: Alignment.topCenter
            )
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.screenWidth * 0.09,
            vertical: context.screenHeight * 0.14
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Text(
                    "My Store",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 50,
                )),
              ),



              Text(
                  "Valkommen",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                  )),

              SizedBox(height: 10, width: 0,),

              Text(
                  '''Hos ass kan du baka tid has nastan alla Sveriges salonger och motagningar. Baka frisor, massage, skonhetsbehandingar, friskvard och mycket mer.''',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 14,
                    color: Colors.white
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
