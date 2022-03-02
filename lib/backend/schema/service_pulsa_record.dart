import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'service_pulsa_record.g.dart';

abstract class ServicePulsaRecord
    implements Built<ServicePulsaRecord, ServicePulsaRecordBuilder> {
  static Serializer<ServicePulsaRecord> get serializer =>
      _$servicePulsaRecordSerializer;

  @nullable
  double get amount;

  @nullable
  double get price;

  @nullable
  @BuiltValueField(wireName: 'update_at')
  DateTime get updateAt;

  @nullable
  @BuiltValueField(wireName: 'convenience_fee')
  double get convenienceFee;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ServicePulsaRecordBuilder builder) => builder
    ..amount = 0.0
    ..price = 0.0
    ..convenienceFee = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('service_pulsa');

  static Stream<ServicePulsaRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ServicePulsaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  ServicePulsaRecord._();
  factory ServicePulsaRecord(
          [void Function(ServicePulsaRecordBuilder) updates]) =
      _$ServicePulsaRecord;

  static ServicePulsaRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createServicePulsaRecordData({
  double amount,
  double price,
  DateTime updateAt,
  double convenienceFee,
}) =>
    serializers.toFirestore(
        ServicePulsaRecord.serializer,
        ServicePulsaRecord((s) => s
          ..amount = amount
          ..price = price
          ..updateAt = updateAt
          ..convenienceFee = convenienceFee));
