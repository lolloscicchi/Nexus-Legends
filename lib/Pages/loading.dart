
  import 'package:flutter/material.dart';
  import '../main.dart';

  class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

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
  child: Center(
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Benvenuto in',
                style: TextStyle(
                color: Colors.white70,
                fontSize: 24,
                ),
              ),
              const SizedBox(height: 10),
                const Text(
                  'Nexus Legend',
                  style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  ),
                ),
                  const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[700],
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                // Show loading dialog
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    );
                  },
                );

                // Navigate after 1.5 seconds
                Future.delayed(const Duration(milliseconds: 1500), () {
                  // Close the loading dialog
                  Navigator.of(context).pop();

                  // Navigate to main page
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainNavigationPage(),
                    ),
                  );
                });
              },
              child: const Text(
                'Inizia',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
    ),
  ),
    ),
  );
  }
  }