import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'merchants_record.g.dart';

abstract class MerchantsRecord
    implements Built<MerchantsRecord, MerchantsRecordBuilder> {
  static Serializer<MerchantsRecord> get serializer =>
      _$merchantsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'business_name')
  String get businessName;

  @nullable
  @BuiltValueField(wireName: 'business_image')
  String get businessImage;

  @nullable
  DocumentReference get user;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(MerchantsRecordBuilder builder) => builder
    ..businessName = ''
    ..businessImage = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('merchants');

  static Stream<MerchantsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<MerchantsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  MerchantsRecord._();
  factory MerchantsRecord([void Function(MerchantsRecordBuilder) updates]) =
      _$MerchantsRecord;

  static MerchantsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createMerchantsRecordData({
  String businessName,
  String businessImage,
  DocumentReference user,
}) =>
    serializers.toFirestore(
        MerchantsRecord.serializer,
        MerchantsRecord((m) => m
          ..businessName = businessName
          ..businessImage = businessImage
          ..user = user));
