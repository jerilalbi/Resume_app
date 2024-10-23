import 'dart:typed_data';

import 'package:pdf/widgets.dart' as pdfWidget;

Future<Uint8List> generateResume() async {
  final pdf = pdfWidget.Document();

  pdf.addPage(
    pdfWidget.Page(
      build: (pdfWidget.Context context) {
        return pdfWidget.Column(
          crossAxisAlignment: pdfWidget.CrossAxisAlignment.start,
          children: [
            pdfWidget.Text('Jeril',
                style: pdfWidget.TextStyle(
                    fontSize: 24, fontWeight: pdfWidget.FontWeight.bold)),
            pdfWidget.SizedBox(height: 10),
          ],
        );
      },
    ),
  );

  return pdf.save();
}
