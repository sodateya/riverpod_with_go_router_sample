import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddButton extends ConsumerWidget {
  const AddButton(
      {super.key,
      required this.color,
      required this.onTap,
      this.iconColor = const Color(0xffFFFFFF),
      this.icon = Icons.add});
  final Color color;
  final Color? iconColor;
  final void Function() onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(90), color: color),
        child: Icon(icon, color: iconColor!),
      ),
    );
  }
}
