import 'package:flutter/material.dart';
import './home.dart';
import './createproduct.dart';
import './deleteproduct.dart';

class ProductsAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                automaticallyImplyLeading: false,
                title: Text('Select Items'),
              ),
              ListTile(
                title: Text('All Products'),
                onTap: () {
                  Navigator.pushReplacementNamed(
                      context,
                      '/home');
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Admin'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Create Products',
                icon: Icon(Icons.account_box),
              ),
              Tab(
                text: 'Delete Products',
                icon: Icon(Icons.settings),
              )
            ],
          ),
        ),
        body: TabBarView(children: <Widget>[CreateProductsView(), DeleteProductView()],),
      ),
      length: 2,
    );
  }
}
