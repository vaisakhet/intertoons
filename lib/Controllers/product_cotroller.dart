import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intertoons_project/Models/productItem.dart';

class ProductController extends GetxController {
  Map<String, ProductItem> _count = {};

  Map<String, ProductItem> get counts {
    return {..._count};
  }

  double get totalAmount {
    var total = 0.0;
    _count.forEach((key, productItem) {
      total += (productItem.quantity) * productItem.price;
    });
    return total;
  }

  double get totalDiscAmount {
    var total = 0.0;
    _count.forEach((key, productItem) {
      total += (productItem.quantity) * productItem.discoundPrice;
    });
    return total;
  }

  int get itemCount {
    if (_count == null) {
      return 0;
    }
    return _count.length;
  }

  void addCount({
    String? title,
    double? price,
    int? quantity,
    String? productId,
    double? discoundPrice,
    String? imageUrl,
    String? prWieght,
  }) {
    if (_count.containsKey(productId)) {
      _count.update(
          productId!,
          (existingItem) => ProductItem(
                title: existingItem.title,
                price: existingItem.price,
                productId: existingItem.productId,
                quantity: existingItem.quantity,
                discoundPrice: existingItem.discoundPrice,
                imageUrl: existingItem.imageUrl,
                prWieght: existingItem.prWieght,
              ));
    } else {
      _count.putIfAbsent(
        productId!,
        () => ProductItem(
          title: title!,
          price: price!,
          productId: productId,
          quantity: 1,
          discoundPrice: discoundPrice!,
          imageUrl: imageUrl!,
          prWieght: prWieght!,
        ),
      );
    }
    Get.snackbar("Product Add", "You have Add thte $title to the cart",
        backgroundColor: Colors.black,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 1));
    update();
  }

  void incrementQuantity(String productId) {
    _count.update(
      productId,
      (existingItem) => ProductItem(
        title: existingItem.title,
        price: existingItem.price,
        quantity: existingItem.quantity + 1,
        productId: existingItem.productId,
        discoundPrice: existingItem.discoundPrice,
        imageUrl: existingItem.imageUrl,
        prWieght: existingItem.prWieght,
      ),
    );
    update();
  }

  void decrementQuantity(String productId) {
    _count.update(
      productId,
      (existingItem) {
        return ProductItem(
          title: existingItem.title,
          price: existingItem.price,
          quantity: existingItem.quantity - 1,
          productId: existingItem.productId,
          discoundPrice: existingItem.discoundPrice,
          imageUrl: existingItem.imageUrl,
          prWieght: existingItem.prWieght,
        );
      },
    );
    update();
  }
}
