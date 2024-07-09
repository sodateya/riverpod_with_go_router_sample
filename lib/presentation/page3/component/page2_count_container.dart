import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_with_go_router_sample/presentation/widget/add_button.dart';

class Page2CountContainer extends ConsumerWidget {
  const Page2CountContainer(
      {super.key, required this.countNum, required this.onTap});
  final int countNum;
  final void Function() onTap;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 280,
            height: 220,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color.fromARGB(255, 230, 230, 205)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('page2CountProvider\n(page2Count)'),
                const SizedBox(height: 24),
                Text(countNum.toString(), style: const TextStyle(fontSize: 32)),
                const Text('インクリメントして戻ると\n同じプロバイダーのため\n前画面の数字も変わっている'),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 1,
          right: 1,
          child: AddButton(
              color: const Color.fromARGB(255, 236, 236, 50),
              iconColor: Colors.black,
              onTap: onTap),
        )
      ],
    );
  }
}
