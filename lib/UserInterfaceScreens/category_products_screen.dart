import 'package:spleenify_task/AppUtils/app_imports.dart';

class CategoryProductsScreen extends StatefulWidget {
  final String category;
  final String title;

  const CategoryProductsScreen({
    super.key,
    required this.category,
    required this.title,
  });

  @override
  State<CategoryProductsScreen> createState() => _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
  final searchController = TextEditingController();

  String searchText = "";

  List<Products> products = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      getProducts();
    });
  }

  void getProducts() async{
    context.read<CommonProvider>().setLoadingStatus(true);
    List<Products> list = await context.read<CommonProvider>().fetchProductByCat(widget.category);
    setState(() {
      products = list;
    });
    context.read<CommonProvider>().setLoadingStatus(false);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
            widget.title,
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
      body: context.watch<CommonProvider>().isLoading ?
      // here we can set shimmer effect while fetching products
      // due to short time I used progress indicator
      Center(
        child: CircularProgressIndicator(),
      )
          :Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 12
            ),
            child: Column(
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
                "${context.read<CommonProvider>().filterProducts(products, searchText).length} results found",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 12
                )),

            SizedBox(height: 12, width: 0,),

            Expanded(
              child: ListView.builder(
                  itemCount: context.read<CommonProvider>().filterProducts(products, searchText).length,
                  itemBuilder: (context, index){
                    Products model = context.read<CommonProvider>().filterProducts(products, searchText)[index];
                    return GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ProductViewScreen(product: model)));
                        },
                        child: ProductItemDesign(model: model));
                  }),
            )
                    ],
                  ),
          ),
    );
  }
}
