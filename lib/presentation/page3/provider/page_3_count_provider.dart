import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'page_3_count_provider.g.dart';

@riverpod
class Page3Count extends _$Page3Count {
  @override
  //build内に引数を持たせることができる
  //FamilyProviderとして扱える
  int build(int count) {
    return count + 10;
  }

  void increment() {
    state = state + 1;
  }
}
