library angel_orm.generator.models.car;

import 'package:angel_framework/common.dart';
import 'package:angel_orm/angel_orm.dart';
import 'package:angel_serialize/angel_serialize.dart';
part 'car.g.dart';

@serializable
@orm
class _Car extends Model {
  String make;
  String description;
  bool familyFriendly;
  DateTime recalledAt;
}
