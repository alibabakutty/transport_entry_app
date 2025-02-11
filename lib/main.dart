import 'package:flutter/material.dart';
import 'package:transport_entry_app/screens/home_page.dart';

void main() {
  runApp(const TransportEntryApp());
}

class TransportEntryApp extends StatelessWidget {
  const TransportEntryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Transport Entry App',
      home: HomePage(),
    );
  }
}
