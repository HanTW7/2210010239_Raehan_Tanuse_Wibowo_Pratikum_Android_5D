import 'package:flutter/material.dart';

class Page02 extends StatelessWidget {
  final String npm;
  final String nama;
  final String prodi;
  final String semester;
  final List<String> pemrograman;
  final Map<String, dynamic> mapData;

  const Page02({
    Key? key,
    required this.npm,
    required this.nama,
    required this.prodi,
    required this.semester,
    required this.pemrograman,
    required this.mapData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman Kedua')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("NPM: $npm", style: const TextStyle(fontSize: 16)),
            Text("Nama: $nama", style: const TextStyle(fontSize: 16)),
            Text("Prodi: $prodi", style: const TextStyle(fontSize: 16)),
            Text("Semester: $semester", style: const TextStyle(fontSize: 16)),
            Text(
              "Skill Program: ${pemrograman.join(", ")}",
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              "Map Data: ${mapData.toString()}",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}