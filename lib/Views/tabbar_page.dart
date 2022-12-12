import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intertoons_project/Controllers/product_cotroller.dart';
import 'package:intertoons_project/Models/cartitem_model.dart';
import 'package:intertoons_project/Models/product_model.dart';
import 'package:intertoons_project/Models/productdetails_model.dart';
import 'package:intertoons_project/Views/Profile_page.dart';
import 'package:intertoons_project/Views/cart_page.dart';
import 'package:intertoons_project/Views/category_page.dart';
import 'package:intertoons_project/Views/home_page.dart';
import 'package:intertoons_project/Views/search_page.dart';
import 'package:intertoons_project/Services/remote_servicess.dart';
import 'package:intertoons_project/Controllers/favorite_controller.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final ScrollController _homeController = ScrollController();

  ProductModel? product;
  CartItem? cartitem;
  ProductDetails? productDetails;
  bool isloaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    product = await RemoteServices().getApi();
    cartitem = await RemoteServices().getCartItem();
    productDetails = await RemoteServices().getProductDetails();

    if (product != null) {
      setState(() {
        isloaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteController>(
      builder: (con) {
        final screens = [
          HomePage(
              cartitem: cartitem,
              productDetails: productDetails,
              product: product),
          CategoryPage(),
          CartPage(cartItem: cartitem, productDetails: productDetails),
          SearchPage(),
          AccountPage()
        ];
        return GetBuilder<ProductController>(builder: (proCltr) {
          return Visibility(
            visible: isloaded,
            child: DefaultTabController(
              length: 5,
              child: Scaffold(
                bottomNavigationBar: BottomNavigationBar(
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.home_outlined,
                        ),
                        label: 'Home'),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.category_outlined,
                        ),
                        label: 'category'),
                    BottomNavigationBarItem(
                      icon: Stack(
                        children: [
                          Icon(
                            Icons.shopping_cart,
                          ),
                          proCltr.itemCount == 0
                              ? SizedBox()
                              : Positioned(
                                  left: 13,
                                  bottom: 15,
                                  child: Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Center(
                                      child: Text(
                                        proCltr.itemCount.toString(),
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 8),
                                      ),
                                    ),
                                  )),
                        ],
                      ),
                      label: 'Cart',
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.search_outlined,
                        ),
                        label: 'Search'),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.person_outlined,
                        ),
                        label: 'Profile')
                  ],
                  currentIndex: _selectedIndex,
                  onTap: (index) => setState(() => _selectedIndex = index),
                  selectedItemColor: Color.fromARGB(255, 93, 28, 121),
                  unselectedItemColor: Colors.grey,
                  unselectedLabelStyle: TextStyle(color: Colors.grey),
                  iconSize: 30,
                  selectedFontSize: 15,
                  unselectedFontSize: 13,
                  showSelectedLabels: false,
                  showUnselectedLabels: true,
                ),
                body: screens[_selectedIndex],
              ),
            ),
            replacement: Center(
              child: CircularProgressIndicator(
                color: Color.fromRGBO(148, 0, 211, 10),
              ),
            ),
          );
        });
      },
    );
  }
}
