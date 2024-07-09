import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_with_go_router_sample/presentation/widget/add_button.dart';

class CountContainer extends ConsumerWidget {
  const CountContainer(
      {super.key,
      required this.countNum,
      required this.onAddTap,
      required this.onRemoveTap});
  final int countNum;
  final void Function() onAddTap;
  final void Function() onRemoveTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 280,
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color.fromARGB(255, 201, 196, 234)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('page3に渡す数字'),
                Text(countNum.toString(), style: const TextStyle(fontSize: 32)),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 1,
          right: 1,
          child: AddButton(
              color: const Color.fromARGB(255, 103, 83, 234), onTap: onAddTap),
        ),
        Positioned(
          bottom: 1,
          left: 1,
          child: AddButton(
            color: const Color.fromARGB(255, 103, 83, 234),
            onTap: onRemoveTap,
            icon: Icons.remove,
          ),
        )
      ],
    );
  }
}
