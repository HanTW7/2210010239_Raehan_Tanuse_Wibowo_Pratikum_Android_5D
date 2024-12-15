import 'package:flutter/material.dart';

class HasilPage extends StatelessWidget {
  final String nama;
  final String npm;
  final Map<String, String?> nilaiMataKuliah;
  final Map<String, double> sksMataKuliah;

  const HasilPage({
    super.key,
    required this.nama,
    required this.npm,
    required this.nilaiMataKuliah,
    required this.sksMataKuliah,
  });

  double calculateTotalSks() {
    return sksMataKuliah.values.reduce((a, b) => a + b);
  }

  double calculateIpk() {
    double totalNilai = 0;
    double totalSks = 0;
    nilaiMataKuliah.forEach((matkul, nilai) {
      double sks = sksMataKuliah[matkul] ?? 0;
      totalSks += sks;
      totalNilai += sks * _konversiNilai(nilai ?? 'E');
    });
    return totalSks == 0 ? 0 : totalNilai / totalSks;
  }

  String indeksPrestasi(double nilai) {
    if (nilai >= 0 && nilai <= 2.5) {
      return 'Tidak Memuaskan';
    } else if (nilai >= 2.6 && nilai < 3.0) {
      return 'Memuaskan';
    } else if (nilai >= 3.1 && nilai <= 3.5) {
      return 'Sangat Memuaskan';
    } else {
      return 'Dengan Pujian';
    }
  }

  double _konversiNilai(String nilai) {
    switch (nilai) {
      case 'A':
        return 4.0;
      case 'B+':
        return 3.5;
      case 'B':
        return 3.0;
      case 'C+':
        return 2.5;
      case 'C':
        return 2.0;
      case 'D':
        return 1.0;
      case 'E':
      default:
        return 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    double totalSks = calculateTotalSks();
    double ipk = calculateIpk();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasil Perhitungan'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'DATA KHS PERSEMESTER',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Nama: $nama',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'NPM: $npm',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              Table(
                border: TableBorder.all(color: Colors.black),
                columnWidths: const {
                  0: FlexColumnWidth(2),
                  1: FlexColumnWidth(1),
                  2: FlexColumnWidth(1),
                },
                children: [
                  const TableRow(
                    decoration: BoxDecoration(color: Colors.lightGreenAccent),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Matkul', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Center(child: Text('SKS', style: TextStyle(fontWeight: FontWeight.bold))),
                      Center(child: Text('Nilai', style: TextStyle(fontWeight: FontWeight.bold))),
                    ],
                  ),
                  ...nilaiMataKuliah.keys.map((matkul) {
                    return TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(matkul),
                          ),
                        ),
                        Center(child: Text(sksMataKuliah[matkul]?.toStringAsFixed(1) ?? '0.0')),
                        Center(child: Text(nilaiMataKuliah[matkul] ?? '-')),
                      ],
                    );
                  }).toList(),
                  TableRow(
                    decoration: const BoxDecoration(color: Color.fromARGB(255, 189, 189, 189)),
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Total', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Center(child: Text(totalSks.toStringAsFixed(1), style: const TextStyle(fontWeight: FontWeight.bold))),
                      Center(child: Text(ipk.toStringAsFixed(2), style: const TextStyle(fontWeight: FontWeight.bold))),
                    ],
                  ),
                  TableRow(
                    decoration: const BoxDecoration(color: Color.fromARGB(255, 189, 189, 189)),
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Indeks Prestasi', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox.shrink(),
                      Center(child: Text(indeksPrestasi(ipk), style: const TextStyle(fontWeight: FontWeight.bold))),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Kembali'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
