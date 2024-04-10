import 'package:flutter/material.dart';
import 'model.dart';
//✌ this is meet here ✌;

class InvoiceItemWidget extends StatelessWidget {
  final InvoiceItem item;//object of invioceItem modale class;
  final VoidCallback onDelete;//voidcallback is representing a function that takes no arguments and returns void.

   InvoiceItemWidget(
      {Key ?key, required this.item, required this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      //I use card widget ✔
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: TextFormField(
                initialValue: item.description,//that time we declerd item name object
                onChanged: (value) {
                  item.description = value;//item is model's object;
                },
                decoration: InputDecoration(labelText: 'Description',),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 1,
              child: TextFormField(
                initialValue: item.amount.toString(),//this most valuble initailvalue that tostring;
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  item.amount = double.tryParse(value) ?? 0.0;//if that is no value then in pdf we see amount is 0.0;
                },
                decoration: InputDecoration(labelText: 'Amount'),
              ),
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: onDelete, //we add function at home screen; by call function ;
            ),

          ],
        ),
      ),
    );
  }
}