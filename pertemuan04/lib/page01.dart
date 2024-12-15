import 'package:flutter/material.dart';
import 'page02.dart'; // Pastikan file Halaman Kedua (page02.dart) benar

class Page01 extends StatefulWidget {
  const Page01({Key? key}) : super(key: key);

  @override
  State<Page01> createState() => _Page01State();
}

class _Page01State extends State<Page01> {
  final String pnama = "Raehan Tanuse Wibowo";
  final String pnpm = "2010010239";
  final String pprodi = "TI";
  final String psemester = "V";
  final List<String> listprogram = ["PHP", "Flutter", "C++"];
  final Map<String, dynamic> mapData = {
    "IPS-1": 3.54,
    "IPS-2": 3.35,
    "IPS-3": 3.20,
    "Grade": "Memuaskan",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman Pertama')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigasi ke Page02 dengan data yang diberikan
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Page02(
                  npm: pnpm,
                  nama: pnama,
                  prodi: pprodi,
                  semester: psemester,
                  pemrograman: listprogram,
                  mapData: mapData,
                ),
              ),
            );
          },
          child: const Text("Menuju Halaman Kedua"),
        ),
      ),
    );
  }
}
