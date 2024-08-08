import 'package:flutter/material.dart';

import 'encryptionScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _navToCreate() {
    Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const EncryptionScreen(),
    ),
  );
  }

  void _navToScan() {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create encrypted QR code'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            FilledButton.tonal(
              onPressed: _navToCreate,
              child: const Text('Create'),
            ),
            SizedBox(height: 10),
            FilledButton.tonal(
              onPressed: _navToScan,
              child: const Text('Scan'),
            ),
          ],
        ),
      ),
    );
  }
}
