import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './products.dart';
import './products_control.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductsManager extends StatefulWidget {
  final Map<String, String> initialProducts;
  ProductsManager({this.initialProducts});
  @override
  State<StatefulWidget> createState() {
    return _ProductsManagerState();
  }
}

class _ProductsManagerState extends State<ProductsManager> {
  List<Map<String, String>> _products = [];

  @override
  void initState() {
    if (widget.initialProducts != null) {
      _products.add(widget.initialProducts);
    }

    super.initState();
  }

  void _addProducts(Map<String, String> products) async {
    SharedPreferences sharedd = await SharedPreferences.getInstance();
    Map<String, String> productsMap = {
      'title': sharedd.getString('productTitle'),
      'image': 'assets/flower.jpg'
    };
    setState(() {
      _products.add(productsMap);
    });
  }

  void _deleteProducts(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  @override
  void didUpdateWidget(ProductsManager oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          child: ProductsControl(_addProducts),
          margin: EdgeInsets.all(5.0),
        ),
        Expanded(
          child: Products(_products, deleteProducts: _deleteProducts),
        )
      ],
    );
  }
}
