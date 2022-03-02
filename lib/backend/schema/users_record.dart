import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  @BuiltValueField(wireName: 'current_balance')
  double get currentBalance;

  @nullable
  String get status;

  @nullable
  @BuiltValueField(wireName: 'security_code')
  String get securityCode;

  @nullable
  @BuiltValueField(wireName: 'selfie_with_id_card')
  String get selfieWithIdCard;

  @nullable
  @BuiltValueField(wireName: 'id_card_image')
  String get idCardImage;

  @nullable
  @BuiltValueField(wireName: 'id_card')
  String get idCard;

  @nullable
  BuiltList<String> get roles;

  @nullable
  DocumentReference get merchant;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..currentBalance = 0.0
    ..status = ''
    ..securityCode = ''
    ..selfieWithIdCard = ''
    ..idCardImage = ''
    ..idCard = ''
    ..roles = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createUsersRecordData({
  String email,
  String displayName,
  String photoUrl,
  String uid,
  DateTime createdTime,
  String phoneNumber,
  double currentBalance,
  String status,
  String securityCode,
  String selfieWithIdCard,
  String idCardImage,
  String idCard,
  DocumentReference merchant,
}) =>
    serializers.toFirestore(
        UsersRecord.serializer,
        UsersRecord((u) => u
          ..email = email
          ..displayName = displayName
          ..photoUrl = photoUrl
          ..uid = uid
          ..createdTime = createdTime
          ..phoneNumber = phoneNumber
          ..currentBalance = currentBalance
          ..status = status
          ..securityCode = securityCode
          ..selfieWithIdCard = selfieWithIdCard
          ..idCardImage = idCardImage
          ..idCard = idCard
          ..roles = null
          ..merchant = merchant));
