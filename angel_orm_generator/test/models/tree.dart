library angel_orm_generator.test.models.tree;

import 'package:angel_model/angel_model.dart';
import 'package:angel_orm/angel_orm.dart';
import 'package:angel_serialize/angel_serialize.dart';
import 'fruit.dart';
part 'tree.g.dart';

@serializable
@orm
class _Tree extends Model {
  @Column(index: IndexType.UNIQUE, type: ColumnType.SMALL_INT)
  int rings;

  @hasMany
  List<Fruit> fruits;
}
