// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shoplist_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ShopListStore on _ShopListStoreBase, Store {
  late final _$listsAtom =
      Atom(name: '_ShopListStoreBase.lists', context: context);

  @override
  ObservableList<ShopList> get lists {
    _$listsAtom.reportRead();
    return super.lists;
  }

  @override
  set lists(ObservableList<ShopList> value) {
    _$listsAtom.reportWrite(value, super.lists, () {
      super.lists = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_ShopListStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isWebSocketConnectedAtom =
      Atom(name: '_ShopListStoreBase.isWebSocketConnected', context: context);

  @override
  bool get isWebSocketConnected {
    _$isWebSocketConnectedAtom.reportRead();
    return super.isWebSocketConnected;
  }

  @override
  set isWebSocketConnected(bool value) {
    _$isWebSocketConnectedAtom.reportWrite(value, super.isWebSocketConnected,
        () {
      super.isWebSocketConnected = value;
    });
  }

  late final _$retryCountAtom =
      Atom(name: '_ShopListStoreBase.retryCount', context: context);

  @override
  int get retryCount {
    _$retryCountAtom.reportRead();
    return super.retryCount;
  }

  @override
  set retryCount(int value) {
    _$retryCountAtom.reportWrite(value, super.retryCount, () {
      super.retryCount = value;
    });
  }

  late final _$fetchErrorAtom =
      Atom(name: '_ShopListStoreBase.fetchError', context: context);

  @override
  String? get fetchError {
    _$fetchErrorAtom.reportRead();
    return super.fetchError;
  }

  @override
  set fetchError(String? value) {
    _$fetchErrorAtom.reportWrite(value, super.fetchError, () {
      super.fetchError = value;
    });
  }

  late final _$fetchListsAsyncAction =
      AsyncAction('_ShopListStoreBase.fetchLists', context: context);

  @override
  Future<void> fetchLists() {
    return _$fetchListsAsyncAction.run(() => super.fetchLists());
  }

  late final _$_ShopListStoreBaseActionController =
      ActionController(name: '_ShopListStoreBase', context: context);

  @override
  void applyUpdate(ShopListUpdate update) {
    final _$actionInfo = _$_ShopListStoreBaseActionController.startAction(
        name: '_ShopListStoreBase.applyUpdate');
    try {
      return super.applyUpdate(update);
    } finally {
      _$_ShopListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$_ShopListStoreBaseActionController.startAction(
        name: '_ShopListStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$_ShopListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
lists: ${lists},
isLoading: ${isLoading},
isWebSocketConnected: ${isWebSocketConnected},
retryCount: ${retryCount},
fetchError: ${fetchError}
    ''';
  }
}
