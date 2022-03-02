import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'transaction_record.g.dart';

abstract class TransactionRecord
    implements Built<TransactionRecord, TransactionRecordBuilder> {
  static Serializer<TransactionRecord> get serializer =>
      _$transactionRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'service_type')
  String get serviceType;

  @nullable
  @BuiltValueField(wireName: 'grand_total')
  double get grandTotal;

  @nullable
  String get status;

  @nullable
  String get id;

  @nullable
  @BuiltValueField(wireName: 'mobile_no')
  String get mobileNo;

  @nullable
  @BuiltValueField(wireName: 'update_at')
  DateTime get updateAt;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'payment_method')
  String get paymentMethod;

  @nullable
  double get subtotal;

  @nullable
  @BuiltValueField(wireName: 'convenience_fee')
  double get convenienceFee;

  @nullable
  String get product;

  @nullable
  DocumentReference get user;

  @nullable
  @BuiltValueField(wireName: 'paid_on')
  DateTime get paidOn;

  @nullable
  @BuiltValueField(wireName: 'biller_code')
  String get billerCode;

  @nullable
  @BuiltValueField(wireName: 'full_name')
  String get fullName;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TransactionRecordBuilder builder) => builder
    ..serviceType = ''
    ..grandTotal = 0.0
    ..status = ''
    ..id = ''
    ..mobileNo = ''
    ..paymentMethod = ''
    ..subtotal = 0.0
    ..convenienceFee = 0.0
    ..product = ''
    ..billerCode = ''
    ..fullName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('transaction');

  static Stream<TransactionRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<TransactionRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  TransactionRecord._();
  factory TransactionRecord([void Function(TransactionRecordBuilder) updates]) =
      _$TransactionRecord;

  static TransactionRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTransactionRecordData({
  String serviceType,
  double grandTotal,
  String status,
  String id,
  String mobileNo,
  DateTime updateAt,
  DateTime createdTime,
  String paymentMethod,
  double subtotal,
  double convenienceFee,
  String product,
  DocumentReference user,
  DateTime paidOn,
  String billerCode,
  String fullName,
}) =>
    serializers.toFirestore(
        TransactionRecord.serializer,
        TransactionRecord((t) => t
          ..serviceType = serviceType
          ..grandTotal = grandTotal
          ..status = status
          ..id = id
          ..mobileNo = mobileNo
          ..updateAt = updateAt
          ..createdTime = createdTime
          ..paymentMethod = paymentMethod
          ..subtotal = subtotal
          ..convenienceFee = convenienceFee
          ..product = product
          ..user = user
          ..paidOn = paidOn
          ..billerCode = billerCode
          ..fullName = fullName));
