import 'package:spleenify_task/AppUtils/app_imports.dart';

class CommonProvider extends ChangeNotifier{

  CommonProvider(){
    fetchProduct();
  }

  List<Products> plist = [];
  List<Products> favList = [];
  List<CategoryModel> clist = [];
  bool loading = true;

  List<Products> get productsList => plist;
  List<Products> get favoriteList => favList;
  List<CategoryModel> get categoryList => clist;
  bool get isLoading => loading;

  void setProductsList(List<Products> list){
    plist = list;
    notifyListeners();
  }

  void addFavoriteList(Products list){
    favList.add(list);
    notifyListeners();
  }

  void removeFavoriteList(Products list){
    favList.removeWhere((e) => e.id == list.id);
    notifyListeners();
  }

  void setCategoryList(List<CategoryModel> list){
    clist = list;
    notifyListeners();
  }

  setLoadingStatus(bool a){
    loading = a;
    notifyListeners();
  }


  Future<void> fetchProduct() async {
    ResponseModel? responseModel = await ApiServices().getProducts();
    if(responseModel != null){
      setProductsList(responseModel.products!);
      setLoadingStatus(false);
    }
  }

  Future<List<Products>> fetchProductByCat(String cat) async {
    ResponseModel? responseModel = await ApiServices().getProductsByCat(cat);
    if(responseModel != null){
      return responseModel.products!;
    }else{
      return [];
    }
  }

  Future<void> fetchCategories() async {
    List<CategoryModel>? responseModel = await ApiServices().getCategories();
    if(responseModel != null){
      setCategoryList(responseModel);
    }
  }

  List<Products> filterProducts(List<Products> list, String query) {
    List<Products> filteredProducts = [];
    if(query.isEmpty){
        filteredProducts = list;
      return filteredProducts;
    }else {
        filteredProducts =
            list
            .where((product) =>
            product.title!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      return filteredProducts;
    }
  }



  List<CategoryModel> filterCategories(String query) {
    List<CategoryModel> filteredProducts = [];
    if(query.isEmpty){
      filteredProducts = categoryList;
      return filteredProducts;
    }else {
      filteredProducts =
          categoryList
              .where((product) =>
              product.name!.toLowerCase().contains(query.toLowerCase()))
              .toList();
      return filteredProducts;
    }
  }


}