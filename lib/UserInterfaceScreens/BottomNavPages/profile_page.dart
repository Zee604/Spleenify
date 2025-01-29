import 'package:spleenify_task/AppUtils/app_imports.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
          "If  I can do all previous work with in 9 to 10 hours, Then this profile screen is too basic.",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontSize: 22
      )),
    );
  }
}
