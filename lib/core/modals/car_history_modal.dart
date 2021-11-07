import 'package:carmeleon/aspects/enum/body_enum.dart';
import 'package:json_annotation/json_annotation.dart';

part 'car_history_modal.g.dart';

@JsonSerializable()
class CarHistoryData {
  CarEnum? bodyPart;
  String? colorCode;

  CarHistoryData({required this.colorCode, required this.bodyPart});

  factory CarHistoryData.fromJson(Map<String, dynamic> json) =>
      _$CarHistoryDataFromJson(json);

  Map<String, dynamic> toJson() => _$CarHistoryDataToJson(this);
}
