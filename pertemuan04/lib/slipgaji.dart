import 'package:flutter/material.dart';

class Slipgaji extends StatelessWidget {
  final int gajiTotal;
  final int tunjGol;
  final int tunjStatus;
  final int tunjMasaKerja;
  final String nip;
  final String nama;

  const Slipgaji({
    super.key,
    required this.nip,
    required this.nama,
    required this.tunjGol,
    required this.tunjStatus,
    required this.tunjMasaKerja,
    required this.gajiTotal,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slip Gaji Pegawai'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('NIP: $nip', style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              Text('Nama Pegawai: $nama', style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              Text('Tunjangan Golongan: $tunjGol', style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              Text('Tunjangan Status: $tunjStatus', style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              Text('Tunjangan Masa Kerja: $tunjMasaKerja', style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 16),
              Text(
                'Gaji Total: $gajiTotal',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
