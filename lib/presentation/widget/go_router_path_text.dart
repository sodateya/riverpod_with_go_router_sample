import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class GoRouterPathText extends ConsumerWidget {
  const GoRouterPathText({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final path = GoRouterState.of(context).fullPath;
    final pathParameters = GoRouterState.of(context).pathParameters;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            'path : ${path.toString()}',
          ),
          Text(
            'pathParameters : ${pathParameters.toString()}',
          ),
        ],
      ),
    );
  }
}
