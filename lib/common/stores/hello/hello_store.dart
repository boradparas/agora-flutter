import 'package:demo_paras/common/repository/hello_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

part 'hello_store.g.dart';

class HelloStore = _HelloStore with _$HelloStore;

abstract class _HelloStore with Store {
  _HelloStore() {
    _init();
  }

  final _helloRepository = HelloRepository();

  @observable
  List<String> names = [];

  @observable
  Exception? error;

  @action
  void changeName(List<String> names) {
    this.names = names;
  }

  Future<void> _init() async {
    try {
      _helloRepository.helloStreams().handleError(
        (e) {
          error = e;
          debugPrint(e.toString());
        },
      ).listen(
        (event) {
          changeName(event.map((e) => e.name).toList());
        },
      );
    } on Exception catch (e) {
      error = e;
      debugPrint(e.toString());
    }
  }
}
