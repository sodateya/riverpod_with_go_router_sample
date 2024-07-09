import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_with_go_router_sample/presentation/page4/provider/page4_data_provider.dart';
import 'package:riverpod_with_go_router_sample/presentation/widget/go_router_path_text.dart';
import 'package:riverpod_with_go_router_sample/presentation/widget/page_content_text.dart';

class Page4 extends ConsumerWidget {
  const Page4({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // FutureProviderを呼び出し　　※定義方法はpage_4_data_provider.dartを参照
    final human = ref.watch(page4DataProvider);

    // FutureProviderは返り値のステータスにswitchよって返すものを割り当てられる
    // ※以前は公式ドキュメントでhuman.when(data.....)のようにwhenを使った割り当てを推奨していたが現在はswitchに変わりました
    final Widget humanData = switch (human) {
      // dataが入ってきた時の返すwidget
      AsyncData(:final value) => Text(
          'name: ${value.name} \n age: ${value.age}',
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 20),
          maxLines: 3,
        ),
      // errorが入ってきた時の返すwidget
      AsyncError(:final error) => Text(error.toString()),
      // loading中に返すwidget
      AsyncLoading() => const CircularProgressIndicator(),
      _ => const CircularProgressIndicator(),
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 4'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const PageContentText(
                riverpodText: 'FutureProviderの定義・呼び出し',
                goRouterText: 'extraでの値渡し',
              ),
              const GoRouterPathText(),
              const SizedBox(height: 40),

              // このようにでFutureProviderのwidgetを
              humanData,
              const SizedBox(height: 40),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color.fromARGB(255, 201, 196, 234)),
                  onPressed: () {
                    final notifier = ref.read(page4DataProvider.notifier);
                    notifier.getHuman();
                  },
                  child: const Text('Data Get')),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color.fromARGB(255, 234, 196, 196)),
                  onPressed: () {
                    final notifier = ref.read(page4DataProvider.notifier);
                    notifier.getErrorHuman();
                  },
                  child: const Text('Error Data Get')),

              const SizedBox(height: 40),
              ElevatedButton(
                  onPressed: () {
                    // モデルを次のページに渡す際はextraを使う
                    // ※extraの定義はrouter.dart参照
                    context.push('/page5', extra: human.value);
                  },
                  child: const Text('Page 5へ'))
            ],
          ),
        ),
      ),
    );
  }
}
