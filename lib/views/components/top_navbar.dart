import 'package:flutter/material.dart';

class TopNavBar extends StatelessWidget {
  const TopNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      color: Colors.teal.shade700,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Riyadh.dev',
              style: TextStyle(fontSize: 22, color: Colors.white)),
          Row(
            children: [
              _navItem('Home'),
              _navItem('Projects'),
              _navItem('Contact'),
            ],
          )
        ],
      ),
    );
  }

  Widget _navItem(String title) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    child: Text(title, style: const TextStyle(color: Colors.white)),
  );
}
