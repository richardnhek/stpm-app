import '../database.dart';

class WhitelistUsersTable extends SupabaseTable<WhitelistUsersRow> {
  @override
  String get tableName => 'whitelist_users';

  @override
  WhitelistUsersRow createRow(Map<String, dynamic> data) =>
      WhitelistUsersRow(data);
}

class WhitelistUsersRow extends SupabaseDataRow {
  WhitelistUsersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => WhitelistUsersTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get bio => getField<String>('bio');
  set bio(String? value) => setField<String>('bio', value);

  bool? get isWhitelist => getField<bool>('is_whitelist');
  set isWhitelist(bool? value) => setField<bool>('is_whitelist', value);

  String? get displayName => getField<String>('display_name');
  set displayName(String? value) => setField<String>('display_name', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get photoUrl => getField<String>('photo_url');
  set photoUrl(String? value) => setField<String>('photo_url', value);

  String? get phoneNumber => getField<String>('phone_number');
  set phoneNumber(String? value) => setField<String>('phone_number', value);

  DateTime? get lastActiveTime => getField<DateTime>('last_active_time');
  set lastActiveTime(DateTime? value) =>
      setField<DateTime>('last_active_time', value);

  bool? get isProfileCreated => getField<bool>('is_profile_created');
  set isProfileCreated(bool? value) =>
      setField<bool>('is_profile_created', value);
}
