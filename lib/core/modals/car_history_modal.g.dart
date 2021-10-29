// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_history_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarHistoryData _$CarHistoryDataFromJson(Map<String, dynamic> json) =>
    CarHistoryData(
      colorCode: json['colorCode'] as String,
      bodyPart: json['bodyPart'],
    );

Map<String, dynamic> _$CarHistoryDataToJson(CarHistoryData instance) =>
    <String, dynamic>{
      'bodyPart': instance.bodyPart,
      'colorCode': instance.colorCode,
    };
