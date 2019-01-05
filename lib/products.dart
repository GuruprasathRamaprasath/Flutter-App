import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './productdetail.dart';

class Products extends StatelessWidget {
  final List<Map<String, String>> products;
  Function deleteProducts;

  Products(this.products, {this.deleteProducts}) {
    print("Products");
  }
  Widget _buildProductWidget(BuildContext context, int index) {
    String productTitle = products[index]['title'] + ' ' + (index + 1).toString();
    return Card(
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              Image.asset(
                products[index]['image'],
                width: 300,
                height: 40,
              ),
              Container(child: Text(productTitle), margin: EdgeInsets.all(40.0)),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    child: Text('Details'),
                    onPressed: () {
                      Navigator.push<bool>(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => ProductDetail(
                              products[index]['title'] + ' ' + (index + 1).toString(),
                              products[index]['image']),
                        ),
                      ).then((bool value) {
                        if (value) {
                          print(value);
                          deleteProducts(index);
                        }
                      });
                    },
                  )
                ],
              )
            ],
          ),
          Divider(
            color: Colors.black,
          )
        ],
      ),
    );
  }

  Widget _buildProductsList() {
    return products.length > 0
        ? ListView.builder(
            itemBuilder: _buildProductWidget,
            itemCount: products.length,
          )
        : Center(
            child: Text('NO Products Found'),
          );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _buildProductsList();
  }
}
