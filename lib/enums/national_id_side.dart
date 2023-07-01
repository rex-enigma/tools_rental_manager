/// can either be: NationalIdSide.front or NationalIdSide.back
enum NationalIdSide {
  front,
  back;

  /// convert a string value to its corresponding enum constant value.
  /// the argument to be passed MUST either be : `front` string value or `back` string value,
  /// any other string values will cause an [Error] to be throw.
  static NationalIdSide fromString(String value) {
    switch (value) {
      case 'front':
        return NationalIdSide.front;
      case 'back':
        return NationalIdSide.back;
      default:
        throw "the string: {$value}, doesn't correspond to any NationalIdSide constant value";
    }
  }
}
