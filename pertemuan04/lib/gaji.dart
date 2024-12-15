class Gaji {
  String? golongan;
  String? status;
  int masakerja = 0;

  // Setter untuk golongan
  void setGolongan(String? gol) {
    golongan = gol;
  }

  // Setter untuk status
  void setStatus(String? sts) {
    status = sts;
  }

  // Setter untuk masa kerja
  void setMasaKerja(int masa) {
    masakerja = masa;
  }

  // Menghitung tunjangan gaji pokok berdasarkan golongan
  int tunjGapok() {
    int tunjangan = 0;
    if (golongan == "I") {
      tunjangan = 2500000;
    } else if (golongan == "II") {
      tunjangan = 3000000;
    } else if (golongan == "III") {
      tunjangan = 3500000;
    } else {
      tunjangan = 4000000;
    }
    return tunjangan;
  }

  // Menghitung tunjangan berdasarkan status
  int tunjStatus() {
    int tunjangan = 0;
    if (status == "Menikah") {
      tunjangan = 1000000;
    } else {
      tunjangan = 500000;
    }
    return tunjangan;
  }

  // Menghitung tunjangan berdasarkan masa kerja
  int tunjMasaKerja() {
    int tunjangan = 0;
    if (masakerja > 0 && masakerja <= 3) {
      tunjangan = 1000000;
    } else if (masakerja > 3 && masakerja <= 6) {
      tunjangan = 1500000;
    } else {
      tunjangan = 2000000;
    }
    return tunjangan;
  }

  // Menghitung total gaji
  int gajiTotal() {
    return tunjGapok() + tunjStatus() + tunjMasaKerja();
  }
}