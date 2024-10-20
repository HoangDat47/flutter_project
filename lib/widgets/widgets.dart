import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../model/product_model.dart';

class RatingBox extends StatefulWidget {
  const RatingBox({super.key, required this.items});
  final Product items;

  @override
  _RatingBoxState createState() => _RatingBoxState();
}

class _RatingBoxState extends State<RatingBox> {
  double size = 20;

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(widget.items.rating);
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            icon: (widget.items.rating >= 1
                ? Icon(
              Icons.star,
              size: size,
            )
                : Icon(
              Icons.star_border,
              size: size,
            )),
            color: Colors.red[500],
            onPressed: () => setState(() {
              widget.items.updateRating(1);
            }),
            iconSize: size,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            icon: (widget.items.rating >= 2
                ? Icon(
              Icons.star,
              size: size,
            )
                : Icon(
              Icons.star_border,
              size: size,
            )),
            color: Colors.red[500],
            onPressed: () => setState(() {
              widget.items.updateRating(2);
            }),
            iconSize: size,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            icon: (widget.items.rating >= 3
                ? Icon(
              Icons.star,
              size: size,
            )
                : Icon(
              Icons.star_border,
              size: size,
            )),
            color: Colors.red[500],
            onPressed: () => setState(() {
              widget.items.updateRating(3);
            }),
            iconSize: size,
          ),
        ),
      ],
    );
  }
}