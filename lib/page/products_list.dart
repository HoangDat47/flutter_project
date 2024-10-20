import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../model/product_model.dart';
import '../widgets/widgets.dart';

class ProductBox extends StatelessWidget {
  const ProductBox({super.key, required this.items});
  final Product items;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(2),
        height: 150,
        child: Card(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.asset("images/${items.image}"),
                Expanded(
                    child: Container(
                        padding: const EdgeInsets.all(5),
                        child: ScopedModel<Product>(
                            model: items,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(items.name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                Text(items.description),
                                Text("Price: ${items.price}"),
                                ScopedModelDescendant<Product>(
                                    builder: (context, child, item) {
                                      return RatingBox(items: item);
                                    })
                              ],
                            ))))
              ]),
        ));
  }
}
