import 'dart:convert';

import 'package:app_cubit_clean_architecture/core/utils/typedefs.dart';
import 'package:app_cubit_clean_architecture/src/auth/data/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tLocalUserModel = LocalUserModel.empty();
  test(
    'should be a subclass of [LocalUser] entity',
    () => expect(tLocalUserModel, isA<LocalUserModel>()),
  );

  final tMAp = jsonDecode(fixture('user.json')) as DataMap;
  group('fromMap', () {
    test('should return a valid [LocalUserModel] from the map', () {
      //act
      final result = LocalUserModel.fromMap(tMAp);

      expect(result, equals(tLocalUserModel));
    });
  });
}
