// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
      'age', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _startWeightMeta =
      const VerificationMeta('startWeight');
  @override
  late final GeneratedColumn<int> startWeight = GeneratedColumn<int>(
      'start_weight', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _currentWeightMeta =
      const VerificationMeta('currentWeight');
  @override
  late final GeneratedColumn<int> currentWeight = GeneratedColumn<int>(
      'current_weight', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        email,
        password,
        image,
        age,
        startWeight,
        currentWeight,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? 'users';
  @override
  String get actualTableName => 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    if (data.containsKey('age')) {
      context.handle(
          _ageMeta, age.isAcceptableOrUnknown(data['age']!, _ageMeta));
    }
    if (data.containsKey('start_weight')) {
      context.handle(
          _startWeightMeta,
          startWeight.isAcceptableOrUnknown(
              data['start_weight']!, _startWeightMeta));
    }
    if (data.containsKey('current_weight')) {
      context.handle(
          _currentWeightMeta,
          currentWeight.isAcceptableOrUnknown(
              data['current_weight']!, _currentWeightMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image']),
      age: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}age']),
      startWeight: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}start_weight']),
      currentWeight: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}current_weight']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int id;
  final String name;
  final String email;
  final String password;
  final String? image;
  final int? age;
  final int? startWeight;
  final int? currentWeight;
  final String createdAt;
  final String updatedAt;
  const User(
      {required this.id,
      required this.name,
      required this.email,
      required this.password,
      this.image,
      this.age,
      this.startWeight,
      this.currentWeight,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['email'] = Variable<String>(email);
    map['password'] = Variable<String>(password);
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    if (!nullToAbsent || age != null) {
      map['age'] = Variable<int>(age);
    }
    if (!nullToAbsent || startWeight != null) {
      map['start_weight'] = Variable<int>(startWeight);
    }
    if (!nullToAbsent || currentWeight != null) {
      map['current_weight'] = Variable<int>(currentWeight);
    }
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      name: Value(name),
      email: Value(email),
      password: Value(password),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      age: age == null && nullToAbsent ? const Value.absent() : Value(age),
      startWeight: startWeight == null && nullToAbsent
          ? const Value.absent()
          : Value(startWeight),
      currentWeight: currentWeight == null && nullToAbsent
          ? const Value.absent()
          : Value(currentWeight),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String>(json['email']),
      password: serializer.fromJson<String>(json['password']),
      image: serializer.fromJson<String?>(json['image']),
      age: serializer.fromJson<int?>(json['age']),
      startWeight: serializer.fromJson<int?>(json['startWeight']),
      currentWeight: serializer.fromJson<int?>(json['currentWeight']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String>(email),
      'password': serializer.toJson<String>(password),
      'image': serializer.toJson<String?>(image),
      'age': serializer.toJson<int?>(age),
      'startWeight': serializer.toJson<int?>(startWeight),
      'currentWeight': serializer.toJson<int?>(currentWeight),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
    };
  }

  User copyWith(
          {int? id,
          String? name,
          String? email,
          String? password,
          Value<String?> image = const Value.absent(),
          Value<int?> age = const Value.absent(),
          Value<int?> startWeight = const Value.absent(),
          Value<int?> currentWeight = const Value.absent(),
          String? createdAt,
          String? updatedAt}) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        image: image.present ? image.value : this.image,
        age: age.present ? age.value : this.age,
        startWeight: startWeight.present ? startWeight.value : this.startWeight,
        currentWeight:
            currentWeight.present ? currentWeight.value : this.currentWeight,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('password: $password, ')
          ..write('image: $image, ')
          ..write('age: $age, ')
          ..write('startWeight: $startWeight, ')
          ..write('currentWeight: $currentWeight, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, email, password, image, age,
      startWeight, currentWeight, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.name == this.name &&
          other.email == this.email &&
          other.password == this.password &&
          other.image == this.image &&
          other.age == this.age &&
          other.startWeight == this.startWeight &&
          other.currentWeight == this.currentWeight &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> email;
  final Value<String> password;
  final Value<String?> image;
  final Value<int?> age;
  final Value<int?> startWeight;
  final Value<int?> currentWeight;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.password = const Value.absent(),
    this.image = const Value.absent(),
    this.age = const Value.absent(),
    this.startWeight = const Value.absent(),
    this.currentWeight = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String email,
    required String password,
    this.image = const Value.absent(),
    this.age = const Value.absent(),
    this.startWeight = const Value.absent(),
    this.currentWeight = const Value.absent(),
    required String createdAt,
    required String updatedAt,
  })  : name = Value(name),
        email = Value(email),
        password = Value(password),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? email,
    Expression<String>? password,
    Expression<String>? image,
    Expression<int>? age,
    Expression<int>? startWeight,
    Expression<int>? currentWeight,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (password != null) 'password': password,
      if (image != null) 'image': image,
      if (age != null) 'age': age,
      if (startWeight != null) 'start_weight': startWeight,
      if (currentWeight != null) 'current_weight': currentWeight,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? email,
      Value<String>? password,
      Value<String?>? image,
      Value<int?>? age,
      Value<int?>? startWeight,
      Value<int?>? currentWeight,
      Value<String>? createdAt,
      Value<String>? updatedAt}) {
    return UsersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      image: image ?? this.image,
      age: age ?? this.age,
      startWeight: startWeight ?? this.startWeight,
      currentWeight: currentWeight ?? this.currentWeight,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (startWeight.present) {
      map['start_weight'] = Variable<int>(startWeight.value);
    }
    if (currentWeight.present) {
      map['current_weight'] = Variable<int>(currentWeight.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('password: $password, ')
          ..write('image: $image, ')
          ..write('age: $age, ')
          ..write('startWeight: $startWeight, ')
          ..write('currentWeight: $currentWeight, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $FriendsTable extends Friends with TableInfo<$FriendsTable, Friend> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FriendsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _friendIdMeta =
      const VerificationMeta('friendId');
  @override
  late final GeneratedColumn<int> friendId = GeneratedColumn<int>(
      'friend_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [userId, friendId, createdAt];
  @override
  String get aliasedName => _alias ?? 'friends';
  @override
  String get actualTableName => 'friends';
  @override
  VerificationContext validateIntegrity(Insertable<Friend> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('friend_id')) {
      context.handle(_friendIdMeta,
          friendId.isAcceptableOrUnknown(data['friend_id']!, _friendIdMeta));
    } else if (isInserting) {
      context.missing(_friendIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userId, friendId};
  @override
  Friend map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Friend(
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      friendId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}friend_id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $FriendsTable createAlias(String alias) {
    return $FriendsTable(attachedDatabase, alias);
  }
}

class Friend extends DataClass implements Insertable<Friend> {
  final int userId;
  final int friendId;
  final String createdAt;
  const Friend(
      {required this.userId, required this.friendId, required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<int>(userId);
    map['friend_id'] = Variable<int>(friendId);
    map['created_at'] = Variable<String>(createdAt);
    return map;
  }

  FriendsCompanion toCompanion(bool nullToAbsent) {
    return FriendsCompanion(
      userId: Value(userId),
      friendId: Value(friendId),
      createdAt: Value(createdAt),
    );
  }

  factory Friend.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Friend(
      userId: serializer.fromJson<int>(json['userId']),
      friendId: serializer.fromJson<int>(json['friendId']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<int>(userId),
      'friendId': serializer.toJson<int>(friendId),
      'createdAt': serializer.toJson<String>(createdAt),
    };
  }

  Friend copyWith({int? userId, int? friendId, String? createdAt}) => Friend(
        userId: userId ?? this.userId,
        friendId: friendId ?? this.friendId,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('Friend(')
          ..write('userId: $userId, ')
          ..write('friendId: $friendId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(userId, friendId, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Friend &&
          other.userId == this.userId &&
          other.friendId == this.friendId &&
          other.createdAt == this.createdAt);
}

class FriendsCompanion extends UpdateCompanion<Friend> {
  final Value<int> userId;
  final Value<int> friendId;
  final Value<String> createdAt;
  final Value<int> rowid;
  const FriendsCompanion({
    this.userId = const Value.absent(),
    this.friendId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FriendsCompanion.insert({
    required int userId,
    required int friendId,
    required String createdAt,
    this.rowid = const Value.absent(),
  })  : userId = Value(userId),
        friendId = Value(friendId),
        createdAt = Value(createdAt);
  static Insertable<Friend> custom({
    Expression<int>? userId,
    Expression<int>? friendId,
    Expression<String>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (friendId != null) 'friend_id': friendId,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FriendsCompanion copyWith(
      {Value<int>? userId,
      Value<int>? friendId,
      Value<String>? createdAt,
      Value<int>? rowid}) {
    return FriendsCompanion(
      userId: userId ?? this.userId,
      friendId: friendId ?? this.friendId,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (friendId.present) {
      map['friend_id'] = Variable<int>(friendId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FriendsCompanion(')
          ..write('userId: $userId, ')
          ..write('friendId: $friendId, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MessagesTable extends Messages with TableInfo<$MessagesTable, Message> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MessagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _friendIdMeta =
      const VerificationMeta('friendId');
  @override
  late final GeneratedColumn<int> friendId = GeneratedColumn<int>(
      'friend_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _messageMeta =
      const VerificationMeta('message');
  @override
  late final GeneratedColumn<String> message = GeneratedColumn<String>(
      'message', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, userId, friendId, message, createdAt];
  @override
  String get aliasedName => _alias ?? 'messages';
  @override
  String get actualTableName => 'messages';
  @override
  VerificationContext validateIntegrity(Insertable<Message> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('friend_id')) {
      context.handle(_friendIdMeta,
          friendId.isAcceptableOrUnknown(data['friend_id']!, _friendIdMeta));
    } else if (isInserting) {
      context.missing(_friendIdMeta);
    }
    if (data.containsKey('message')) {
      context.handle(_messageMeta,
          message.isAcceptableOrUnknown(data['message']!, _messageMeta));
    } else if (isInserting) {
      context.missing(_messageMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Message map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Message(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      friendId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}friend_id'])!,
      message: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}message'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $MessagesTable createAlias(String alias) {
    return $MessagesTable(attachedDatabase, alias);
  }
}

class Message extends DataClass implements Insertable<Message> {
  final int id;
  final int userId;
  final int friendId;
  final String message;
  final String createdAt;
  const Message(
      {required this.id,
      required this.userId,
      required this.friendId,
      required this.message,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['friend_id'] = Variable<int>(friendId);
    map['message'] = Variable<String>(message);
    map['created_at'] = Variable<String>(createdAt);
    return map;
  }

  MessagesCompanion toCompanion(bool nullToAbsent) {
    return MessagesCompanion(
      id: Value(id),
      userId: Value(userId),
      friendId: Value(friendId),
      message: Value(message),
      createdAt: Value(createdAt),
    );
  }

  factory Message.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Message(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      friendId: serializer.fromJson<int>(json['friendId']),
      message: serializer.fromJson<String>(json['message']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'friendId': serializer.toJson<int>(friendId),
      'message': serializer.toJson<String>(message),
      'createdAt': serializer.toJson<String>(createdAt),
    };
  }

  Message copyWith(
          {int? id,
          int? userId,
          int? friendId,
          String? message,
          String? createdAt}) =>
      Message(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        friendId: friendId ?? this.friendId,
        message: message ?? this.message,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('Message(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('friendId: $friendId, ')
          ..write('message: $message, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, friendId, message, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Message &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.friendId == this.friendId &&
          other.message == this.message &&
          other.createdAt == this.createdAt);
}

class MessagesCompanion extends UpdateCompanion<Message> {
  final Value<int> id;
  final Value<int> userId;
  final Value<int> friendId;
  final Value<String> message;
  final Value<String> createdAt;
  const MessagesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.friendId = const Value.absent(),
    this.message = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  MessagesCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required int friendId,
    required String message,
    required String createdAt,
  })  : userId = Value(userId),
        friendId = Value(friendId),
        message = Value(message),
        createdAt = Value(createdAt);
  static Insertable<Message> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<int>? friendId,
    Expression<String>? message,
    Expression<String>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (friendId != null) 'friend_id': friendId,
      if (message != null) 'message': message,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  MessagesCompanion copyWith(
      {Value<int>? id,
      Value<int>? userId,
      Value<int>? friendId,
      Value<String>? message,
      Value<String>? createdAt}) {
    return MessagesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      friendId: friendId ?? this.friendId,
      message: message ?? this.message,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (friendId.present) {
      map['friend_id'] = Variable<int>(friendId.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MessagesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('friendId: $friendId, ')
          ..write('message: $message, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $TrainingsPlanTable extends TrainingsPlan
    with TableInfo<$TrainingsPlanTable, TrainingsPlanData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TrainingsPlanTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _subinfoMeta =
      const VerificationMeta('subinfo');
  @override
  late final GeneratedColumn<String> subinfo = GeneratedColumn<String>(
      'subinfo', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdByUserMeta =
      const VerificationMeta('createdByUser');
  @override
  late final GeneratedColumn<String> createdByUser = GeneratedColumn<String>(
      'created_by_user', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isPublicMeta =
      const VerificationMeta('isPublic');
  @override
  late final GeneratedColumn<bool> isPublic =
      GeneratedColumn<bool>('is_public', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_public" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        subinfo,
        description,
        createdByUser,
        isPublic,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? 'trainings_plan';
  @override
  String get actualTableName => 'trainings_plan';
  @override
  VerificationContext validateIntegrity(Insertable<TrainingsPlanData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('subinfo')) {
      context.handle(_subinfoMeta,
          subinfo.isAcceptableOrUnknown(data['subinfo']!, _subinfoMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('created_by_user')) {
      context.handle(
          _createdByUserMeta,
          createdByUser.isAcceptableOrUnknown(
              data['created_by_user']!, _createdByUserMeta));
    } else if (isInserting) {
      context.missing(_createdByUserMeta);
    }
    if (data.containsKey('is_public')) {
      context.handle(_isPublicMeta,
          isPublic.isAcceptableOrUnknown(data['is_public']!, _isPublicMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TrainingsPlanData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TrainingsPlanData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      subinfo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subinfo']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      createdByUser: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}created_by_user'])!,
      isPublic: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_public'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $TrainingsPlanTable createAlias(String alias) {
    return $TrainingsPlanTable(attachedDatabase, alias);
  }
}

class TrainingsPlanData extends DataClass
    implements Insertable<TrainingsPlanData> {
  final int id;
  final String name;
  final String? subinfo;
  final String? description;
  final String createdByUser;
  final bool isPublic;
  final DateTime createdAt;
  final DateTime updatedAt;
  const TrainingsPlanData(
      {required this.id,
      required this.name,
      this.subinfo,
      this.description,
      required this.createdByUser,
      required this.isPublic,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || subinfo != null) {
      map['subinfo'] = Variable<String>(subinfo);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['created_by_user'] = Variable<String>(createdByUser);
    map['is_public'] = Variable<bool>(isPublic);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  TrainingsPlanCompanion toCompanion(bool nullToAbsent) {
    return TrainingsPlanCompanion(
      id: Value(id),
      name: Value(name),
      subinfo: subinfo == null && nullToAbsent
          ? const Value.absent()
          : Value(subinfo),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      createdByUser: Value(createdByUser),
      isPublic: Value(isPublic),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory TrainingsPlanData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TrainingsPlanData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      subinfo: serializer.fromJson<String?>(json['subinfo']),
      description: serializer.fromJson<String?>(json['description']),
      createdByUser: serializer.fromJson<String>(json['createdByUser']),
      isPublic: serializer.fromJson<bool>(json['isPublic']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'subinfo': serializer.toJson<String?>(subinfo),
      'description': serializer.toJson<String?>(description),
      'createdByUser': serializer.toJson<String>(createdByUser),
      'isPublic': serializer.toJson<bool>(isPublic),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  TrainingsPlanData copyWith(
          {int? id,
          String? name,
          Value<String?> subinfo = const Value.absent(),
          Value<String?> description = const Value.absent(),
          String? createdByUser,
          bool? isPublic,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      TrainingsPlanData(
        id: id ?? this.id,
        name: name ?? this.name,
        subinfo: subinfo.present ? subinfo.value : this.subinfo,
        description: description.present ? description.value : this.description,
        createdByUser: createdByUser ?? this.createdByUser,
        isPublic: isPublic ?? this.isPublic,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('TrainingsPlanData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('subinfo: $subinfo, ')
          ..write('description: $description, ')
          ..write('createdByUser: $createdByUser, ')
          ..write('isPublic: $isPublic, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, subinfo, description, createdByUser,
      isPublic, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TrainingsPlanData &&
          other.id == this.id &&
          other.name == this.name &&
          other.subinfo == this.subinfo &&
          other.description == this.description &&
          other.createdByUser == this.createdByUser &&
          other.isPublic == this.isPublic &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class TrainingsPlanCompanion extends UpdateCompanion<TrainingsPlanData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> subinfo;
  final Value<String?> description;
  final Value<String> createdByUser;
  final Value<bool> isPublic;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const TrainingsPlanCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.subinfo = const Value.absent(),
    this.description = const Value.absent(),
    this.createdByUser = const Value.absent(),
    this.isPublic = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  TrainingsPlanCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.subinfo = const Value.absent(),
    this.description = const Value.absent(),
    required String createdByUser,
    this.isPublic = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
  })  : name = Value(name),
        createdByUser = Value(createdByUser),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<TrainingsPlanData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? subinfo,
    Expression<String>? description,
    Expression<String>? createdByUser,
    Expression<bool>? isPublic,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (subinfo != null) 'subinfo': subinfo,
      if (description != null) 'description': description,
      if (createdByUser != null) 'created_by_user': createdByUser,
      if (isPublic != null) 'is_public': isPublic,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  TrainingsPlanCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? subinfo,
      Value<String?>? description,
      Value<String>? createdByUser,
      Value<bool>? isPublic,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return TrainingsPlanCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      subinfo: subinfo ?? this.subinfo,
      description: description ?? this.description,
      createdByUser: createdByUser ?? this.createdByUser,
      isPublic: isPublic ?? this.isPublic,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (subinfo.present) {
      map['subinfo'] = Variable<String>(subinfo.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (createdByUser.present) {
      map['created_by_user'] = Variable<String>(createdByUser.value);
    }
    if (isPublic.present) {
      map['is_public'] = Variable<bool>(isPublic.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TrainingsPlanCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('subinfo: $subinfo, ')
          ..write('description: $description, ')
          ..write('createdByUser: $createdByUser, ')
          ..write('isPublic: $isPublic, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $UebungenTable extends Uebungen
    with TableInfo<$UebungenTable, UebungenData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UebungenTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _subinfoMeta =
      const VerificationMeta('subinfo');
  @override
  late final GeneratedColumn<String> subinfo = GeneratedColumn<String>(
      'subinfo', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _commentMeta =
      const VerificationMeta('comment');
  @override
  late final GeneratedColumn<String> comment = GeneratedColumn<String>(
      'comment', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdByUserMeta =
      const VerificationMeta('createdByUser');
  @override
  late final GeneratedColumn<String> createdByUser = GeneratedColumn<String>(
      'created_by_user', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _impactsChestMeta =
      const VerificationMeta('impactsChest');
  @override
  late final GeneratedColumn<bool> impactsChest =
      GeneratedColumn<bool>('impacts_chest', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("impacts_chest" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  static const VerificationMeta _impactsShouldersMeta =
      const VerificationMeta('impactsShoulders');
  @override
  late final GeneratedColumn<bool> impactsShoulders =
      GeneratedColumn<bool>('impacts_shoulders', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("impacts_shoulders" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  static const VerificationMeta _impactsBackMeta =
      const VerificationMeta('impactsBack');
  @override
  late final GeneratedColumn<bool> impactsBack =
      GeneratedColumn<bool>('impacts_back', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("impacts_back" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  static const VerificationMeta _impactsCalvesMeta =
      const VerificationMeta('impactsCalves');
  @override
  late final GeneratedColumn<bool> impactsCalves =
      GeneratedColumn<bool>('impacts_calves', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("impacts_calves" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  static const VerificationMeta _impactsTricepsMeta =
      const VerificationMeta('impactsTriceps');
  @override
  late final GeneratedColumn<bool> impactsTriceps =
      GeneratedColumn<bool>('impacts_triceps', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("impacts_triceps" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  static const VerificationMeta _impactsBicepsMeta =
      const VerificationMeta('impactsBiceps');
  @override
  late final GeneratedColumn<bool> impactsBiceps =
      GeneratedColumn<bool>('impacts_biceps', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("impacts_biceps" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  static const VerificationMeta _impactsAbsMeta =
      const VerificationMeta('impactsAbs');
  @override
  late final GeneratedColumn<bool> impactsAbs =
      GeneratedColumn<bool>('impacts_abs', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("impacts_abs" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  static const VerificationMeta _impactsLegsMeta =
      const VerificationMeta('impactsLegs');
  @override
  late final GeneratedColumn<bool> impactsLegs =
      GeneratedColumn<bool>('impacts_legs', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("impacts_legs" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        subinfo,
        description,
        comment,
        createdByUser,
        createdAt,
        updatedAt,
        impactsChest,
        impactsShoulders,
        impactsBack,
        impactsCalves,
        impactsTriceps,
        impactsBiceps,
        impactsAbs,
        impactsLegs
      ];
  @override
  String get aliasedName => _alias ?? 'uebungen';
  @override
  String get actualTableName => 'uebungen';
  @override
  VerificationContext validateIntegrity(Insertable<UebungenData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('subinfo')) {
      context.handle(_subinfoMeta,
          subinfo.isAcceptableOrUnknown(data['subinfo']!, _subinfoMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('comment')) {
      context.handle(_commentMeta,
          comment.isAcceptableOrUnknown(data['comment']!, _commentMeta));
    }
    if (data.containsKey('created_by_user')) {
      context.handle(
          _createdByUserMeta,
          createdByUser.isAcceptableOrUnknown(
              data['created_by_user']!, _createdByUserMeta));
    } else if (isInserting) {
      context.missing(_createdByUserMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('impacts_chest')) {
      context.handle(
          _impactsChestMeta,
          impactsChest.isAcceptableOrUnknown(
              data['impacts_chest']!, _impactsChestMeta));
    }
    if (data.containsKey('impacts_shoulders')) {
      context.handle(
          _impactsShouldersMeta,
          impactsShoulders.isAcceptableOrUnknown(
              data['impacts_shoulders']!, _impactsShouldersMeta));
    }
    if (data.containsKey('impacts_back')) {
      context.handle(
          _impactsBackMeta,
          impactsBack.isAcceptableOrUnknown(
              data['impacts_back']!, _impactsBackMeta));
    }
    if (data.containsKey('impacts_calves')) {
      context.handle(
          _impactsCalvesMeta,
          impactsCalves.isAcceptableOrUnknown(
              data['impacts_calves']!, _impactsCalvesMeta));
    }
    if (data.containsKey('impacts_triceps')) {
      context.handle(
          _impactsTricepsMeta,
          impactsTriceps.isAcceptableOrUnknown(
              data['impacts_triceps']!, _impactsTricepsMeta));
    }
    if (data.containsKey('impacts_biceps')) {
      context.handle(
          _impactsBicepsMeta,
          impactsBiceps.isAcceptableOrUnknown(
              data['impacts_biceps']!, _impactsBicepsMeta));
    }
    if (data.containsKey('impacts_abs')) {
      context.handle(
          _impactsAbsMeta,
          impactsAbs.isAcceptableOrUnknown(
              data['impacts_abs']!, _impactsAbsMeta));
    }
    if (data.containsKey('impacts_legs')) {
      context.handle(
          _impactsLegsMeta,
          impactsLegs.isAcceptableOrUnknown(
              data['impacts_legs']!, _impactsLegsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UebungenData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UebungenData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      subinfo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subinfo']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      comment: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}comment']),
      createdByUser: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}created_by_user'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      impactsChest: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}impacts_chest'])!,
      impactsShoulders: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}impacts_shoulders'])!,
      impactsBack: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}impacts_back'])!,
      impactsCalves: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}impacts_calves'])!,
      impactsTriceps: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}impacts_triceps'])!,
      impactsBiceps: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}impacts_biceps'])!,
      impactsAbs: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}impacts_abs'])!,
      impactsLegs: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}impacts_legs'])!,
    );
  }

  @override
  $UebungenTable createAlias(String alias) {
    return $UebungenTable(attachedDatabase, alias);
  }
}

class UebungenData extends DataClass implements Insertable<UebungenData> {
  final int id;
  final String name;
  final String? subinfo;
  final String? description;
  final String? comment;
  final String createdByUser;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool impactsChest;
  final bool impactsShoulders;
  final bool impactsBack;
  final bool impactsCalves;
  final bool impactsTriceps;
  final bool impactsBiceps;
  final bool impactsAbs;
  final bool impactsLegs;
  const UebungenData(
      {required this.id,
      required this.name,
      this.subinfo,
      this.description,
      this.comment,
      required this.createdByUser,
      required this.createdAt,
      required this.updatedAt,
      required this.impactsChest,
      required this.impactsShoulders,
      required this.impactsBack,
      required this.impactsCalves,
      required this.impactsTriceps,
      required this.impactsBiceps,
      required this.impactsAbs,
      required this.impactsLegs});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || subinfo != null) {
      map['subinfo'] = Variable<String>(subinfo);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || comment != null) {
      map['comment'] = Variable<String>(comment);
    }
    map['created_by_user'] = Variable<String>(createdByUser);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['impacts_chest'] = Variable<bool>(impactsChest);
    map['impacts_shoulders'] = Variable<bool>(impactsShoulders);
    map['impacts_back'] = Variable<bool>(impactsBack);
    map['impacts_calves'] = Variable<bool>(impactsCalves);
    map['impacts_triceps'] = Variable<bool>(impactsTriceps);
    map['impacts_biceps'] = Variable<bool>(impactsBiceps);
    map['impacts_abs'] = Variable<bool>(impactsAbs);
    map['impacts_legs'] = Variable<bool>(impactsLegs);
    return map;
  }

  UebungenCompanion toCompanion(bool nullToAbsent) {
    return UebungenCompanion(
      id: Value(id),
      name: Value(name),
      subinfo: subinfo == null && nullToAbsent
          ? const Value.absent()
          : Value(subinfo),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      comment: comment == null && nullToAbsent
          ? const Value.absent()
          : Value(comment),
      createdByUser: Value(createdByUser),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      impactsChest: Value(impactsChest),
      impactsShoulders: Value(impactsShoulders),
      impactsBack: Value(impactsBack),
      impactsCalves: Value(impactsCalves),
      impactsTriceps: Value(impactsTriceps),
      impactsBiceps: Value(impactsBiceps),
      impactsAbs: Value(impactsAbs),
      impactsLegs: Value(impactsLegs),
    );
  }

  factory UebungenData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UebungenData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      subinfo: serializer.fromJson<String?>(json['subinfo']),
      description: serializer.fromJson<String?>(json['description']),
      comment: serializer.fromJson<String?>(json['comment']),
      createdByUser: serializer.fromJson<String>(json['createdByUser']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      impactsChest: serializer.fromJson<bool>(json['impactsChest']),
      impactsShoulders: serializer.fromJson<bool>(json['impactsShoulders']),
      impactsBack: serializer.fromJson<bool>(json['impactsBack']),
      impactsCalves: serializer.fromJson<bool>(json['impactsCalves']),
      impactsTriceps: serializer.fromJson<bool>(json['impactsTriceps']),
      impactsBiceps: serializer.fromJson<bool>(json['impactsBiceps']),
      impactsAbs: serializer.fromJson<bool>(json['impactsAbs']),
      impactsLegs: serializer.fromJson<bool>(json['impactsLegs']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'subinfo': serializer.toJson<String?>(subinfo),
      'description': serializer.toJson<String?>(description),
      'comment': serializer.toJson<String?>(comment),
      'createdByUser': serializer.toJson<String>(createdByUser),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'impactsChest': serializer.toJson<bool>(impactsChest),
      'impactsShoulders': serializer.toJson<bool>(impactsShoulders),
      'impactsBack': serializer.toJson<bool>(impactsBack),
      'impactsCalves': serializer.toJson<bool>(impactsCalves),
      'impactsTriceps': serializer.toJson<bool>(impactsTriceps),
      'impactsBiceps': serializer.toJson<bool>(impactsBiceps),
      'impactsAbs': serializer.toJson<bool>(impactsAbs),
      'impactsLegs': serializer.toJson<bool>(impactsLegs),
    };
  }

  UebungenData copyWith(
          {int? id,
          String? name,
          Value<String?> subinfo = const Value.absent(),
          Value<String?> description = const Value.absent(),
          Value<String?> comment = const Value.absent(),
          String? createdByUser,
          DateTime? createdAt,
          DateTime? updatedAt,
          bool? impactsChest,
          bool? impactsShoulders,
          bool? impactsBack,
          bool? impactsCalves,
          bool? impactsTriceps,
          bool? impactsBiceps,
          bool? impactsAbs,
          bool? impactsLegs}) =>
      UebungenData(
        id: id ?? this.id,
        name: name ?? this.name,
        subinfo: subinfo.present ? subinfo.value : this.subinfo,
        description: description.present ? description.value : this.description,
        comment: comment.present ? comment.value : this.comment,
        createdByUser: createdByUser ?? this.createdByUser,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        impactsChest: impactsChest ?? this.impactsChest,
        impactsShoulders: impactsShoulders ?? this.impactsShoulders,
        impactsBack: impactsBack ?? this.impactsBack,
        impactsCalves: impactsCalves ?? this.impactsCalves,
        impactsTriceps: impactsTriceps ?? this.impactsTriceps,
        impactsBiceps: impactsBiceps ?? this.impactsBiceps,
        impactsAbs: impactsAbs ?? this.impactsAbs,
        impactsLegs: impactsLegs ?? this.impactsLegs,
      );
  @override
  String toString() {
    return (StringBuffer('UebungenData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('subinfo: $subinfo, ')
          ..write('description: $description, ')
          ..write('comment: $comment, ')
          ..write('createdByUser: $createdByUser, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('impactsChest: $impactsChest, ')
          ..write('impactsShoulders: $impactsShoulders, ')
          ..write('impactsBack: $impactsBack, ')
          ..write('impactsCalves: $impactsCalves, ')
          ..write('impactsTriceps: $impactsTriceps, ')
          ..write('impactsBiceps: $impactsBiceps, ')
          ..write('impactsAbs: $impactsAbs, ')
          ..write('impactsLegs: $impactsLegs')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      subinfo,
      description,
      comment,
      createdByUser,
      createdAt,
      updatedAt,
      impactsChest,
      impactsShoulders,
      impactsBack,
      impactsCalves,
      impactsTriceps,
      impactsBiceps,
      impactsAbs,
      impactsLegs);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UebungenData &&
          other.id == this.id &&
          other.name == this.name &&
          other.subinfo == this.subinfo &&
          other.description == this.description &&
          other.comment == this.comment &&
          other.createdByUser == this.createdByUser &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.impactsChest == this.impactsChest &&
          other.impactsShoulders == this.impactsShoulders &&
          other.impactsBack == this.impactsBack &&
          other.impactsCalves == this.impactsCalves &&
          other.impactsTriceps == this.impactsTriceps &&
          other.impactsBiceps == this.impactsBiceps &&
          other.impactsAbs == this.impactsAbs &&
          other.impactsLegs == this.impactsLegs);
}

class UebungenCompanion extends UpdateCompanion<UebungenData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> subinfo;
  final Value<String?> description;
  final Value<String?> comment;
  final Value<String> createdByUser;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> impactsChest;
  final Value<bool> impactsShoulders;
  final Value<bool> impactsBack;
  final Value<bool> impactsCalves;
  final Value<bool> impactsTriceps;
  final Value<bool> impactsBiceps;
  final Value<bool> impactsAbs;
  final Value<bool> impactsLegs;
  const UebungenCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.subinfo = const Value.absent(),
    this.description = const Value.absent(),
    this.comment = const Value.absent(),
    this.createdByUser = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.impactsChest = const Value.absent(),
    this.impactsShoulders = const Value.absent(),
    this.impactsBack = const Value.absent(),
    this.impactsCalves = const Value.absent(),
    this.impactsTriceps = const Value.absent(),
    this.impactsBiceps = const Value.absent(),
    this.impactsAbs = const Value.absent(),
    this.impactsLegs = const Value.absent(),
  });
  UebungenCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.subinfo = const Value.absent(),
    this.description = const Value.absent(),
    this.comment = const Value.absent(),
    required String createdByUser,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.impactsChest = const Value.absent(),
    this.impactsShoulders = const Value.absent(),
    this.impactsBack = const Value.absent(),
    this.impactsCalves = const Value.absent(),
    this.impactsTriceps = const Value.absent(),
    this.impactsBiceps = const Value.absent(),
    this.impactsAbs = const Value.absent(),
    this.impactsLegs = const Value.absent(),
  })  : name = Value(name),
        createdByUser = Value(createdByUser),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<UebungenData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? subinfo,
    Expression<String>? description,
    Expression<String>? comment,
    Expression<String>? createdByUser,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? impactsChest,
    Expression<bool>? impactsShoulders,
    Expression<bool>? impactsBack,
    Expression<bool>? impactsCalves,
    Expression<bool>? impactsTriceps,
    Expression<bool>? impactsBiceps,
    Expression<bool>? impactsAbs,
    Expression<bool>? impactsLegs,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (subinfo != null) 'subinfo': subinfo,
      if (description != null) 'description': description,
      if (comment != null) 'comment': comment,
      if (createdByUser != null) 'created_by_user': createdByUser,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (impactsChest != null) 'impacts_chest': impactsChest,
      if (impactsShoulders != null) 'impacts_shoulders': impactsShoulders,
      if (impactsBack != null) 'impacts_back': impactsBack,
      if (impactsCalves != null) 'impacts_calves': impactsCalves,
      if (impactsTriceps != null) 'impacts_triceps': impactsTriceps,
      if (impactsBiceps != null) 'impacts_biceps': impactsBiceps,
      if (impactsAbs != null) 'impacts_abs': impactsAbs,
      if (impactsLegs != null) 'impacts_legs': impactsLegs,
    });
  }

  UebungenCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? subinfo,
      Value<String?>? description,
      Value<String?>? comment,
      Value<String>? createdByUser,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<bool>? impactsChest,
      Value<bool>? impactsShoulders,
      Value<bool>? impactsBack,
      Value<bool>? impactsCalves,
      Value<bool>? impactsTriceps,
      Value<bool>? impactsBiceps,
      Value<bool>? impactsAbs,
      Value<bool>? impactsLegs}) {
    return UebungenCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      subinfo: subinfo ?? this.subinfo,
      description: description ?? this.description,
      comment: comment ?? this.comment,
      createdByUser: createdByUser ?? this.createdByUser,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      impactsChest: impactsChest ?? this.impactsChest,
      impactsShoulders: impactsShoulders ?? this.impactsShoulders,
      impactsBack: impactsBack ?? this.impactsBack,
      impactsCalves: impactsCalves ?? this.impactsCalves,
      impactsTriceps: impactsTriceps ?? this.impactsTriceps,
      impactsBiceps: impactsBiceps ?? this.impactsBiceps,
      impactsAbs: impactsAbs ?? this.impactsAbs,
      impactsLegs: impactsLegs ?? this.impactsLegs,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (subinfo.present) {
      map['subinfo'] = Variable<String>(subinfo.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String>(comment.value);
    }
    if (createdByUser.present) {
      map['created_by_user'] = Variable<String>(createdByUser.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (impactsChest.present) {
      map['impacts_chest'] = Variable<bool>(impactsChest.value);
    }
    if (impactsShoulders.present) {
      map['impacts_shoulders'] = Variable<bool>(impactsShoulders.value);
    }
    if (impactsBack.present) {
      map['impacts_back'] = Variable<bool>(impactsBack.value);
    }
    if (impactsCalves.present) {
      map['impacts_calves'] = Variable<bool>(impactsCalves.value);
    }
    if (impactsTriceps.present) {
      map['impacts_triceps'] = Variable<bool>(impactsTriceps.value);
    }
    if (impactsBiceps.present) {
      map['impacts_biceps'] = Variable<bool>(impactsBiceps.value);
    }
    if (impactsAbs.present) {
      map['impacts_abs'] = Variable<bool>(impactsAbs.value);
    }
    if (impactsLegs.present) {
      map['impacts_legs'] = Variable<bool>(impactsLegs.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UebungenCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('subinfo: $subinfo, ')
          ..write('description: $description, ')
          ..write('comment: $comment, ')
          ..write('createdByUser: $createdByUser, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('impactsChest: $impactsChest, ')
          ..write('impactsShoulders: $impactsShoulders, ')
          ..write('impactsBack: $impactsBack, ')
          ..write('impactsCalves: $impactsCalves, ')
          ..write('impactsTriceps: $impactsTriceps, ')
          ..write('impactsBiceps: $impactsBiceps, ')
          ..write('impactsAbs: $impactsAbs, ')
          ..write('impactsLegs: $impactsLegs')
          ..write(')'))
        .toString();
  }
}

class $UebungenInPlanTable extends UebungenInPlan
    with TableInfo<$UebungenInPlanTable, UebungenInPlanData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UebungenInPlanTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _trainingPlanIdMeta =
      const VerificationMeta('trainingPlanId');
  @override
  late final GeneratedColumn<int> trainingPlanId = GeneratedColumn<int>(
      'training_plan_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES trainings_plan (id)'));
  static const VerificationMeta _uebungIdMeta =
      const VerificationMeta('uebungId');
  @override
  late final GeneratedColumn<int> uebungId = GeneratedColumn<int>(
      'uebung_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES uebungen (id)'));
  static const VerificationMeta _trainingPlanNameMeta =
      const VerificationMeta('trainingPlanName');
  @override
  late final GeneratedColumn<String> trainingPlanName = GeneratedColumn<String>(
      'training_plan_name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES trainings_plan (name)'));
  static const VerificationMeta _uebungNameMeta =
      const VerificationMeta('uebungName');
  @override
  late final GeneratedColumn<String> uebungName = GeneratedColumn<String>(
      'uebung_name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES uebungen (name)'));
  static const VerificationMeta _plannedRepsMeta =
      const VerificationMeta('plannedReps');
  @override
  late final GeneratedColumn<int> plannedReps = GeneratedColumn<int>(
      'planned_reps', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _plannedSetsMeta =
      const VerificationMeta('plannedSets');
  @override
  late final GeneratedColumn<int> plannedSets = GeneratedColumn<int>(
      'planned_sets', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        trainingPlanId,
        uebungId,
        trainingPlanName,
        uebungName,
        plannedReps,
        plannedSets,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? 'uebungen_in_plan';
  @override
  String get actualTableName => 'uebungen_in_plan';
  @override
  VerificationContext validateIntegrity(Insertable<UebungenInPlanData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('training_plan_id')) {
      context.handle(
          _trainingPlanIdMeta,
          trainingPlanId.isAcceptableOrUnknown(
              data['training_plan_id']!, _trainingPlanIdMeta));
    } else if (isInserting) {
      context.missing(_trainingPlanIdMeta);
    }
    if (data.containsKey('uebung_id')) {
      context.handle(_uebungIdMeta,
          uebungId.isAcceptableOrUnknown(data['uebung_id']!, _uebungIdMeta));
    } else if (isInserting) {
      context.missing(_uebungIdMeta);
    }
    if (data.containsKey('training_plan_name')) {
      context.handle(
          _trainingPlanNameMeta,
          trainingPlanName.isAcceptableOrUnknown(
              data['training_plan_name']!, _trainingPlanNameMeta));
    } else if (isInserting) {
      context.missing(_trainingPlanNameMeta);
    }
    if (data.containsKey('uebung_name')) {
      context.handle(
          _uebungNameMeta,
          uebungName.isAcceptableOrUnknown(
              data['uebung_name']!, _uebungNameMeta));
    } else if (isInserting) {
      context.missing(_uebungNameMeta);
    }
    if (data.containsKey('planned_reps')) {
      context.handle(
          _plannedRepsMeta,
          plannedReps.isAcceptableOrUnknown(
              data['planned_reps']!, _plannedRepsMeta));
    } else if (isInserting) {
      context.missing(_plannedRepsMeta);
    }
    if (data.containsKey('planned_sets')) {
      context.handle(
          _plannedSetsMeta,
          plannedSets.isAcceptableOrUnknown(
              data['planned_sets']!, _plannedSetsMeta));
    } else if (isInserting) {
      context.missing(_plannedSetsMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UebungenInPlanData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UebungenInPlanData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      trainingPlanId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}training_plan_id'])!,
      uebungId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}uebung_id'])!,
      trainingPlanName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}training_plan_name'])!,
      uebungName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uebung_name'])!,
      plannedReps: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}planned_reps'])!,
      plannedSets: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}planned_sets'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $UebungenInPlanTable createAlias(String alias) {
    return $UebungenInPlanTable(attachedDatabase, alias);
  }
}

class UebungenInPlanData extends DataClass
    implements Insertable<UebungenInPlanData> {
  final int id;
  final int trainingPlanId;
  final int uebungId;
  final String trainingPlanName;
  final String uebungName;
  final int plannedReps;
  final int plannedSets;
  final DateTime createdAt;
  final DateTime updatedAt;
  const UebungenInPlanData(
      {required this.id,
      required this.trainingPlanId,
      required this.uebungId,
      required this.trainingPlanName,
      required this.uebungName,
      required this.plannedReps,
      required this.plannedSets,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['training_plan_id'] = Variable<int>(trainingPlanId);
    map['uebung_id'] = Variable<int>(uebungId);
    map['training_plan_name'] = Variable<String>(trainingPlanName);
    map['uebung_name'] = Variable<String>(uebungName);
    map['planned_reps'] = Variable<int>(plannedReps);
    map['planned_sets'] = Variable<int>(plannedSets);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  UebungenInPlanCompanion toCompanion(bool nullToAbsent) {
    return UebungenInPlanCompanion(
      id: Value(id),
      trainingPlanId: Value(trainingPlanId),
      uebungId: Value(uebungId),
      trainingPlanName: Value(trainingPlanName),
      uebungName: Value(uebungName),
      plannedReps: Value(plannedReps),
      plannedSets: Value(plannedSets),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory UebungenInPlanData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UebungenInPlanData(
      id: serializer.fromJson<int>(json['id']),
      trainingPlanId: serializer.fromJson<int>(json['trainingPlanId']),
      uebungId: serializer.fromJson<int>(json['uebungId']),
      trainingPlanName: serializer.fromJson<String>(json['trainingPlanName']),
      uebungName: serializer.fromJson<String>(json['uebungName']),
      plannedReps: serializer.fromJson<int>(json['plannedReps']),
      plannedSets: serializer.fromJson<int>(json['plannedSets']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'trainingPlanId': serializer.toJson<int>(trainingPlanId),
      'uebungId': serializer.toJson<int>(uebungId),
      'trainingPlanName': serializer.toJson<String>(trainingPlanName),
      'uebungName': serializer.toJson<String>(uebungName),
      'plannedReps': serializer.toJson<int>(plannedReps),
      'plannedSets': serializer.toJson<int>(plannedSets),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  UebungenInPlanData copyWith(
          {int? id,
          int? trainingPlanId,
          int? uebungId,
          String? trainingPlanName,
          String? uebungName,
          int? plannedReps,
          int? plannedSets,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      UebungenInPlanData(
        id: id ?? this.id,
        trainingPlanId: trainingPlanId ?? this.trainingPlanId,
        uebungId: uebungId ?? this.uebungId,
        trainingPlanName: trainingPlanName ?? this.trainingPlanName,
        uebungName: uebungName ?? this.uebungName,
        plannedReps: plannedReps ?? this.plannedReps,
        plannedSets: plannedSets ?? this.plannedSets,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('UebungenInPlanData(')
          ..write('id: $id, ')
          ..write('trainingPlanId: $trainingPlanId, ')
          ..write('uebungId: $uebungId, ')
          ..write('trainingPlanName: $trainingPlanName, ')
          ..write('uebungName: $uebungName, ')
          ..write('plannedReps: $plannedReps, ')
          ..write('plannedSets: $plannedSets, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      trainingPlanId,
      uebungId,
      trainingPlanName,
      uebungName,
      plannedReps,
      plannedSets,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UebungenInPlanData &&
          other.id == this.id &&
          other.trainingPlanId == this.trainingPlanId &&
          other.uebungId == this.uebungId &&
          other.trainingPlanName == this.trainingPlanName &&
          other.uebungName == this.uebungName &&
          other.plannedReps == this.plannedReps &&
          other.plannedSets == this.plannedSets &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class UebungenInPlanCompanion extends UpdateCompanion<UebungenInPlanData> {
  final Value<int> id;
  final Value<int> trainingPlanId;
  final Value<int> uebungId;
  final Value<String> trainingPlanName;
  final Value<String> uebungName;
  final Value<int> plannedReps;
  final Value<int> plannedSets;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const UebungenInPlanCompanion({
    this.id = const Value.absent(),
    this.trainingPlanId = const Value.absent(),
    this.uebungId = const Value.absent(),
    this.trainingPlanName = const Value.absent(),
    this.uebungName = const Value.absent(),
    this.plannedReps = const Value.absent(),
    this.plannedSets = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  UebungenInPlanCompanion.insert({
    this.id = const Value.absent(),
    required int trainingPlanId,
    required int uebungId,
    required String trainingPlanName,
    required String uebungName,
    required int plannedReps,
    required int plannedSets,
    required DateTime createdAt,
    required DateTime updatedAt,
  })  : trainingPlanId = Value(trainingPlanId),
        uebungId = Value(uebungId),
        trainingPlanName = Value(trainingPlanName),
        uebungName = Value(uebungName),
        plannedReps = Value(plannedReps),
        plannedSets = Value(plannedSets),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<UebungenInPlanData> custom({
    Expression<int>? id,
    Expression<int>? trainingPlanId,
    Expression<int>? uebungId,
    Expression<String>? trainingPlanName,
    Expression<String>? uebungName,
    Expression<int>? plannedReps,
    Expression<int>? plannedSets,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (trainingPlanId != null) 'training_plan_id': trainingPlanId,
      if (uebungId != null) 'uebung_id': uebungId,
      if (trainingPlanName != null) 'training_plan_name': trainingPlanName,
      if (uebungName != null) 'uebung_name': uebungName,
      if (plannedReps != null) 'planned_reps': plannedReps,
      if (plannedSets != null) 'planned_sets': plannedSets,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  UebungenInPlanCompanion copyWith(
      {Value<int>? id,
      Value<int>? trainingPlanId,
      Value<int>? uebungId,
      Value<String>? trainingPlanName,
      Value<String>? uebungName,
      Value<int>? plannedReps,
      Value<int>? plannedSets,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return UebungenInPlanCompanion(
      id: id ?? this.id,
      trainingPlanId: trainingPlanId ?? this.trainingPlanId,
      uebungId: uebungId ?? this.uebungId,
      trainingPlanName: trainingPlanName ?? this.trainingPlanName,
      uebungName: uebungName ?? this.uebungName,
      plannedReps: plannedReps ?? this.plannedReps,
      plannedSets: plannedSets ?? this.plannedSets,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (trainingPlanId.present) {
      map['training_plan_id'] = Variable<int>(trainingPlanId.value);
    }
    if (uebungId.present) {
      map['uebung_id'] = Variable<int>(uebungId.value);
    }
    if (trainingPlanName.present) {
      map['training_plan_name'] = Variable<String>(trainingPlanName.value);
    }
    if (uebungName.present) {
      map['uebung_name'] = Variable<String>(uebungName.value);
    }
    if (plannedReps.present) {
      map['planned_reps'] = Variable<int>(plannedReps.value);
    }
    if (plannedSets.present) {
      map['planned_sets'] = Variable<int>(plannedSets.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UebungenInPlanCompanion(')
          ..write('id: $id, ')
          ..write('trainingPlanId: $trainingPlanId, ')
          ..write('uebungId: $uebungId, ')
          ..write('trainingPlanName: $trainingPlanName, ')
          ..write('uebungName: $uebungName, ')
          ..write('plannedReps: $plannedReps, ')
          ..write('plannedSets: $plannedSets, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $TrainingTable extends Training
    with TableInfo<$TrainingTable, TrainingData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TrainingTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _planIdMeta = const VerificationMeta('planId');
  @override
  late final GeneratedColumn<String> planId = GeneratedColumn<String>(
      'plan_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES trainings_plan (id)'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, planId, createdAt];
  @override
  String get aliasedName => _alias ?? 'training';
  @override
  String get actualTableName => 'training';
  @override
  VerificationContext validateIntegrity(Insertable<TrainingData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('plan_id')) {
      context.handle(_planIdMeta,
          planId.isAcceptableOrUnknown(data['plan_id']!, _planIdMeta));
    } else if (isInserting) {
      context.missing(_planIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TrainingData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TrainingData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      planId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}plan_id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $TrainingTable createAlias(String alias) {
    return $TrainingTable(attachedDatabase, alias);
  }
}

class TrainingData extends DataClass implements Insertable<TrainingData> {
  final int id;
  final String planId;
  final DateTime createdAt;
  const TrainingData(
      {required this.id, required this.planId, required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['plan_id'] = Variable<String>(planId);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  TrainingCompanion toCompanion(bool nullToAbsent) {
    return TrainingCompanion(
      id: Value(id),
      planId: Value(planId),
      createdAt: Value(createdAt),
    );
  }

  factory TrainingData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TrainingData(
      id: serializer.fromJson<int>(json['id']),
      planId: serializer.fromJson<String>(json['planId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'planId': serializer.toJson<String>(planId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  TrainingData copyWith({int? id, String? planId, DateTime? createdAt}) =>
      TrainingData(
        id: id ?? this.id,
        planId: planId ?? this.planId,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('TrainingData(')
          ..write('id: $id, ')
          ..write('planId: $planId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, planId, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TrainingData &&
          other.id == this.id &&
          other.planId == this.planId &&
          other.createdAt == this.createdAt);
}

class TrainingCompanion extends UpdateCompanion<TrainingData> {
  final Value<int> id;
  final Value<String> planId;
  final Value<DateTime> createdAt;
  const TrainingCompanion({
    this.id = const Value.absent(),
    this.planId = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  TrainingCompanion.insert({
    this.id = const Value.absent(),
    required String planId,
    required DateTime createdAt,
  })  : planId = Value(planId),
        createdAt = Value(createdAt);
  static Insertable<TrainingData> custom({
    Expression<int>? id,
    Expression<String>? planId,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (planId != null) 'plan_id': planId,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  TrainingCompanion copyWith(
      {Value<int>? id, Value<String>? planId, Value<DateTime>? createdAt}) {
    return TrainingCompanion(
      id: id ?? this.id,
      planId: planId ?? this.planId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (planId.present) {
      map['plan_id'] = Variable<String>(planId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TrainingCompanion(')
          ..write('id: $id, ')
          ..write('planId: $planId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $UebungenInTrainingTable extends UebungenInTraining
    with TableInfo<$UebungenInTrainingTable, UebungenInTrainingData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UebungenInTrainingTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _trainingIDMeta =
      const VerificationMeta('trainingID');
  @override
  late final GeneratedColumn<int> trainingID = GeneratedColumn<int>(
      'training_i_d', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES training (id)'));
  static const VerificationMeta _uebungsIdMeta =
      const VerificationMeta('uebungsId');
  @override
  late final GeneratedColumn<String> uebungsId = GeneratedColumn<String>(
      'uebungs_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES uebungen (id)'));
  static const VerificationMeta _repsMeta = const VerificationMeta('reps');
  @override
  late final GeneratedColumn<int> reps = GeneratedColumn<int>(
      'reps', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<int> weight = GeneratedColumn<int>(
      'weight', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, trainingID, uebungsId, reps, weight];
  @override
  String get aliasedName => _alias ?? 'uebungen_in_training';
  @override
  String get actualTableName => 'uebungen_in_training';
  @override
  VerificationContext validateIntegrity(
      Insertable<UebungenInTrainingData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('training_i_d')) {
      context.handle(
          _trainingIDMeta,
          trainingID.isAcceptableOrUnknown(
              data['training_i_d']!, _trainingIDMeta));
    } else if (isInserting) {
      context.missing(_trainingIDMeta);
    }
    if (data.containsKey('uebungs_id')) {
      context.handle(_uebungsIdMeta,
          uebungsId.isAcceptableOrUnknown(data['uebungs_id']!, _uebungsIdMeta));
    } else if (isInserting) {
      context.missing(_uebungsIdMeta);
    }
    if (data.containsKey('reps')) {
      context.handle(
          _repsMeta, reps.isAcceptableOrUnknown(data['reps']!, _repsMeta));
    } else if (isInserting) {
      context.missing(_repsMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UebungenInTrainingData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UebungenInTrainingData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      trainingID: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}training_i_d'])!,
      uebungsId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uebungs_id'])!,
      reps: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}reps'])!,
      weight: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}weight'])!,
    );
  }

  @override
  $UebungenInTrainingTable createAlias(String alias) {
    return $UebungenInTrainingTable(attachedDatabase, alias);
  }
}

class UebungenInTrainingData extends DataClass
    implements Insertable<UebungenInTrainingData> {
  final int id;
  final int trainingID;
  final String uebungsId;
  final int reps;
  final int weight;
  const UebungenInTrainingData(
      {required this.id,
      required this.trainingID,
      required this.uebungsId,
      required this.reps,
      required this.weight});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['training_i_d'] = Variable<int>(trainingID);
    map['uebungs_id'] = Variable<String>(uebungsId);
    map['reps'] = Variable<int>(reps);
    map['weight'] = Variable<int>(weight);
    return map;
  }

  UebungenInTrainingCompanion toCompanion(bool nullToAbsent) {
    return UebungenInTrainingCompanion(
      id: Value(id),
      trainingID: Value(trainingID),
      uebungsId: Value(uebungsId),
      reps: Value(reps),
      weight: Value(weight),
    );
  }

  factory UebungenInTrainingData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UebungenInTrainingData(
      id: serializer.fromJson<int>(json['id']),
      trainingID: serializer.fromJson<int>(json['trainingID']),
      uebungsId: serializer.fromJson<String>(json['uebungsId']),
      reps: serializer.fromJson<int>(json['reps']),
      weight: serializer.fromJson<int>(json['weight']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'trainingID': serializer.toJson<int>(trainingID),
      'uebungsId': serializer.toJson<String>(uebungsId),
      'reps': serializer.toJson<int>(reps),
      'weight': serializer.toJson<int>(weight),
    };
  }

  UebungenInTrainingData copyWith(
          {int? id,
          int? trainingID,
          String? uebungsId,
          int? reps,
          int? weight}) =>
      UebungenInTrainingData(
        id: id ?? this.id,
        trainingID: trainingID ?? this.trainingID,
        uebungsId: uebungsId ?? this.uebungsId,
        reps: reps ?? this.reps,
        weight: weight ?? this.weight,
      );
  @override
  String toString() {
    return (StringBuffer('UebungenInTrainingData(')
          ..write('id: $id, ')
          ..write('trainingID: $trainingID, ')
          ..write('uebungsId: $uebungsId, ')
          ..write('reps: $reps, ')
          ..write('weight: $weight')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, trainingID, uebungsId, reps, weight);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UebungenInTrainingData &&
          other.id == this.id &&
          other.trainingID == this.trainingID &&
          other.uebungsId == this.uebungsId &&
          other.reps == this.reps &&
          other.weight == this.weight);
}

class UebungenInTrainingCompanion
    extends UpdateCompanion<UebungenInTrainingData> {
  final Value<int> id;
  final Value<int> trainingID;
  final Value<String> uebungsId;
  final Value<int> reps;
  final Value<int> weight;
  const UebungenInTrainingCompanion({
    this.id = const Value.absent(),
    this.trainingID = const Value.absent(),
    this.uebungsId = const Value.absent(),
    this.reps = const Value.absent(),
    this.weight = const Value.absent(),
  });
  UebungenInTrainingCompanion.insert({
    this.id = const Value.absent(),
    required int trainingID,
    required String uebungsId,
    required int reps,
    required int weight,
  })  : trainingID = Value(trainingID),
        uebungsId = Value(uebungsId),
        reps = Value(reps),
        weight = Value(weight);
  static Insertable<UebungenInTrainingData> custom({
    Expression<int>? id,
    Expression<int>? trainingID,
    Expression<String>? uebungsId,
    Expression<int>? reps,
    Expression<int>? weight,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (trainingID != null) 'training_i_d': trainingID,
      if (uebungsId != null) 'uebungs_id': uebungsId,
      if (reps != null) 'reps': reps,
      if (weight != null) 'weight': weight,
    });
  }

  UebungenInTrainingCompanion copyWith(
      {Value<int>? id,
      Value<int>? trainingID,
      Value<String>? uebungsId,
      Value<int>? reps,
      Value<int>? weight}) {
    return UebungenInTrainingCompanion(
      id: id ?? this.id,
      trainingID: trainingID ?? this.trainingID,
      uebungsId: uebungsId ?? this.uebungsId,
      reps: reps ?? this.reps,
      weight: weight ?? this.weight,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (trainingID.present) {
      map['training_i_d'] = Variable<int>(trainingID.value);
    }
    if (uebungsId.present) {
      map['uebungs_id'] = Variable<String>(uebungsId.value);
    }
    if (reps.present) {
      map['reps'] = Variable<int>(reps.value);
    }
    if (weight.present) {
      map['weight'] = Variable<int>(weight.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UebungenInTrainingCompanion(')
          ..write('id: $id, ')
          ..write('trainingID: $trainingID, ')
          ..write('uebungsId: $uebungsId, ')
          ..write('reps: $reps, ')
          ..write('weight: $weight')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  late final $UsersTable users = $UsersTable(this);
  late final $FriendsTable friends = $FriendsTable(this);
  late final $MessagesTable messages = $MessagesTable(this);
  late final $TrainingsPlanTable trainingsPlan = $TrainingsPlanTable(this);
  late final $UebungenTable uebungen = $UebungenTable(this);
  late final $UebungenInPlanTable uebungenInPlan = $UebungenInPlanTable(this);
  late final $TrainingTable training = $TrainingTable(this);
  late final $UebungenInTrainingTable uebungenInTraining =
      $UebungenInTrainingTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        users,
        friends,
        messages,
        trainingsPlan,
        uebungen,
        uebungenInPlan,
        training,
        uebungenInTraining
      ];
}
