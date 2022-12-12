import 'package:flutter/material.dart';
import 'package:intertoons_project/Models/cartitem_model.dart';
import 'package:intertoons_project/Models/product_model.dart';
import 'package:intertoons_project/Models/productdetails_model.dart';
import 'package:intertoons_project/Views/favorite_Page.dart';
import 'package:intertoons_project/Widgets/SearchField.dart';
import 'package:intertoons_project/Widgets/offerBaners.dart';
import 'package:intertoons_project/Widgets/productdetailcart.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.cartitem,
    required this.productDetails,
    required this.product,
  }) : super(key: key);
  final CartItem? cartitem;
  final ProductDetails? productDetails;
  final ProductModel? product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 100,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(57, 0, 81, 1),
                  Color.fromRGBO(148, 0, 211, 10)
                ]),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Choose Location',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          IconButton(
                              onPressed: () {
                                print('choose location');
                              },
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.red,
                              ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (ctx) => FavoritePage(
                                          cartitem: cartitem,
                                        )));
                              },
                              icon: Icon(
                                Icons.favorite_outline,
                                color: Colors.white,
                              ))
                        ],
                      ),
                    )
                  ],
                ),
                SearchField()
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            OfferBaners(
              product: product,
              eColor: Color.fromRGBO(148, 0, 211, 10),
              bColor: Color.fromRGBO(57, 0, 81, 1),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 260,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.white, Color.fromRGBO(231, 177, 254, 1)]),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Featured product',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Text(
                                  'See More',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(Icons.keyboard_arrow_right,
                                    color: Colors.red)
                              ],
                            )
                          ],
                        ),
                      ),
                      if (product?.data?.mobileMainBanners != null)
                        ProductDetailCart(
                            cartitem: cartitem, productDetails: productDetails)
                    ],
                  ),
                ),
              ),
            ),
            OfferBaners(
              product: product,
              bColor: Color.fromRGBO(0, 128, 128, 10),
              eColor: Color.fromRGBO(0, 128, 128, 0),
            )
          ],
        ),
      ),
    );
  }
}
