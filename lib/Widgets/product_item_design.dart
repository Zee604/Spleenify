import 'package:spleenify_task/AppUtils/app_imports.dart';

class ProductItemDesign extends StatelessWidget {
  final Products model;

  const ProductItemDesign({
    super.key,
  required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(12.0)),
        border: const Border(
          left: BorderSide(color: Colors.grey, width: 1),
          right: BorderSide(color: Colors.grey, width: 1),
          bottom: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.only(
          left: 20.0, right: 20.0, bottom: 20.0
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: model.thumbnail!,
            height: context.screenHeight * 0.18,
            width: context.screenWidth,
            fit: BoxFit.fitHeight,
            placeholder: (context, url) => SizedBox(
                child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),

          SizedBox(height: 12, width: 0,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                    model.title!,
                    maxLines: 2,

                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                    )),
              ),

              SizedBox(height: 0, width: 10,),

              Text(
                  "\$${model.price!}",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600

                  )),
            ],
          ),

          SizedBox(height: 2, width: 0,),

          Row(
            spacing: 8,
            children: [
              Text(
                  model.rating!.toString(),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w600
                  )),

              SizedBox(
                height: 30,
                width: context.screenWidth * 0.7,
                child: ListView.builder(
                  itemCount: model.rating!.floor(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, star){
                    return Icon(Icons.star,
                      color: Color(0xFFFFC553),);
                  },
                ),
              )
            ],
          ),

          SizedBox(height: 8, width: 0,),

          Text(
              "By ${model.brand!}",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 14,
                  color: Colors.grey
              )),

          SizedBox(height: 8, width: 0,),

          Text(
              "In ${model.category!}",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 14,
                  color: Colors.black
              )),
        ],
      ),
    );
  }
}
