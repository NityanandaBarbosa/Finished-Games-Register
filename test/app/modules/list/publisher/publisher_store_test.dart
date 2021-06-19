import 'package:flutter_test/flutter_test.dart';
import 'package:finished_games_register/app/modules/list/publisher/publisher_store.dart';

void main() {
  PublisherStore store;

  setUpAll(() {
    store = PublisherStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}
