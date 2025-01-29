import 'package:spleenify_task/AppUtils/app_imports.dart';


class BottomNavbar extends StatelessWidget {
  final Widget child;

  const BottomNavbar({
    super.key,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      height: Platform.isAndroid ? 70 : 100,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.vertical(top: Radius.circular(6))
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: child,
      ),
    );
  }
}
