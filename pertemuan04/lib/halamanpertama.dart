import 'package:flutter/material.dart';
import 'Halamankedua.dart';

class HalamanPertama extends StatefulWidget {
  const HalamanPertama({super.key});

  @override
  State<HalamanPertama> createState() => _HalamanPertamaState();
}

class _HalamanPertamaState extends State<HalamanPertama> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Pertama'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'HALAMAN PERTAMA',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HalamanKedua(),
                  ),
                );
              },
              child: const Text('Menuju Halaman Ke-2'),
            ),
          ],
        ),
      ),
    );
  }
}