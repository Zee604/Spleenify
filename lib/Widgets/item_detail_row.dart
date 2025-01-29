import 'package:spleenify_task/AppUtils/app_imports.dart';

class ItemDetailRow extends StatelessWidget {
  final String title;
  final String value;
  final Widget? ratingbar;

  const ItemDetailRow({
    super.key,
  required this.title,
  required this.value,
    this.ratingbar
  });

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(
            "$title:",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w600
            )),

        SizedBox(height: 0, width: 10,),

        Text(
            value,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w400

            )),

        SizedBox(height: 0, width: 8,),

        ratingbar ?? SizedBox()
      ],
    );
  }
}
