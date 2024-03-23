import 'package:flutter/material.dart';
import 'package:invioce_app1/view/card.dart';
import 'package:invioce_app1/view/model.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
// ✌ this is meet here ✌;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<InvoiceItem> items = [];  //object list;//that name is item;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Invoice List'),
        actions: [
          IconButton(
            icon: Icon(Icons.picture_as_pdf),
            onPressed: () {
              previewPDF(items);  //pdf funtion;
            },

          ),
        ],
      ),
      body: Center(
        child: (items != null)? //condtion is always corrct 😁;
        Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return InvoiceItemWidget(
                    item: items[index],//object list that name item so we remove at index a object;
                    onDelete: () {//onDelete is voidcallback variable
                      setState(() {
                        items.removeAt(index);
                      });
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  items.add(InvoiceItem());//add  call model class and object that add in item list;
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

//pdf function
//list a is for add item data
void previewPDF(List a) async {
  final pdf = pw.Document();//pdf variable that store all valuee ✌;
   //first make doc ;

//then add page;
  pdf.addPage(
    pw.Page(   //first page;
      build: (pw.Context context) {
        //build something so we write build then give him context of page by pw.context  👌;
        //return all page code;
        return pw.Column(///write pw at every widget 😉;
          children: [
            pw.Text('Invoice Items', style: pw.TextStyle(fontSize: 20)),
            pw.SizedBox(height: 16),
            pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                for (var item in a)

                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text(item.description,style: pw.TextStyle(fontSize: 20)),
                          pw.Text('-----------------',style: pw.TextStyle(fontSize: 10,letterSpacing: 5)),
                          pw.SizedBox(width: 50),
                          pw.Text(item.amount.toString(),style: pw.TextStyle(fontSize: 20)),
                          pw.Text('\n'),

                        ],
                      ),


              ],
            ),
          ],
        );
      },
    ),
  );

  final pdfBytes = await pdf.save();
  //printing 🎫
  await Printing.layoutPdf(
    onLayout: (PdfPageFormat format) async => pdfBytes,//we call pdf.save
  );
}



