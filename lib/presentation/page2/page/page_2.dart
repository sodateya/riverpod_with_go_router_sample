import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_with_go_router_sample/presentation/page2/component/count_container.dart';
import 'package:riverpod_with_go_router_sample/presentation/page2/provider/page_2_count_provider.dart';
import 'package:riverpod_with_go_router_sample/presentation/widget/go_router_path_text.dart';
import 'package:riverpod_with_go_router_sample/presentation/widget/page_content_text.dart';

class Page2 extends ConsumerWidget {
  const Page2({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(page2CountProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const PageContentText(
                  riverpodText: 'riverpodGeneratorを使った\n基本的な値の定義・更新',
                  goRouterText: '同じルート内での遷移'),
              const GoRouterPathText(),
              const SizedBox(height: 40),
              CountContainer(
                countNum: count,
                onAddTap: () {
                  //ref.read(fooProvide).notifier.Fooでプロバイダ内のメソッドを呼び出すことができる
                  final notifier = ref.read(page2CountProvider.notifier);
                  notifier.increment();
                },
                onRemoveTap: () {
                  final notifier = ref.read(page2CountProvider.notifier);
                  notifier.decrement();
                },
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                  onPressed: () {
                    //同じルート内のパスに遷移する際は以下のようにフルパスで遷移　　※同じルート内の意味はrouter.dart参照
                    context.push('/page2$title/page3$count');
                  },
                  child: const Text('Page 3へ')),
              const Text(
                  '値をPage3に渡す\ncountが10以上でXpageにリダイレクトされます\n※リダイレクトについてはrouter.dart参照'),
            ],
          ),
        ),
      ),
    );
  }
}
