// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hello_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HelloStore on _HelloStore, Store {
  late final _$namesAtom = Atom(name: '_HelloStore.names', context: context);

  @override
  List<String> get names {
    _$namesAtom.reportRead();
    return super.names;
  }

  @override
  set names(List<String> value) {
    _$namesAtom.reportWrite(value, super.names, () {
      super.names = value;
    });
  }

  late final _$errorAtom = Atom(name: '_HelloStore.error', context: context);

  @override
  Exception? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(Exception? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$_HelloStoreActionController =
      ActionController(name: '_HelloStore', context: context);

  @override
  void changeName(List<String> names) {
    final _$actionInfo = _$_HelloStoreActionController.startAction(
        name: '_HelloStore.changeName');
    try {
      return super.changeName(names);
    } finally {
      _$_HelloStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
names: ${names},
error: ${error}
    ''';
  }
}
