import 'package:flutter_svg/flutter_svg.dart';
import 'package:spleenify_task/AppUtils/app_imports.dart';

class NavbarItem extends StatelessWidget {
  final String title;
  final String icon;
  final void Function() onTap;

  const NavbarItem({
    super.key,
  required this.title,
  required this.icon,
  required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [

            SvgPicture.string(icon,
            height: 20,),

            SizedBox(height: 8, width: 0,),

            Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 16,
                    color: Colors.white
                )),

          ],
        ),
      ),
    );
  }
}
