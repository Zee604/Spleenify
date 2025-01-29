
import 'package:spleenify_task/AppUtils/app_imports.dart';



class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {

  final searchController = TextEditingController();

  String searchText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
            "Products",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 26,
            )),
        automaticallyImplyLeading: false,
      ),
      body: context.watch<CommonProvider>().isLoading ?
          // here we can set shimmer effect while fetching products
          // due to short time I used progress indicator
          Center(
            child: CircularProgressIndicator(),
          )
          :Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchbarField(
              controller: searchController,
          onChange: (value){
                setState(() {
                  searchText = value;
                });
          },),

          SizedBox(height: 12, width: 0,),

          Text(
              "${context.read<CommonProvider>().filterProducts(context.read<CommonProvider>().productsList, searchText).length} results found",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 12
          )),

          SizedBox(height: 12, width: 0,),

          Expanded(
            child: ListView.builder(
              itemCount: context.read<CommonProvider>().filterProducts(context.read<CommonProvider>().productsList, searchText).length,
                itemBuilder: (context, index){
                Products model = context.read<CommonProvider>().filterProducts(context.read<CommonProvider>().productsList, searchText)[index];
                  return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductViewScreen(product: model)));
                      },
                      child: ProductItemDesign(model: model));
                }),
          )
        ],
      ),
    );
  }

}
