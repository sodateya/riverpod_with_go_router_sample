import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageContentText extends ConsumerWidget {
  const PageContentText({super.key, this.riverpodText, this.goRouterText});
  final String? riverpodText;
  final String? goRouterText;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('~学習内容~'),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all()),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      riverpodText == null
                          ? const SizedBox.shrink()
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'riverpod',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    riverpodText!,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 16),
                                  )
                                ],
                              ),
                            ),
                      goRouterText == null
                          ? const SizedBox.shrink()
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'go_router',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    goRouterText!,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
