import 'package:flutter_test/flutter_test.dart';
import 'package:finished_games_register/app/modules/list/register/register_store.dart';
 
void main() {
  RegisterStore store;

  setUpAll(() {
    store = RegisterStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}