import 'package:spleenify_task/AppUtils/app_imports.dart';
import 'package:spleenify_task/Widgets/item_detail_row.dart';

class ProductViewScreen extends StatefulWidget {
  final Products product;

  const ProductViewScreen({
    super.key,
  required this.product});

  @override
  State<ProductViewScreen> createState() => _ProductViewScreenState();
}

class _ProductViewScreenState extends State<ProductViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
            'Product Details',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 26,
            )),
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.arrow_back_ios,
              color: Colors.black,),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [

            CachedNetworkImage(
              imageUrl: widget.product.thumbnail!,
              height: context.screenHeight * 0.18,
              width: context.screenWidth,
              fit: BoxFit.fitHeight,
              placeholder: (context, url) => SizedBox(
                  child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),

            SizedBox(height: 8, width: 0,),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 14
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "Product Details:",
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w600
                          )),

                      SizedBox(height: 0, width: 10,),

                      GestureDetector(
                        onTap: (){
                          if(context.read<CommonProvider>().favoriteList.contains(widget.product)){
                            context.read<CommonProvider>().removeFavoriteList(widget.product);
                          }else{
                            context.read<CommonProvider>().addFavoriteList(widget.product);
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Icon(
                            context.watch<CommonProvider>().favoriteList.contains(widget.product) ? Icons.favorite : Icons.favorite_border,
                            color: context.watch<CommonProvider>().favoriteList.contains(widget.product) ? Colors.red :Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 12, width: 0,),

                  ItemDetailRow(title: "Name", value: widget.product.title!),

                  SizedBox(height: 8, width: 0,),

                  ItemDetailRow(title: "Price", value: "\$${widget.product.price!}"),

                  SizedBox(height: 8, width: 0,),

                  ItemDetailRow(title: "Category", value: widget.product.category!),

                  SizedBox(height: 8, width: 0,),

                  ItemDetailRow(title: "Brand", value: widget.product.brand!),

                  SizedBox(height: 8, width: 0,),

                  ItemDetailRow(title: "Rating", value: widget.product.rating!.toString(), ratingbar:  SizedBox(
                    height: 24,
                    width: context.screenWidth * 0.4,
                    child: ListView.builder(
                      itemCount: widget.product.rating!.floor(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, star){
                        return Icon(Icons.star,
                          color: Color(0xFFFFC553),);
                      },
                    ),
                  ),),

                  SizedBox(height: 8, width: 0,),

                  ItemDetailRow(title: "Stock", value: widget.product.stock!.toString()),

                  SizedBox(height: 8, width: 0,),

                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                        "Description:",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w600
                        )),
                  ),

                  SizedBox(height: 0, width: 10,),

                  Text(
                      widget.product.description!,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400

                      )),

                  SizedBox(height: 12, width: 0,),

                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                        "Product Gallery:",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w600
                        )),
                  ),

                  SizedBox(height: 12, width: 0,),

                  SizedBox(
                    width: context.screenWidth,
                    height: context.screenHeight * 0.5,
                    child: GridView.builder(
                        itemCount: widget.product.images!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            childAspectRatio: 2/1.3,
                            crossAxisSpacing: 12),

                        itemBuilder: (context, index){
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: CachedNetworkImage(
                              imageUrl: widget.product.images![index],
                              height: context.screenHeight * 0.18,
                              width: context.screenWidth,
                              fit: BoxFit.fitHeight,
                              placeholder: (context, url) => SizedBox(
                                  child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),
                          );
                        }),
                  )

                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
