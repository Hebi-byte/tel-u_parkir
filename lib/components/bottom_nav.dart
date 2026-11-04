import 'package:flutter/material.dart';

class AppBottomNav extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const AppBottomNav({super.key, required this.selectedIndex, required this.onTap});

  static const items = [
    (Icons.grid_view_rounded, 'Dashboard'),
    (Icons.emoji_events_outlined, 'Leaderboard'),
    (Icons.camera_alt_outlined, 'Report'),
    (Icons.key_outlined, 'Kehilangan'),
    (Icons.person_outline_rounded, 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFEDE5E3))),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 66,
          child: Row(
            children: List.generate(items.length, (index) {
              final active = selectedIndex == index;
              final item = items[index];
              return Expanded(
                child: InkWell(
                  onTap: () => onTap(index),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(item.$1, size: 22, color: active ? const Color(0xFFB7192B) : const Color(0xFF644F4C)),
                      const SizedBox(height: 4),
                      Text(item.$2, style: TextStyle(fontSize: 10, fontWeight: active ? FontWeight.w700 : FontWeight.w500,
                          color: active ? const Color(0xFFB7192B) : const Color(0xFF644F4C))),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
