import 'package:flutter/material.dart';
import 'package:invioce_app1/view/card.dart';
import 'package:invioce_app1/view/model.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<InvoiceItem> items = [];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Invoice List'),
        actions: [
          IconButton(
            icon: Icon(Icons.picture_as_pdf),
            onPressed: () {
              previewPDF(items);
            },

          ),
        ],
      ),
      body: Center(
        child: (items != null)?
        Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return InvoiceItemWidget(
                    item: items[index],
                    onDelete: () {
                      setState(() {
                        items.removeAt(index);
                      });
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  items.add(InvoiceItem());
                });
              },
              child: Text('Add Item'),
            ),
          ],
        )
            :Text('No invoices available.'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context,'/edit');
        },
        child: Icon(Icons.edit),
        backgroundColor: Colors.blue,
      ),
    );
  }
}


void previewPDF(List a) async {
  final pdf = pw.Document();


  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {

        return pw.Column(

          children: [
            pw.Text('Invoice Items', style: pw.TextStyle(fontSize: 20)),
            pw.SizedBox(height: 16),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                for (var item in a)
                  pw.Column(
                    children: [
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text(item.description,style: pw.TextStyle(fontSize: 20)),
                          pw.Text('-----------------',style: pw.TextStyle(fontSize: 10,letterSpacing: 5)),
                          pw.SizedBox(width: 50),
                          pw.Text(item.amount.toString(),style: pw.TextStyle(fontSize: 20)),
                        ],
                      ),
                    ]
                  )

              ],
            ),
          ],
        );
      },
    ),
  );

  final pdfBytes = await pdf.save();
  await Printing.layoutPdf(
    onLayout: (PdfPageFormat format) async => pdfBytes,
  );
}



