import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:resume_app/resume_templates/template1/Template1.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text(
          "Resume",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder<Uint8List>(
        future: generateResume(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return SfPdfViewer.memory(snapshot.data!);
          }
          return const Center(child: Text('Failed to load PDF.'));
        },
      ),
    );
  }
}
