// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page4_data_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$humanListHash() => r'5b3368aaa245c86d22698dffb4dca6fbc43307ec';

/// See also [humanList].
@ProviderFor(humanList)
final humanListProvider = AutoDisposeProvider<List<Human>>.internal(
  humanList,
  name: r'humanListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$humanListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HumanListRef = AutoDisposeProviderRef<List<Human>>;
String _$page4DataHash() => r'abc968f5e518f5ad3ee2f3a340a1a9174e3a7c53';

/// See also [Page4Data].
@ProviderFor(Page4Data)
final page4DataProvider =
    AutoDisposeAsyncNotifierProvider<Page4Data, Human>.internal(
  Page4Data.new,
  name: r'page4DataProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$page4DataHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Page4Data = AutoDisposeAsyncNotifier<Human>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
