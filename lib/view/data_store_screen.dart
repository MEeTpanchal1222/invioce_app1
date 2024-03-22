import 'package:flutter/material.dart';

import 'model.dart';

class dataScreen extends StatelessWidget {
  late InvoiceItem item ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (value) {
                item.description = value;
              },
              decoration: InputDecoration(labelText: 'Product Name'),
            ),
            TextField(
              onChanged: (value) {
                item.amount = value as double;
              },
              decoration: InputDecoration(labelText: 'Product Price'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');

                // Save product details logic
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
