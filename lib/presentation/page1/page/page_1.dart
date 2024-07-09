import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_with_go_router_sample/presentation/widget/go_router_path_text.dart';
import 'package:riverpod_with_go_router_sample/presentation/widget/page_content_text.dart';

class Page1 extends ConsumerWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page1'),
      ),
      body: Center(
        child: Column(
          children: [
            const PageContentText(
                goRouterText: 'go_routerを使った基本的な画面遷移・値渡し\n(ここでは、次ページのtileを渡す)'),
            const GoRouterPathText(),
            const SizedBox(height: 250),
            ElevatedButton(
                onPressed: () {
                  //page２に渡すtitleを定義
                  const page2Title = 'Page 2';

                  //context.pushまたはcontext.goで遷移できる
                  //push:プッシュ遷移
                  //go:モーダル遷移

                  //以下のように値をpathに含めると渡すことができる
                  context.push('/page2$page2Title');
                },
                child: const Text('page２へ'))
          ],
        ),
      ),
    );
  }
}
