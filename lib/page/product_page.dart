import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../model/product_model.dart';
import '../widgets/widgets.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.items});
  final Product items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(items.name),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset("images/${items.image}",height: 100.0,width: MediaQuery.of(context).size.width,),
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
                            ))
                    )
                )
              ]
          ),
        ),
      ),
    );
  }
}