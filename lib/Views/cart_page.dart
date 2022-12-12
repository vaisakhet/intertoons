import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intertoons_project/Controllers/product_cotroller.dart';
import 'package:intertoons_project/Models/cartitem_model.dart';
import 'package:intertoons_project/Models/productdetails_model.dart';
import 'package:intertoons_project/Widgets/productdetailcart.dart';

class CartPage extends StatelessWidget {
  const CartPage(
      {Key? key, required this.cartItem, required this.productDetails})
      : super(key: key);
  final CartItem? cartItem;
  final ProductDetails? productDetails;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (con) {
        return Scaffold(
            appBar: AppBar(
              leading: BackButton(
                color: Colors.red,
              ),
              backgroundColor: Color.fromARGB(246, 83, 24, 109),
              flexibleSpace: Container(
                child: Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 50, right: 20, top: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Cart (${con.itemCount})",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text("Empty cart",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 3),
                        itemCount: con.counts.length,
                        itemBuilder: (context, index) {
                          var data = con.counts.values.toList();
                          var quantity = data[index].quantity;
                          var count = data[index].productId.toString();
                          return Container(
                            height: 90,
                            width: double.infinity,
                            color: Colors.white70,
                            child: Row(
                              children: [
                                Container(
                                  height: 85,
                                  width: 100,
                                  child: ClipRRect(
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl: data[index].imageUrl,
                                      placeholder: (context, index) =>
                                          Image.asset(
                                              'assets/images/placeholder.png'),
                                      errorWidget: (context, url, error) =>
                                          Image.asset(
                                              'assets/images/placeholder.png'),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 120,
                                        child: Text(
                                          data[index].title,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        data[index].prWieght,
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 35,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.pink,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Center(
                                      child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          print(" press remove btn");
                                          quantity <= 1
                                              ? null
                                              : con.decrementQuantity(count);
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 35,
                                          child: Center(
                                            child: Icon(
                                              Icons.remove,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        con.counts.values
                                            .toList()[index]
                                            .quantity
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          print("press Add bbtn");
                                          con.incrementQuantity(count);
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 35,
                                          child: Center(
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 60,
                                        child: data[index].discoundPrice == 0.0
                                            ? Text(
                                                "₹ ${(quantity * data[index].price).toString()},",
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )
                                            : Text(
                                                "₹ ${(quantity * data[index].discoundPrice).toString()},",
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                      ),
                                      SizedBox(height: 8),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 4),
                                        child: data[index].discoundPrice == 0.0
                                            ? SizedBox()
                                            : SizedBox(
                                                child: Text(
                                                    "₹ ${(quantity * data[index].price).toString()}",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                        fontSize: 10,
                                                        color: Colors.red,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                              ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 50,
                    width: double.infinity,
                    color: Colors.white70,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Avail offers/ Coupons",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.play_arrow,
                                  size: 35,
                                  color: Colors.pink,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      "You Might Also Like",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    height: 210,
                    child: ProductDetailCart(
                        cartitem: cartItem, productDetails: productDetails),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Bill Details",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Item Total",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey)),
                        Text("₹ ${con.totalAmount.toString()}",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black))
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("product Discount",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey)),
                        con.totalDiscAmount == 0.0
                            ? Text("₹ 0.0",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black))
                            : Text(
                                // "₹ ${(con.totalAmount - con.totalDiscAmount).toString()}",
                                "₹ 69",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black))
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Divider(color: Colors.black, height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Sub Total",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        con.itemCount == 0
                            ? Text("₹ 0.0",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black))
                            : Text(
                                "₹ ${(con.totalAmount - con.totalDiscAmount == 0.0 ? con.totalAmount - 69 : con.totalAmount - 0).toString()}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black))
                      ],
                    ),
                  ),
                  Divider(color: Colors.black, height: 20),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Text(
                          "SELECT DELIVERY OPTIONS",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ));
      },
    );
  }
}
