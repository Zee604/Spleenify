import 'package:spleenify_task/AppUtils/app_imports.dart';
import 'package:spleenify_task/UserInterfaceScreens/category_products_screen.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {

  @override
  void initState() {
    if(context.read<CommonProvider>().categoryList.isEmpty){
      context.read<CommonProvider>().fetchCategories();
    }
    super.initState();

  }

  final searchController = TextEditingController();

  String searchText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
            "Categories",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 26,
            )),
        automaticallyImplyLeading: false,
      ),
      body: context.watch<CommonProvider>().categoryList.isEmpty ?
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
              "${context.read<CommonProvider>().filterCategories(searchText).length} results found",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 12
              )),

          SizedBox(height: 12, width: 0,),

          Expanded(
            child: GridView.builder(
                itemCount: context.read<CommonProvider>().filterCategories(searchText).length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                mainAxisSpacing: 10,
                childAspectRatio: 1/1,
                crossAxisSpacing: 12),

                itemBuilder: (context, index){
                  CategoryModel model = context.read<CommonProvider>().filterCategories(searchText)[index];
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryProductsScreen(
                        category: model.slug!,
                        title: model.name!,
                      )));
                    },
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: CachedNetworkImage(
                            imageUrl: "https://cdn.thewirecutter.com/wp-content/media/2024/07/laptopstopicpage-2048px-3685-3x2-1.jpg",
                            height: context.screenHeight * 0.18,
                            width: context.screenWidth,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => SizedBox(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                          ),
                        ),


                        Positioned(
                          bottom: 40.0,
                          left: 12,
                          child: Text(
                              model.name!,
                              maxLines: 1,
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                color: Colors.white
                              )),
                        ),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
