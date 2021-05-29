import 'package:flutter_test/flutter_test.dart';
import 'package:finished_games_register/app/modules/list/list_store.dart';

void main() {
  ListStore store;

  setUpAll(() {
    store = ListStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}
