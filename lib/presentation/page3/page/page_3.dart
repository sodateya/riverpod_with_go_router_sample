import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_with_go_router_sample/presentation/page2/provider/page_2_count_provider.dart';
import 'package:riverpod_with_go_router_sample/presentation/page3/component/count_num_container.dart';
import 'package:riverpod_with_go_router_sample/presentation/page3/component/page2_count_container.dart';
import 'package:riverpod_with_go_router_sample/presentation/page3/provider/page_3_count_provider.dart';
import 'package:riverpod_with_go_router_sample/presentation/widget/go_router_path_text.dart';
import 'package:riverpod_with_go_router_sample/presentation/widget/page_content_text.dart';

class Page3 extends ConsumerWidget {
  const Page3({super.key, required this.countNum});
  final int countNum;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final page2Count = ref.watch(page2CountProvider);

    //プロバイダに引数を持たせることができる(FamilyProvider)　※定義方法はpage_3_count_provider.dartを参照
    //(riverpod.v1で言う FamilyProviderしてあつあえる)
    final page3Count = ref.watch(page3CountProvider(countNum));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 3'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const PageContentText(
                riverpodText: 'FamilyProviderの定義・呼び出し',
                goRouterText: 'namedPushでの遷移',
              ),
              const GoRouterPathText(),
              const SizedBox(height: 20),
              CountNumContainer(
                  countNum: page3Count,
                  onTap: () {
                    final notifier =
                        ref.read(page3CountProvider(countNum).notifier);
                    notifier.increment();
                  }),
              Page2CountContainer(
                  countNum: page2Count,
                  onTap: () {
                    final notifier = ref.read(page2CountProvider.notifier);
                    notifier.increment();
                  }),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      //namedPushで遷移(namedGoも同様に使える)
                      //router.dartで定義するときにGoRouteにnameを含めて定義するとそのnameを引数に持たせることで遷移できる
                      context.pushNamed('page4');
                    },
                    child: const Text('Page 4へ')),
              ),
              const Text('namedでプッシュします\n※ソースコード参照'),
              const SizedBox(height: 80)
            ],
          ),
        ),
      ),
    );
  }
}
