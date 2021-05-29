import 'package:flutter_test/flutter_test.dart';
import 'package:finished_games_register/app/modules/login/login_store.dart';
 
void main() {
  LoginStore store;

  setUpAll(() {
    store = LoginStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}