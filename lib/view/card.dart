import 'package:flutter/material.dart';
import 'model.dart';

class InvoiceItemWidget extends StatelessWidget {
  final InvoiceItem item;
  final VoidCallback onDelete;

   InvoiceItemWidget(
      {Key ?key, required this.item, required this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: TextFormField(
                initialValue: item.description,
                onChanged: (value) {
                  item.description = value;
                },
                decoration: InputDecoration(labelText: 'Description',),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 1,
              child: TextFormField(
                initialValue: item.amount.toString(),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  item.amount = double.tryParse(value) ?? 0.0;
                },
                decoration: InputDecoration(labelText: 'Amount'),
              ),
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}