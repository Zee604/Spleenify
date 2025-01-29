import 'package:spleenify_task/AppUtils/app_imports.dart';
import 'package:spleenify_task/AppUtils/svg_images.dart';
import 'package:spleenify_task/Widgets/bottom_navbar.dart';
import 'package:spleenify_task/Widgets/navbar_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int selectedIndex = 0;

  final fragments = [
    ProductsPage(),
    CategoriesPage(),
    FavoritePage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavbar(child: Row(
        spacing: 12,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NavbarItem(
              title: "Products",
              icon: SvgImages.homeIcon,
              onTap: (){
                setState(() {
                  selectedIndex = 0;
                });
              }),

          NavbarItem(
              title: "Categories",
              icon: SvgImages.categoryIcon,
              onTap: (){
                setState(() {
                  selectedIndex = 1;
                });
              }),

          NavbarItem(
              title: "Favorites",
              icon: SvgImages.favoriteIcon,
              onTap: (){
                setState(() {
                  selectedIndex = 2;
                });
              }),

          NavbarItem(
              title: "Profile",
              icon: SvgImages.profileIcon,
              onTap: (){
                setState(() {
                  selectedIndex = 3;
                });
              })
        ],
      )),
      body: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, bottom: 8),
        child: fragments[selectedIndex],
      ),
    );
  }
}
