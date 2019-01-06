import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateProductsView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _createProductViewState();
  }
}

class _createProductViewState extends State<CreateProductsView> {
  String title = '';
  String description = '';
  String price = '';
  bool isPrimeProduct = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      margin: EdgeInsets.all(15.0),
      child: ListView(children: <Widget>[
        TextField(
          decoration: InputDecoration(
              labelText: 'Product Title',
              labelStyle: TextStyle(color: Colors.red)),
          keyboardType: TextInputType.text,
          onSubmitted: (String value) {
            setState(() {
              title = value;
            });
          },
        ),
        Text(title),
        TextField(
          decoration: InputDecoration(
              labelText: 'Product Description',
              labelStyle: TextStyle(color: Colors.red)),
          keyboardType: TextInputType.text,
          maxLines: 4,
          onSubmitted: (String value) {
            setState(() {
              description = value;
            });
          },
        ),
        Text(description),
        TextField(
          decoration: InputDecoration(
              labelText: 'Product Price',
              labelStyle: TextStyle(color: Colors.red)),
          keyboardType: TextInputType.text,
          onSubmitted: (String value) {
            setState(() {
              price = value;
            });
          },
        ),
        Text(price),
        SwitchListTile(
          value: isPrimeProduct,
          onChanged: (bool isChanged) {
            setState(() {
              isPrimeProduct = isChanged;
            });
          },
          title: Text('Prime Product'),
          secondary: Text('Just'),
        ),
        SizedBox(
          height: 50.0,
        ),
        RaisedButton(
          child: Text('Save'),
          onPressed: () {
            saveProducts(title, description, price);
          },
        )
      ]),
    );
  }

  saveProducts(String title, String descrption, String price) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('productTitle', title);
    await prefs.setString('productDescription', descrption);
    await prefs.setString('productPrice', price);
    print(prefs.getString('productTitle'));
  }
}
