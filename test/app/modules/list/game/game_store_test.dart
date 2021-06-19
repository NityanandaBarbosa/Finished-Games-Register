import 'package:flutter_test/flutter_test.dart';
import 'package:finished_games_register/app/modules/list/game/game_store.dart';
 
void main() {
  GameStore store;

  setUpAll(() {
    store = GameStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}