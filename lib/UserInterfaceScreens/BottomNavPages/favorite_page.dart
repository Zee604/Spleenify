import 'package:spleenify_task/AppUtils/app_imports.dart';
import 'package:spleenify_task/Widgets/favorite_item_design.dart';


class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final searchController = TextEditingController();

  String searchText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
            "Favorites",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 26,
            )),
        automaticallyImplyLeading: false,
      ),
      body: context.watch<CommonProvider>().favoriteList.isEmpty ?
      Center(
        child: Text(
            "No Item Found!",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 22,
              fontWeight: FontWeight.w600
        )),
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
              "${context.read<CommonProvider>().filterProducts(context.read<CommonProvider>().favoriteList, searchText).length} results found",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 12
              )),

          SizedBox(height: 12, width: 0,),

          Expanded(
            child: ListView.builder(
                itemCount: context.read<CommonProvider>().filterProducts(context.read<CommonProvider>().favoriteList, searchText).length,
                itemBuilder: (context, index){
                  Products model = context.read<CommonProvider>().filterProducts(context.read<CommonProvider>().favoriteList, searchText)[index];
                  return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductViewScreen(product: model)));
                      },
                      child: FavoriteItemDesign(model: model));
                }),
          )
        ],
      ),
    );
  }
}
