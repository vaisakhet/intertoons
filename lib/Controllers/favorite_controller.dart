import 'package:get/get.dart';
import 'package:intertoons_project/Models/cartitem_model.dart';

class FavoriteController extends GetxController {
  final List<String> _words = [];
  List<String> get words => _words;

  final List<String> _proName = [];
  List<String> get proName => _proName;

  void toggleFavorite(CartItem cartitem, int index, String productNmae) {
    final isExist = _words.contains(cartitem.data![index].productId.toString());
    if (isExist) {
      _words.remove(cartitem.data![index].productId.toString());
      _proName.remove(productNmae);
    } else {
      _words.add(cartitem.data![index].productId.toString());
      _proName.add(productNmae);
    }
    update();
  }

  bool isExist(String catId) {
    final isExist = _words.contains(catId);
    return isExist;
  }
}
