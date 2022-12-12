import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intertoons_project/Models/cartitem_model.dart';
import 'package:intertoons_project/Controllers/favorite_controller.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key, required this.cartitem}) : super(key: key);
  final CartItem? cartitem;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteController>(
      builder: (con) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(246, 83, 36, 104),
            title: Text("Favorites"),
            centerTitle: true,
            elevation: 0,
          ),
          body: ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    con.proName[index],
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      con.toggleFavorite(cartitem!, index,
                          cartitem!.data![index].prName ?? '');
                    },
                    icon: con.isExist(
                            (cartitem!.data![index].productId.toString()))
                        ? Icon(Icons.favorite, color: Colors.red)
                        : Icon(Icons.favorite_border, color: Colors.red),
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                    height: 5,
                  ),
              itemCount: con.words.length),
        );
      },
    );
  }
}
