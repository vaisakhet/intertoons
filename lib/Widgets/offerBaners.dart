import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intertoons_project/Models/product_model.dart';

class OfferBaners extends StatelessWidget {
  const OfferBaners({
    Key? key,
    required this.product,
    required this.bColor,
    required this.eColor,
    // required this.imageUrl,
  }) : super(key: key);

  final ProductModel? product;
  final Color bColor;
  final Color eColor;
  // final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: 200,
          child: ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(width: 10);
              },
              scrollDirection: Axis.horizontal,
              itemCount: product!.data!.mobileMainBanners!.length,
              itemBuilder: (BuildContext context, index) {
                return Container(
                  height: 160,
                  width: 360,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [bColor, eColor]),
                      borderRadius: BorderRadius.circular(12)),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl:
                        product!.data!.mobileMainBanners![index].imageUrl ?? "",
                    placeholder: (context, index) =>
                        Image.asset('assets/images/placeholder-icon.jpg'),
                    errorWidget: (context, url, error) => Icon(
                      Icons.error,
                      color: Colors.black,
                    ),
                  ),
                );
              }),
        ));
  }
}
