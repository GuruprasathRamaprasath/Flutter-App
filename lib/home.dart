import 'package:flutter/material.dart';
import './products_manager.dart';
import './productadmin.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              title: Text('Select Items'),
            ),
            ListTile(
              title: Text('Manage Products'),
              onTap: () {
                Navigator.pushReplacementNamed(
                    context,
                    '/admin');
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('EasyForm'),
      ),
      body: ProductsManager(),
    );
  }
}
