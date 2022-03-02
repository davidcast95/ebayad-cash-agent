import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'merchant_transaction_record.g.dart';

abstract class MerchantTransactionRecord
    implements
        Built<MerchantTransactionRecord, MerchantTransactionRecordBuilder> {
  static Serializer<MerchantTransactionRecord> get serializer =>
      _$merchantTransactionRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  DocumentReference get merchant;

  @nullable
  @BuiltValueField(wireName: 'business_name')
  String get businessName;

  @nullable
  @BuiltValueField(wireName: 'business_image')
  String get businessImage;

  @nullable
  double get amount;

  @nullable
  DocumentReference get requester;

  @nullable
  String get status;

  @nullable
  String get id;

  @nullable
  DocumentReference get payer;

  @nullable
  @BuiltValueField(wireName: 'paid_on')
  DateTime get paidOn;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(MerchantTransactionRecordBuilder builder) =>
      builder
        ..businessName = ''
        ..businessImage = ''
        ..amount = 0.0
        ..status = ''
        ..id = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('merchant_transaction');

  static Stream<MerchantTransactionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<MerchantTransactionRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  MerchantTransactionRecord._();
  factory MerchantTransactionRecord(
          [void Function(MerchantTransactionRecordBuilder) updates]) =
      _$MerchantTransactionRecord;

  static MerchantTransactionRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createMerchantTransactionRecordData({
  DateTime createdTime,
  DocumentReference merchant,
  String businessName,
  String businessImage,
  double amount,
  DocumentReference requester,
  String status,
  String id,
  DocumentReference payer,
  DateTime paidOn,
}) =>
    serializers.toFirestore(
        MerchantTransactionRecord.serializer,
        MerchantTransactionRecord((m) => m
          ..createdTime = createdTime
          ..merchant = merchant
          ..businessName = businessName
          ..businessImage = businessImage
          ..amount = amount
          ..requester = requester
          ..status = status
          ..id = id
          ..payer = payer
          ..paidOn = paidOn));
