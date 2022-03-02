import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'topup_transaction_record.g.dart';

abstract class TopupTransactionRecord
    implements Built<TopupTransactionRecord, TopupTransactionRecordBuilder> {
  static Serializer<TopupTransactionRecord> get serializer =>
      _$topupTransactionRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  String get status;

  @nullable
  double get amount;

  @nullable
  @BuiltValueField(wireName: 'transaction_id')
  String get transactionId;

  @nullable
  DocumentReference get user;

  @nullable
  @BuiltValueField(wireName: 'grand_total')
  double get grandTotal;

  @nullable
  @BuiltValueField(wireName: 'cash_agent')
  DocumentReference get cashAgent;

  @nullable
  @BuiltValueField(wireName: 'transfer_time')
  DateTime get transferTime;

  @nullable
  @BuiltValueField(wireName: 'user_display_name')
  String get userDisplayName;

  @nullable
  @BuiltValueField(wireName: 'cash_agent_display_name')
  String get cashAgentDisplayName;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TopupTransactionRecordBuilder builder) =>
      builder
        ..status = ''
        ..amount = 0.0
        ..transactionId = ''
        ..grandTotal = 0.0
        ..userDisplayName = ''
        ..cashAgentDisplayName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('topup_transaction');

  static Stream<TopupTransactionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<TopupTransactionRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  TopupTransactionRecord._();
  factory TopupTransactionRecord(
          [void Function(TopupTransactionRecordBuilder) updates]) =
      _$TopupTransactionRecord;

  static TopupTransactionRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTopupTransactionRecordData({
  DateTime createdTime,
  String status,
  double amount,
  String transactionId,
  DocumentReference user,
  double grandTotal,
  DocumentReference cashAgent,
  DateTime transferTime,
  String userDisplayName,
  String cashAgentDisplayName,
}) =>
    serializers.toFirestore(
        TopupTransactionRecord.serializer,
        TopupTransactionRecord((t) => t
          ..createdTime = createdTime
          ..status = status
          ..amount = amount
          ..transactionId = transactionId
          ..user = user
          ..grandTotal = grandTotal
          ..cashAgent = cashAgent
          ..transferTime = transferTime
          ..userDisplayName = userDisplayName
          ..cashAgentDisplayName = cashAgentDisplayName));
