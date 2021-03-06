// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: PostgresOrmGenerator
// **************************************************************************

import 'dart:async';
import 'package:angel_orm/angel_orm.dart';
import 'package:postgres/postgres.dart';
import 'author.dart';

class AuthorQuery {
  final Map<AuthorQuery, bool> _unions = {};

  String _sortKey;

  String _sortMode;

  int limit;

  int offset;

  final List<AuthorQueryWhere> _or = [];

  final AuthorQueryWhere where = new AuthorQueryWhere();

  void union(AuthorQuery query) {
    _unions[query] = false;
  }

  void unionAll(AuthorQuery query) {
    _unions[query] = true;
  }

  void sortDescending(String key) {
    _sortMode = 'Descending';
    _sortKey = ('' + key);
  }

  void sortAscending(String key) {
    _sortMode = 'Ascending';
    _sortKey = ('' + key);
  }

  void or(AuthorQueryWhere selector) {
    _or.add(selector);
  }

  String toSql([String prefix]) {
    var buf = new StringBuffer();
    buf.write(prefix != null
        ? prefix
        : 'SELECT id, name, created_at, updated_at FROM "authors"');
    if (prefix == null) {}
    var whereClause = where.toWhereClause();
    if (whereClause != null) {
      buf.write(' ' + whereClause);
    }
    _or.forEach((x) {
      var whereClause = x.toWhereClause(keyword: false);
      if (whereClause != null) {
        buf.write(' OR (' + whereClause + ')');
      }
    });
    if (prefix == null) {
      if (limit != null) {
        buf.write(' LIMIT ' + limit.toString());
      }
      if (offset != null) {
        buf.write(' OFFSET ' + offset.toString());
      }
      if (_sortMode == 'Descending') {
        buf.write(' ORDER BY "' + _sortKey + '" DESC');
      }
      if (_sortMode == 'Ascending') {
        buf.write(' ORDER BY "' + _sortKey + '" ASC');
      }
      _unions.forEach((query, all) {
        buf.write(' UNION');
        if (all) {
          buf.write(' ALL');
        }
        buf.write(' (');
        var sql = query.toSql().replaceAll(';', '');
        buf.write(sql + ')');
      });
      buf.write(';');
    }
    return buf.toString();
  }

  static Author parseRow(List row) {
    var result = new Author.fromJson({
      'id': row[0].toString(),
      'name': row[1],
      'created_at': row[2],
      'updated_at': row[3]
    });
    return result;
  }

  Stream<Author> get(PostgreSQLConnection connection) {
    StreamController<Author> ctrl = new StreamController<Author>();
    connection.query(toSql()).then((rows) async {
      var futures = rows.map((row) async {
        var parsed = parseRow(row);
        return parsed;
      });
      var output = await Future.wait(futures);
      output.forEach(ctrl.add);
      ctrl.close();
    }).catchError(ctrl.addError);
    return ctrl.stream;
  }

  static Future<Author> getOne(int id, PostgreSQLConnection connection) {
    var query = new AuthorQuery();
    query.where.id.equals(id);
    return query.get(connection).first.catchError((_) => null);
  }

  Stream<Author> update(PostgreSQLConnection connection,
      {String name: 'Tobe Osakwe', DateTime createdAt, DateTime updatedAt}) {
    var buf = new StringBuffer(
        'UPDATE "authors" SET ("name", "created_at", "updated_at") = (@name, CAST (@createdAt AS timestamp), CAST (@updatedAt AS timestamp)) ');
    var whereClause = where.toWhereClause();
    if (whereClause != null) {
      buf.write(whereClause);
    }
    var __ormNow__ = new DateTime.now();
    var ctrl = new StreamController<Author>();
    connection.query(
        buf.toString() + ' RETURNING "id", "name", "created_at", "updated_at";',
        substitutionValues: {
          'name': name,
          'createdAt': createdAt != null ? createdAt : __ormNow__,
          'updatedAt': updatedAt != null ? updatedAt : __ormNow__
        }).then((rows) async {
      var futures = rows.map((row) async {
        var parsed = parseRow(row);
        return parsed;
      });
      var output = await Future.wait(futures);
      output.forEach(ctrl.add);
      ctrl.close();
    }).catchError(ctrl.addError);
    return ctrl.stream;
  }

  Stream<Author> delete(PostgreSQLConnection connection) {
    StreamController<Author> ctrl = new StreamController<Author>();
    connection
        .query(toSql('DELETE FROM "authors"') +
            ' RETURNING "id", "name", "created_at", "updated_at";')
        .then((rows) async {
      var futures = rows.map((row) async {
        var parsed = parseRow(row);
        return parsed;
      });
      var output = await Future.wait(futures);
      output.forEach(ctrl.add);
      ctrl.close();
    }).catchError(ctrl.addError);
    return ctrl.stream;
  }

  static Future<Author> deleteOne(int id, PostgreSQLConnection connection) {
    var query = new AuthorQuery();
    query.where.id.equals(id);
    return query.delete(connection).first;
  }

  static Future<Author> insert(PostgreSQLConnection connection,
      {String name: 'Tobe Osakwe',
      DateTime createdAt,
      DateTime updatedAt}) async {
    var __ormNow__ = new DateTime.now();
    var result = await connection.query(
        'INSERT INTO "authors" ("name", "created_at", "updated_at") VALUES (@name, CAST (@createdAt AS timestamp), CAST (@updatedAt AS timestamp)) RETURNING "id", "name", "created_at", "updated_at";',
        substitutionValues: {
          'name': name,
          'createdAt': createdAt != null ? createdAt : __ormNow__,
          'updatedAt': updatedAt != null ? updatedAt : __ormNow__
        });
    var output = parseRow(result[0]);
    return output;
  }

  static Future<Author> insertAuthor(
      PostgreSQLConnection connection, Author author) {
    return AuthorQuery.insert(connection,
        name: author.name,
        createdAt: author.createdAt,
        updatedAt: author.updatedAt);
  }

  static Future<Author> updateAuthor(
      PostgreSQLConnection connection, Author author) {
    var query = new AuthorQuery();
    query.where.id.equals(int.parse(author.id));
    return query
        .update(connection,
            name: author.name,
            createdAt: author.createdAt,
            updatedAt: author.updatedAt)
        .first;
  }

  static Stream<Author> getAll(PostgreSQLConnection connection) =>
      new AuthorQuery().get(connection);
}

class AuthorQueryWhere {
  final NumericSqlExpressionBuilder<int> id =
      new NumericSqlExpressionBuilder<int>();

  final StringSqlExpressionBuilder name = new StringSqlExpressionBuilder();

  final DateTimeSqlExpressionBuilder createdAt =
      new DateTimeSqlExpressionBuilder('authors.created_at');

  final DateTimeSqlExpressionBuilder updatedAt =
      new DateTimeSqlExpressionBuilder('authors.updated_at');

  String toWhereClause({bool keyword}) {
    final List<String> expressions = [];
    if (id.hasValue) {
      expressions.add('authors.id ' + id.compile());
    }
    if (name.hasValue) {
      expressions.add('authors.name ' + name.compile());
    }
    if (createdAt.hasValue) {
      expressions.add(createdAt.compile());
    }
    if (updatedAt.hasValue) {
      expressions.add(updatedAt.compile());
    }
    return expressions.isEmpty
        ? null
        : ((keyword != false ? 'WHERE ' : '') + expressions.join(' AND '));
  }
}

class AuthorFields {
  static const id = 'id';

  static const name = 'name';

  static const createdAt = 'created_at';

  static const updatedAt = 'updated_at';
}
