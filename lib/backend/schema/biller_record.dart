import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'biller_record.g.dart';

abstract class BillerRecord
    implements Built<BillerRecord, BillerRecordBuilder> {
  static Serializer<BillerRecord> get serializer => _$billerRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'biller_code')
  String get billerCode;

  @nullable
  String get type;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'full_name')
  String get fullName;

  @nullable
  String get period;

  @nullable
  @BuiltValueField(wireName: 'period_time')
  DateTime get periodTime;

  @nullable
  double get amount;

  @nullable
  @BuiltValueField(wireName: 'convenience_fee')
  double get convenienceFee;

  @nullable
  String get status;

  @nullable
  @BuiltValueField(wireName: 'paid_on')
  DateTime get paidOn;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(BillerRecordBuilder builder) => builder
    ..billerCode = ''
    ..type = ''
    ..fullName = ''
    ..period = ''
    ..amount = 0.0
    ..convenienceFee = 0.0
    ..status = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('biller');

  static Stream<BillerRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<BillerRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  BillerRecord._();
  factory BillerRecord([void Function(BillerRecordBuilder) updates]) =
      _$BillerRecord;

  static BillerRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createBillerRecordData({
  String billerCode,
  String type,
  DateTime createdTime,
  String fullName,
  String period,
  DateTime periodTime,
  double amount,
  double convenienceFee,
  String status,
  DateTime paidOn,
}) =>
    serializers.toFirestore(
        BillerRecord.serializer,
        BillerRecord((b) => b
          ..billerCode = billerCode
          ..type = type
          ..createdTime = createdTime
          ..fullName = fullName
          ..period = period
          ..periodTime = periodTime
          ..amount = amount
          ..convenienceFee = convenienceFee
          ..status = status
          ..paidOn = paidOn));
