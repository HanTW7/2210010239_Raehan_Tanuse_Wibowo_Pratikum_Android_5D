import 'package:flutter/material.dart';
import 'hasilpage.dart';

class InputNilai extends StatefulWidget {
  const InputNilai({super.key});

  @override
  State<InputNilai> createState() => _InputNilaiState();
}

class _InputNilaiState extends State<InputNilai> {
  final List<String> mataKuliah = [
    'PBO 2',
    'Teknologi Multimedia',
    'Analisi dan Desain Sistem Informasi',
    'Teknik Kompilasi',
    'Interaksi Manusia dan Komputer',
    'E-commerce',
    'Statistik dan Probalitas',
    'Sistem Operasi',
    'Rekayasa Perangkat Lunak',
    'Kecerdasan Buatan',
    'Pratikum Web 2',
    'Pratikum Android'
  ];

  final List<String> nilaiOptions = ['A', 'B+', 'B', 'C+', 'C', 'D', 'E'];

  final Map<String, String?> nilaiMataKuliah = {};

  final TextEditingController namaController = TextEditingController();
  final TextEditingController npmController = TextEditingController();

  @override
  void initState() {
    super.initState();
    for (var matkul in mataKuliah) {
      nilaiMataKuliah[matkul] = null;
    }
  }

  double konversiNilai(String nilai) {
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

  double sksMatkul(String nilai) {
    return (nilai != 'E') ? 3 : 0; // Default SKS = 3, 0 jika nilai E
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Nilai Mata Kuliah'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Masukkan Data Mahasiswa',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: npmController,
                decoration: const InputDecoration(
                  labelText: 'NPM',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 32),
              const Text(
                'Masukkan Nilai Mata Kuliah',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: mataKuliah.length,
                itemBuilder: (context, index) {
                  String matkul = mataKuliah[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Text(matkul)),
                        DropdownButton<String>(
                          hint: const Text('Pilih Nilai'),
                          value: nilaiMataKuliah[matkul],
                          onChanged: (String? value) {
                            setState(() {
                              nilaiMataKuliah[matkul] = value;
                            });
                          },
                          items: nilaiOptions.map<DropdownMenuItem<String>>((String isi) {
                            return DropdownMenuItem<String>(
                              value: isi,
                              child: Text(isi),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Map<String, double> sksMataKuliah = {};
                    nilaiMataKuliah.forEach((matkul, nilai) {
                      sksMataKuliah[matkul] = sksMatkul(nilai ?? 'E');
                    });

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HasilPage(
                          nama: namaController.text,
                          npm: npmController.text,
                          nilaiMataKuliah: nilaiMataKuliah,
                          sksMataKuliah: sksMataKuliah,
                        ),
                      ),
                    );
                  },
                  child: const Text('Hitung Nilai'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
