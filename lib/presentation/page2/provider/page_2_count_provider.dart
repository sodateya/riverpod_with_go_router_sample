import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'page_2_count_provider.g.dart';

// ジェネレーターを使った基本的なプロバイダーの定義
@riverpod
class Page2Count extends _$Page2Count {
  @override
  int build() {
    return 0;
  }

// プロバイダの更新したい場合は、メソッドに関数を定義できる
// プロバイダの値はstateに入っているのでstateを更新すると値をを更新できる
  void increment() {
    state = state + 1;
    print(state);
  }

  void decrement() {
    state = state - 1;
    print(state);
  }
}

// これでターミナルにて以下のコマンドを実行すると.gファイルが生成させる
// dart run build_runner build --delete-conflicting-outputs

// またプロバイダー内にメソッドを持たせない場合は以下のようにクラスではなくメソッドでも定義できる
@riverpod
int testPage2Count(TestPage2CountRef ref) {
  return 0;
}
