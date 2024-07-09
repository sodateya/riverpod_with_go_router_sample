import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_with_go_router_sample/presentation/page4/model/human.dart';

part 'page4_data_provider.g.dart';

@riverpod
class Page4Data extends _$Page4Data {
  @override

  // buildメソッドにasync(非同期処理)にするとFutureProviderとして扱える　※build内に引数を持たせることも可能
  Future<Human> build() async {
    return Human(name: 'noName', age: 0);
  }

  Future getHuman() async {
    // humanListProviderからランダムに一人取得
    final humanList = ref.read(humanListProvider);
    final randomHuman = humanList[Random().nextInt(humanList.length)];

    // providerの状態をローディングにしたい時の処理
    state = const AsyncValue.loading();

    // 今回は2秒間ローディング時間を設けるよう設計
    // 本番実装でのデータをとってきている間のイメージ
    await Future.delayed(const Duration(milliseconds: 2000));
    // 得られてデータに更新する
    state = AsyncData(randomHuman);
    print(state.value!.name);
  }

  Future getErrorHuman() async {
    state = const AsyncValue.loading();
    await Future.delayed(const Duration(milliseconds: 2000));
    try {
      // エラーを無条件に発生させる
      throw Exception('エラーが発生しました');
    } catch (e, stackTrace) {
      // エラー状態を設定
      state = AsyncValue.error(e, stackTrace);
    }
  }
}

@riverpod
List<Human> humanList(HumanListRef ref) {
  return [
    Human(name: 'Funbatter', age: 28),
    Human(name: 'Jon', age: 18),
    Human(name: 'Takashi', age: 68),
    Human(name: 'Tanaka', age: 33),
    Human(name: 'Alice', age: 24),
    Human(name: 'Bob', age: 30),
    Human(name: 'Charlie', age: 45),
    Human(name: 'Dave', age: 50),
    Human(name: 'Eve', age: 35),
    Human(name: 'Frank', age: 29),
    Human(name: 'Grace', age: 40),
    Human(name: 'Heidi', age: 22),
    Human(name: 'Ivan', age: 38),
    Human(name: 'Judy', age: 27),
    Human(name: 'Mallory', age: 55),
  ];
}
