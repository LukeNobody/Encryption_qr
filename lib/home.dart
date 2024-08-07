import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:qr_flutter/qr_flutter.dart';

class EncryptionScreen extends StatefulWidget {
  const EncryptionScreen({super.key});
  @override
  State<EncryptionScreen> createState() => _EncryptionScreenState();
}

class _EncryptionScreenState extends State<EncryptionScreen> {
  final TextEditingController _keyControl = TextEditingController();
  final TextEditingController _valControl = TextEditingController();
  String _encryptedValue = '';

  void _encryptText(String val) {
    final keyStr = _keyControl.text;
    final valStr = _valControl.text;

    if (keyStr.isNotEmpty && valStr.isNotEmpty) {
      final key = encrypt.Key.fromUtf8(keyStr.padRight(32, ' '));
      final iv = encrypt.IV.fromLength(16);
      final encrypter = encrypt.Encrypter(encrypt.AES(key));

      final encrypted = encrypter.encrypt(valStr, iv: iv);
      
        _encryptedValue = encrypted.base64;
    }
    
      setState(() {
      });
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
            TextField(
              controller: _keyControl,
              onChanged: _encryptText,
              decoration: const InputDecoration(labelText: 'Encryption Key'),
            ),
            TextField(
              controller: _valControl,
              onChanged: _encryptText,
              decoration: const InputDecoration(labelText: 'Text to encrypt'),
            ),
            //SizedBox(height: 20),
            //ElevatedButton(onPressed:  _encryptText, child: Text('Encrypt')),
            /* const Text('Encrypted text:'),
            const SizedBox(
              height: 10,
            ),
            SelectableText(_encryptedValue,
                style: TextStyle(fontWeight: FontWeight.bold)), */
            if (_keyControl.text.isNotEmpty && _valControl.text.isNotEmpty)
              QrImageView(
                data: _encryptedValue,
                version: QrVersions.auto,
                size: 200.0,
              ),
          ],
        ),
      ),
    );
  }
}
