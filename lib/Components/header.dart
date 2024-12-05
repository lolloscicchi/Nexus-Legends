import 'package:flutter/material.dart';
import '../Pages/login.dart';
import '../auth.dart';

class Header extends StatelessWidget {
  final VoidCallback onMenuPressed;
  final Auth _auth = Auth();

  Header({
    super.key,
    required this.onMenuPressed,
  });

  void _handleLogout(BuildContext context) async {
    try {
      await _auth.signOut();
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => LoginPage()
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logout failed: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF2A0080), // Viola scuro
            Color(0xFF8A2BE2), // Viola brillante
          ],
        ),
      ),
      child: Column(
        children: [
          SafeArea(
            bottom: false,
            child: Container(height: 0),
          ),
          SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.menu, color: Color(0xFFEC9EF2)),
                  onPressed: onMenuPressed,
                ),
                const Text(
                  'Nexus Legend',
                  style: TextStyle(
                    color: Color(0xFFEC9EF2),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.logout, color: Color(0xFFEC9EF2)),
                  onPressed: () => _handleLogout(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}