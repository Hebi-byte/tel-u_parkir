import 'package:flutter/material.dart';

const Color appMaroon = Color(0xFFB7192B);
const Color ink = Color(0xFF292323);
const Color muted = Color(0xFF765F5C);
const Color softBackground = Color(0xFFF4F0EF);

class WhiteCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const WhiteCard({super.key, required this.child, this.padding = const EdgeInsets.all(16)});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: const Color(0xFFF1EAE8)),
      ),
      child: child,
    );
  }
}

class SectionHeading extends StatelessWidget {
  final String title;
  final String? trailing;
  final VoidCallback? onTrailingTap;

  const SectionHeading({super.key, required this.title, this.trailing, this.onTrailingTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(title, style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w700, color: ink))),
        if (trailing != null)
          GestureDetector(
            onTap: onTrailingTap,
            child: Text(trailing!, style: const TextStyle(color: appMaroon, fontSize: 11, fontWeight: FontWeight.w700)),
          ),
      ],
    );
  }
}

class SmallPill extends StatelessWidget {
  final String text;
  final Color background;
  final Color foreground;
  final IconData? icon;

  const SmallPill(this.text, {super.key, this.background = const Color(0xFFE8F9EC), this.foreground = const Color(0xFF087A35), this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(color: background, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 11, color: foreground),
            const SizedBox(width: 4),
          ],
          Text(text, style: TextStyle(fontSize: 10, color: foreground, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}
