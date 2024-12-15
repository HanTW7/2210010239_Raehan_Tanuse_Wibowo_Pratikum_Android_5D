import 'package:flutter/material.dart';

class ContohStatefulWidget extends StatefulWidget {
  const ContohStatefulWidget({super.key});

  @override
  _ContohStatefulWidgetState createState() => _ContohStatefulWidgetState();
}

class _ContohStatefulWidgetState extends State<ContohStatefulWidget> {
  final TextEditingController _controllerPesan = TextEditingController();
  String _pesan = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateful Widget'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            TextField(
              controller: _controllerPesan,
              decoration: const InputDecoration(
                labelText: 'Masukkan Pesan Anda:',
              ),
              onChanged: (value) {
                setState(() {
                  _pesan = value;
                });
              },
            ),
            const SizedBox(height: 20),
            Text(
              'Pesan: $_pesan',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
