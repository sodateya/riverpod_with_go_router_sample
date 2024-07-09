import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_with_go_router_sample/presentation/page4/model/human.dart';
import 'package:riverpod_with_go_router_sample/presentation/widget/go_router_path_text.dart';
import 'package:riverpod_with_go_router_sample/presentation/widget/page_content_text.dart';

class Page5 extends ConsumerWidget {
  const Page5({super.key, required this.human});
  final Human human;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 5'),
      ),
      body: Center(
        child: Column(
          children: [
            const PageContentText(goRouterText: 'extraで値をもらう'),
            const GoRouterPathText(),
            const Text('※extraでHumanを受け取ったため、pathに表示されない'),
            const SizedBox(height: 80),
            Text(
              'name: ${human.name} \n age: ${human.age}',
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 20),
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}
