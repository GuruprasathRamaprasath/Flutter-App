import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ProductsControl extends StatelessWidget {
  final Function addProducts;
  
  ProductsControl(this.addProducts);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoButton(
      color: Theme.of(context).primaryColor,
      onPressed: () {
        addProducts({'title': 'Icecream', 'image': 'assets/flower.jpg'});
      },
      child: Text('Add Products'),
    );
  }
}
