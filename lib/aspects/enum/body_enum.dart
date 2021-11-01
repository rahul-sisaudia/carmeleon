enum CarEnum { carBody, carRim }

extension BodyEnumExtension on CarEnum {
  String? get part {
    switch (this) {
      case CarEnum.carBody:
        return 'Body';
      case CarEnum.carRim:
        return 'Rim';
      default:
        return null;
    }
  }
}
