import 'dart:convert';

import 'package:intertoons_project/Models/cartitem_model.dart';
import 'package:intertoons_project/Models/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:intertoons_project/Models/productdetails_model.dart';

class RemoteServices {
  var client = http.Client();
  Future<ProductModel?> getApi() async {
    var uri = Uri.parse(
        'https://wpr.intertoons.net/kmshoppyapi/api/v2/Products/HomeProducts');

    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var jsons = response.body;
      var data = jsonDecode(jsons);

      return ProductModel.fromJson(data);
    } else {
      print(response.statusCode);
    }
    // return null;
  }

  Future<CartItem?> getCartItem() async {
    var uri = Uri.parse(
        'https://wpr.intertoons.net/kmshoppyapi/api/v2/FeaturedProduct?custId=21&=&guestId=4653631115');

    var response = await client.get(uri, headers: {"vendorUrlKey": "kmshoppy"});

    if (response.statusCode == 200) {
      var jsons = response.body;
      var data = jsonDecode(jsons);

      return CartItem.fromJson(data);
    } else {
      print(response.statusCode);
    }
  }

  Future<ProductDetails?> getProductDetails() async {
    try {
      var uri = Uri.parse(
          'https://wpr.intertoons.net/kmshoppyapi/api/v2/ProductDetails?urlKey=parle-hide-and-seek-biscuit-100g&custId=21'
          '&guestId=4653631114&');

      var response = await client.get(uri,
          headers: {"pincode": "kmshoppy", "vendorUrlKey": "kmshoppy"});

      if (response.statusCode == 200) {
        var jsons = response.body;
        var data = jsonDecode(jsons);

        return ProductDetails.fromJson(data);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }
}
