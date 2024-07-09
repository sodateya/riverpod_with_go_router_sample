// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_3_count_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$page3CountHash() => r'aadece16253c393f036ff712049979c6ebebe055';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$Page3Count extends BuildlessAutoDisposeNotifier<int> {
  late final int count;

  int build(
    int count,
  );
}

/// See also [Page3Count].
@ProviderFor(Page3Count)
const page3CountProvider = Page3CountFamily();

/// See also [Page3Count].
class Page3CountFamily extends Family<int> {
  /// See also [Page3Count].
  const Page3CountFamily();

  /// See also [Page3Count].
  Page3CountProvider call(
    int count,
  ) {
    return Page3CountProvider(
      count,
    );
  }

  @override
  Page3CountProvider getProviderOverride(
    covariant Page3CountProvider provider,
  ) {
    return call(
      provider.count,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'page3CountProvider';
}

/// See also [Page3Count].
class Page3CountProvider
    extends AutoDisposeNotifierProviderImpl<Page3Count, int> {
  /// See also [Page3Count].
  Page3CountProvider(
    int count,
  ) : this._internal(
          () => Page3Count()..count = count,
          from: page3CountProvider,
          name: r'page3CountProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$page3CountHash,
          dependencies: Page3CountFamily._dependencies,
          allTransitiveDependencies:
              Page3CountFamily._allTransitiveDependencies,
          count: count,
        );

  Page3CountProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.count,
  }) : super.internal();

  final int count;

  @override
  int runNotifierBuild(
    covariant Page3Count notifier,
  ) {
    return notifier.build(
      count,
    );
  }

  @override
  Override overrideWith(Page3Count Function() create) {
    return ProviderOverride(
      origin: this,
      override: Page3CountProvider._internal(
        () => create()..count = count,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        count: count,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<Page3Count, int> createElement() {
    return _Page3CountProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is Page3CountProvider && other.count == count;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, count.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin Page3CountRef on AutoDisposeNotifierProviderRef<int> {
  /// The parameter `count` of this provider.
  int get count;
}

class _Page3CountProviderElement
    extends AutoDisposeNotifierProviderElement<Page3Count, int>
    with Page3CountRef {
  _Page3CountProviderElement(super.provider);

  @override
  int get count => (origin as Page3CountProvider).count;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
