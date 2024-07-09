import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_with_go_router_sample/presentation/widget/go_router_path_text.dart';

class XPage extends ConsumerWidget {
  const XPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('XPage'),
      ),
      body: const Column(
        children: [
          GoRouterPathText(),
          SizedBox(height: 80),
          Center(
            child: Text(
              'countが１０を超えたため\nリダイレクトされました',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}
