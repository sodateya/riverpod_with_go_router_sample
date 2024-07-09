import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_with_go_router_sample/presentation/widget/go_router_path_text.dart';
import 'package:riverpod_with_go_router_sample/presentation/widget/page_content_text.dart';

class Page1 extends ConsumerWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //page２に渡すtitleを定義
    const page2Title = 'Page 2';
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
            const SizedBox(height: 160),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Page2に渡すタイトル: "$page2Title"'),
            ),
            ElevatedButton(
                onPressed: () {
                  //context.pushまたはcontext.goで遷移できる
                  //push:プッシュ遷移
                  //go:モーダル遷移

                  //以下のように値をpathに含めると渡すことができる　※routの定義方法はrouter.dartを参照
                  context.push('/page2$page2Title');
                },
                child: const Text('page２へ'))
          ],
        ),
      ),
    );
  }
}
