import 'package:flutter/material.dart';

class StudiKasus03 extends StatefulWidget {
  const StudiKasus03({super.key});

  @override
  _StudiKasus03State createState() => _StudiKasus03State();
}

class _StudiKasus03State extends State<StudiKasus03> {
  final List<String> _hokageList = [
    'Hokage 1',
    'Hokage 2',
    'Hokage 3',
    'Hokage 4',
    'Hokage 5'
  ];

  String? _selectedHokage;
  String? _imageUrl;

  final Map<String, String> _hokageImages = {
    'Hokage 1': 'https://static.wikia.nocookie.net/naruto/images/3/30/Hokage_Hashirama.png',
    'Hokage 2': 'https://cdn.idntimes.com/content-images/duniaku/post/20191219/kage-terkuat-tobirama-senju-4f785ff7a463c753eddd05d0c0e9da9b.jpg',
    'Hokage 3': 'https://cdn.idntimes.com/content-images/community/2023/08/2906592-cropped-56965fbaa68adf470a17cc45ea5d328d-1c144a7a493a45ebf933a8015a055700_600x400.jpg',
    'Hokage 4': 'https://img.koran-jakarta.com/images/article/masashi-kishimoto-bakal-buat-spin-off-hokage-keempat-minato-namikaze-230420120651.jpeg',
    'Hokage 5': 'https://assets.pikiran-rakyat.com/crop/0x0:0x0/750x500/photo/2022/10/23/934786489.jpg',
  };

  void _loadImage() {
    setState(() {
      _imageUrl = _hokageImages[_selectedHokage];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Studi Kasus 03'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButton<String>(
              value: _selectedHokage,
              hint: const Text('Pilih Hokage'),
              isExpanded: true,
              items: _hokageList.map((hokage) {
                return DropdownMenuItem<String>(
                  value: hokage,
                  child: Text(hokage),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedHokage = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _selectedHokage != null ? _loadImage : null,
              child: const Text('Tampilkan Gambar'),
            ),
            const SizedBox(height: 20),
            if (_imageUrl != null)
              Expanded(
                child: Image.network(
                  _imageUrl!,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Text('Gagal memuat gambar'),
                    );
                  },
                ),
              )
          ],
        ),
      ),
    );
  }
}