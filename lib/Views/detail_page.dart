import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intertoons_project/Controllers/product_cotroller.dart';
import 'package:intertoons_project/Models/cartitem_model.dart';
import 'package:intertoons_project/Models/productdetails_model.dart';
import 'package:intertoons_project/Widgets/variantlistview.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    Key? key,
    this.top,
    this.prouData,
  }) : super(key: key);
  final Data? top;
  final ProuData? prouData;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (con) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
              toolbarHeight: 80,
              backgroundColor: Colors.white,
              elevation: 0,
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                    )),
                SizedBox(width: 20),
                IconButton(
                    onPressed: () {},
                    icon: Stack(
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          color: Colors.black,
                        ),
                        con.itemCount == 0
                            ? SizedBox()
                            : Positioned(
                                left: 10,
                                bottom: 10,
                                child: Container(
                                  height: 15,
                                  width: 15,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                    child: Text(
                                      con.itemCount.toString(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 8),
                                    ),
                                  ),
                                ))
                      ],
                    ))
              ],
              leading: BackButton(
                color: Colors.black,
              )),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      padding: const EdgeInsets.only(bottom: 10),
                      width: double.infinity,
                      height: 300,
                      color: Colors.white,
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: top!.imageUrl ?? "",
                        placeholder: (context, index) => Image.asset(
                          'assets/images/placeholder.png',
                          fit: BoxFit.cover,
                        ),
                        errorWidget: (context, url, error) =>
                            Image.asset('assets/images/placeholder-icon.jpg'),
                      ),
                    ),
                    Positioned(
                        top: 20,
                        right: 14,
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite_border,
                              color: Colors.red,
                              size: 30,
                            ))),
                    Positioned(
                        top: 230,
                        right: 14,
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.zoom_out_map_rounded,
                              color: Colors.black,
                              size: 30,
                            )))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        top!.prName ?? '',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        top!.prWeight ?? '',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      SizedBox(height: 8),
                      Text(
                        " ₹ ${top!.unitPrice.toString()}",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
                Container(
                  height: 230,
                  width: double.infinity,
                  color: Color.fromRGBO(248, 243, 254, 1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 5),
                        child: Text(
                          'Please select a variant',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ),
                      Expanded(
                        child: VariantListView(top: top),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'About Product',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.keyboard_arrow_down))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14, top: 5, bottom: 15),
                  child: Center(
                    child: Text(
                      top!.prName ?? '',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
