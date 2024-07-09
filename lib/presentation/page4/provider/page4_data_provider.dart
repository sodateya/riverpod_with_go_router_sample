import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_with_go_router_sample/presentation/page4/model/human.dart';

part 'page4_data_provider.g.dart';

@riverpod
class Page4Data extends _$Page4Data {
  @override

  // buildメソッドにasync(非同期処理)にするとFutureProviderとして扱える
  Future<Human> build() async {
    return Human(name: 'noName', age: 0);
  }

  Future getHuman() async {
    // providerの状態をローディングにしたい時の処理
    state = const AsyncValue.loading();
    // 今回は2秒間ローディング時間を設けるよう設計
    // 本番実装でのデータをとってきている間のイメージ
    await Future.delayed(const Duration(milliseconds: 2000));
    // 得られてデータに更新する
    state = AsyncData(Human(name: 'Funbatter', age: 28));
    print(state);
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
