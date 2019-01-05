import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';

class ProductDetail extends StatelessWidget {
  final String title;
  final String imageUrl;

  _showAlertView(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text('Are you sure?'),
            content: Text('You want to Delete?'),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context, true);
                },
              ),
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  ProductDetail(this.title, this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              imageUrl,
            ),
            Container(
              child: Text(title),
              padding: EdgeInsets.all(10.0),
            ),
            Container(
              child: RaisedButton(
                color: Theme.of(context).accentColor,
                child: Text('Delete Product'),
                onPressed: () => _showAlertView(context),
              ),
              padding: EdgeInsets.all(10.0),
            )
          ],
        ),
      ),
    );
  }
}
