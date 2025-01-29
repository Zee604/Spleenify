import 'package:spleenify_task/AppUtils/app_imports.dart';

class FavoriteItemDesign extends StatelessWidget {
  final Products model;

  const FavoriteItemDesign({
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
          left: 10.0, right: 10.0, bottom: 14.0
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          CachedNetworkImage(
            imageUrl: model.thumbnail!,
            height: 90,
            width: 90,
            fit: BoxFit.fill,
            placeholder: (context, url) => SizedBox(
                child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),

          SizedBox(height: 0, width: 12,),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 4, width: 0,),

                Text(
                    model.title!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600
                    )),

                SizedBox(height: 4, width: 0,),

                Text(
                    "\$${model.price!}",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600

                    )),

                SizedBox(height: 6, width: 0,),

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
                      width: context.screenWidth * 0.3,
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
              ],
            ),
          ),

          SizedBox(height: 0, width: 12,),

      GestureDetector(
        onTap: (){
            context.read<CommonProvider>().removeFavoriteList(model);
        },
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Icon(
             Icons.favorite,
            color: Colors.red,
          ),
        ),
      ),
        ],
      ),
    );
  }
}
