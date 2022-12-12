import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intertoons_project/Controllers/product_cotroller.dart';
import 'package:intertoons_project/Models/cartitem_model.dart';
import 'package:intertoons_project/Models/productdetails_model.dart';
import 'package:intertoons_project/Views/detail_page.dart';
import 'package:intertoons_project/Controllers/favorite_controller.dart';

class ProductDetailCart extends StatelessWidget {
  const ProductDetailCart({
    Key? key,
    required this.cartitem,
    required this.productDetails,
  }) : super(key: key);

  final CartItem? cartitem;
  final ProductDetails? productDetails;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteController>(
      builder: (con) {
        return GetBuilder<ProductController>(
          builder: (proCltr) {
            return Expanded(
              child: ListView.builder(
                  itemCount: cartitem!.data!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => DetailsPage(
                                  top: cartitem!.data!.elementAt(index),
                                  prouData: productDetails?.data,
                                )));
                      },
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, bottom: 4, top: 4),
                            child: PhysicalModel(
                              color: Colors.white,
                              elevation: 10,
                              shadowColor: Colors.black,
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                width: 130,
                                height: 350,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 3, right: 3),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          con.toggleFavorite(
                                              cartitem!,
                                              index,
                                              cartitem!.data![index].prName ??
                                                  '');
                                        },
                                        icon: con.isExist((cartitem!
                                                .data![index].productId
                                                .toString()))
                                            ? Icon(Icons.favorite,
                                                color: Colors.red)
                                            : Icon(Icons.favorite_border,
                                                color: Colors.red),
                                      ),
                                      SizedBox(
                                        height: 55,
                                        width: double.infinity,
                                        child: ClipRRect(
                                          child: CachedNetworkImage(
                                            color: Colors.amber,
                                            fit: BoxFit.cover,
                                            imageUrl: cartitem!
                                                    .data![index].imageUrl ??
                                                '',
                                            placeholder: (context, index) =>
                                                Image.asset(
                                                    'assets/images/placeholder.png'),
                                            errorWidget: (context, url,
                                                    error) =>
                                                Image.asset(
                                                    'assets/images/placeholder.png'),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        cartitem?.data?[index].prName ?? '',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                      Text(
                                        "₹${cartitem?.data![index].unitPrice.toString() ?? ''}",
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            fontSize: 12,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        cartitem?.data![index].specialPrice ==
                                                0.0
                                            ? "₹ ${cartitem?.data![index].unitPrice.toString() ?? ''}"
                                            : "₹ ${cartitem?.data![index].specialPrice.toString() ?? ''}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(cartitem!
                                                    .data![index].prWeight ??
                                                ''),
                                            GestureDetector(
                                              onTap: () {
                                                print("Add to cart");
                                                proCltr.addCount(
                                                    title: cartitem!
                                                        .data![index].prName!,
                                                    price: cartitem!
                                                        .data![index]
                                                        .unitPrice!,
                                                    productId: cartitem!
                                                        .data![index].productId!
                                                        .toString(),
                                                    discoundPrice: cartitem!
                                                        .data![index]
                                                        .specialPrice!,
                                                    imageUrl: cartitem!
                                                        .data![index].imageUrl!,
                                                    prWieght: cartitem!
                                                        .data![index].prWeight);
                                              },
                                              child: PhysicalModel(
                                                color: Colors.white,
                                                elevation: 4,
                                                shadowColor:
                                                    const Color(0xFFF0F5F5),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                child: SizedBox(
                                                  height: 25,
                                                  width: 25,
                                                  child: Center(
                                                    child: Center(
                                                      child: Icon(
                                                        Icons.add,
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          cartitem!.data![index].specialPrice == 0.0
                              ? SizedBox()
                              : Positioned(
                                  left: 105,
                                  child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.pink),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Center(
                                            child: Text(
                                          "17% \n off",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white),
                                        )),
                                      ))),
                        ],
                      ),
                    );
                  }),
            );
          },
        );
      },
    );
  }
}
