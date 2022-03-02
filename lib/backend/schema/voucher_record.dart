import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'voucher_record.g.dart';

abstract class VoucherRecord
    implements Built<VoucherRecord, VoucherRecordBuilder> {
  static Serializer<VoucherRecord> get serializer => _$voucherRecordSerializer;

  @nullable
  String get title;

  @nullable
  @BuiltValueField(wireName: 'small_description')
  String get smallDescription;

  @nullable
  String get code;

  @nullable
  @BuiltValueField(wireName: 'valid_from')
  DateTime get validFrom;

  @nullable
  @BuiltValueField(wireName: 'valid_till')
  DateTime get validTill;

  @nullable
  @BuiltValueField(wireName: 'term_and_conditions')
  BuiltList<String> get termAndConditions;

  @nullable
  @BuiltValueField(wireName: 'minimum_transaction')
  double get minimumTransaction;

  @nullable
  @BuiltValueField(wireName: 'discount_type')
  String get discountType;

  @nullable
  @BuiltValueField(wireName: 'discount_amount')
  double get discountAmount;

  @nullable
  @BuiltValueField(wireName: 'maximum_discount')
  double get maximumDiscount;

  @nullable
  @BuiltValueField(wireName: 'update_at')
  DateTime get updateAt;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(VoucherRecordBuilder builder) => builder
    ..title = ''
    ..smallDescription = ''
    ..code = ''
    ..termAndConditions = ListBuilder()
    ..minimumTransaction = 0.0
    ..discountType = ''
    ..discountAmount = 0.0
    ..maximumDiscount = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('voucher');

  static Stream<VoucherRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<VoucherRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  VoucherRecord._();
  factory VoucherRecord([void Function(VoucherRecordBuilder) updates]) =
      _$VoucherRecord;

  static VoucherRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createVoucherRecordData({
  String title,
  String smallDescription,
  String code,
  DateTime validFrom,
  DateTime validTill,
  double minimumTransaction,
  String discountType,
  double discountAmount,
  double maximumDiscount,
  DateTime updateAt,
}) =>
    serializers.toFirestore(
        VoucherRecord.serializer,
        VoucherRecord((v) => v
          ..title = title
          ..smallDescription = smallDescription
          ..code = code
          ..validFrom = validFrom
          ..validTill = validTill
          ..termAndConditions = null
          ..minimumTransaction = minimumTransaction
          ..discountType = discountType
          ..discountAmount = discountAmount
          ..maximumDiscount = maximumDiscount
          ..updateAt = updateAt));
