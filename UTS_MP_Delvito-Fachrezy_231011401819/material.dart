import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workshop Kampus',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const WorkshopPage(),
    );
  }
}

class WorkshopPage extends StatelessWidget {
  const WorkshopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workshop Kampus'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildCard(
            title: 'Flutter for Beginners',
            date: '20 Mei 2026',
            location: 'Lab Komputer A',
            quota: 'Sisa: 12/30',
          ),
          _buildCard(
            title: 'UI/UX Design',
            date: '22 Mei 2026',
            location: 'Ruang Seminar',
            quota: 'Sisa: 5/25',
          ),
          _buildCard(
            title: 'Mobile Security',
            date: '25 Mei 2026',
            location: 'Online',
            quota: 'Sisa: 20/50',
          ),
        ],
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required String date,
    required String location,
    required String quota,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('📅 $date'),
            const SizedBox(height: 4),
            Text('📍 $location'),
            const SizedBox(height: 4),
            Text('👥 $quota'),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Daftar'),
            ),
          ],
        ),
      ),
    );
  }
}