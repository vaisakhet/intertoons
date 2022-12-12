import 'package:flutter/material.dart';
import 'package:intertoons_project/Models/cartitem_model.dart';

class VariantListView extends StatelessWidget {
  const VariantListView({
    Key? key,
    required this.top,
  }) : super(key: key);

  final Data? top;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 2,
        itemBuilder: (BuildContext context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 2, color: Color.fromRGBO(101, 16, 203, 1))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 240,
                            child: Text(
                              top!.prName ?? '',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                top!.specialPrice == 0.0
                                    ? '₹ ${top!.unitPrice}'
                                    : '${top!.specialPrice}',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 10),
                              Text(
                                '₹ ${top!.unitPrice}',
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                              SizedBox(width: 10),
                              top!.specialPrice == 0.0
                                  ? SizedBox()
                                  : Container(
                                      height: 30,
                                      width: 65,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Color.fromRGBO(57, 0, 81, 1),
                                                Color.fromRGBO(148, 0, 211, 10)
                                              ]),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Center(
                                        child: Text(
                                          '4 % off',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                            ],
                          )
                        ],
                      ),
                      Container(
                        height: 30,
                        width: 85,
                        decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.circular(4)),
                        child: Center(
                            child: Text(
                          "Add",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        )),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
