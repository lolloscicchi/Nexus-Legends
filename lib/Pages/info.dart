import 'package:flutter/material.dart';
import '../Components/header.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF2A0080), // Viola scuro
            Color(0xFF4B0082), // Indaco
          ],
        ),
      ),
      child: Column(
        children: [
          Header(
            onMenuPressed: () {
              // Implementa qui la logica del menu
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Informazioni',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                    _buildInfoCard(
                      'Nexus Legend',
                      [
                        'Versione 1.0.0',
                        'Ultima release: Novembre 2024',
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildInfoCard(
                      'Sviluppatore',
                      [
                        'Nome Sviluppatore',
                        'email@example.com',
                        'www.example.com',
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildInfoCard(
                      'Supporto',
                      [
                        'Centro assistenza',
                        'FAQ',
                        'Contattaci',
                      ],
                      isClickable: true,
                    ),
                    const SizedBox(height: 16),
                    _buildInfoCard(
                      'Social',
                      [
                        'Facebook',
                        'Twitter',
                        'Instagram',
                      ],
                      isClickable: true,
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          // Implementa qui la logica per i termini di servizio
                        },
                        child: const Text(
                          'Termini di servizio e Privacy Policy',
                          style: TextStyle(
                            color: Colors.white70,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String title, List<String> items,
      {bool isClickable = false}) {
    return Card(
      color: Colors.white.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ...items.map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: InkWell(
                onTap: isClickable
                    ? () {
                  // Implementa qui la logica per il click
                }
                    : null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 16,
                      ),
                    ),
                    if (isClickable)
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white70,
                        size: 16,
                      ),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}