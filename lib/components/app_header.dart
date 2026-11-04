import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  static const maroon = Color(0xFFB7192B);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 16),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: maroon,
              borderRadius: BorderRadius.circular(9),
            ),
            alignment: Alignment.center,
            child: const Text('P.',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800)),
          ),
          const SizedBox(width: 9),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Tel-U Parkir',
                    style: TextStyle(color: maroon, fontSize: 18, fontWeight: FontWeight.w800, height: 1)),
                SizedBox(height: 3),
                Text('Telkom University',
                    style: TextStyle(color: Color(0xFF684D4D), fontSize: 11, height: 1)),
              ],
            ),
          ),
          IconButton(
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Belum ada notifikasi baru.')),
            ),
            icon: const Icon(Icons.notifications_none_rounded, color: Color(0xFF342626), size: 25),
            visualDensity: VisualDensity.compact,
          ),
          const SizedBox(width: 5),
          CircleAvatar(
            radius: 17,
            backgroundColor: const Color(0xFFE8D8D5),
            child: const Icon(Icons.person, color: maroon, size: 21),
          ),
        ],
      ),
    );
  }
}
