import 'package:flutter/material.dart';

class CreateProductsView extends StatelessWidget {
  Widget _buildListTile(BuildContext context, int index) {
    return ListTile(
      title: Text('Just a Trail'),
      subtitle: Text('Modal app'),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Center(
      child: RaisedButton(
        child: Text('Open Modal'),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return ListView.builder(
                  itemBuilder: _buildListTile,
                  itemCount: 10,
                );
              });
        },
      ),
    );
  }
}
