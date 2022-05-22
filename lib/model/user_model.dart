import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  final String city_name;
  @HiveField(1)
  final String id;

  User({
    required this.city_name,
    required this.id,
  });
}
