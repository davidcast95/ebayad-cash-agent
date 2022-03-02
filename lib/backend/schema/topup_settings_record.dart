import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'topup_settings_record.g.dart';

abstract class TopupSettingsRecord
    implements Built<TopupSettingsRecord, TopupSettingsRecordBuilder> {
  static Serializer<TopupSettingsRecord> get serializer =>
      _$topupSettingsRecordSerializer;

  @nullable
  BuiltList<double> get amounts;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TopupSettingsRecordBuilder builder) =>
      builder..amounts = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('topup_settings');

  static Stream<TopupSettingsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<TopupSettingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  TopupSettingsRecord._();
  factory TopupSettingsRecord(
          [void Function(TopupSettingsRecordBuilder) updates]) =
      _$TopupSettingsRecord;

  static TopupSettingsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTopupSettingsRecordData() => serializers.toFirestore(
    TopupSettingsRecord.serializer,
    TopupSettingsRecord((t) => t..amounts = null));
