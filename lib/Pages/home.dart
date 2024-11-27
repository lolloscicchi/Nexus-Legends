import 'package:flutter/material.dart';
import '../Components/header.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  void _handleMenuPressed() {
    // Implement menu logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFFFFF),
              Color(0xFF0D47A1),
            ],
          ),
        ),
        child: Column(
          children: [
            // Header
            Header(
              onMenuPressed: _handleMenuPressed,
            ),

            // Card content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.count(
                  crossAxisCount: 1,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  children: [
                    _buildCard(
                      imageUrl: 'https://via.placeholder.com/600x150',
                      title: 'Card 1',
                      description: 'This is the first card.',
                    ),
                    _buildCard(
                      imageUrl: 'https://via.placeholder.com/600x150',
                      title: 'Card 2',
                      description: 'This is the second card.',
                    ),
                    _buildCard(
                      imageUrl: 'https://via.placeholder.com/600x150',
                      title: 'Card 3',
                      description: 'This is the third card.',
                    ),
                    _buildCard(
                      imageUrl: 'https://via.placeholder.com/600x150',
                      title: 'Card 4',
                      description: 'This is the fourth card.',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required String imageUrl,
    required String title,
    required String description,
  }) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(description),
              ],
            ),
          ),
        ],
      ),
    );
  }
}