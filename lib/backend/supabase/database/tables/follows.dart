import '../database.dart';

class FollowsTable extends SupabaseTable<FollowsRow> {
  @override
  String get tableName => 'follows';

  @override
  FollowsRow createRow(Map<String, dynamic> data) => FollowsRow(data);
}

class FollowsRow extends SupabaseDataRow {
  FollowsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FollowsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get follower => getField<String>('follower');
  set follower(String? value) => setField<String>('follower', value);

  String? get whitelistUserFollowers =>
      getField<String>('whitelist_user_followers');
  set whitelistUserFollowers(String? value) =>
      setField<String>('whitelist_user_followers', value);

  String? get whitelistUser => getField<String>('whitelist_user');
  set whitelistUser(String? value) => setField<String>('whitelist_user', value);
}
