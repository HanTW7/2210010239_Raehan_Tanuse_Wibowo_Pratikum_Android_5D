import 'package:flutter/material.dart';

class Image02 extends StatelessWidget {
  const Image02({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menampilkan Gambar'),
      ),
      body: SingleChildScrollView(
        // Agar konten dapat digulir
        child: Column(
          children: [
            Image.asset('assets/gambar1.jpeg'), // Gambar 1
            Image.asset('assets/gambar2.jpeg'), // Gambar 2
            Image.asset('assets/gambar3.jpeg'), // Gambar 3
            Image.asset('assets/gambar4.jpg'), // Gambar 4
            Image.asset('assets/gambar5.jpeg'), // Gambar 5 
          ],
        ),
      ),
    );
  }
}