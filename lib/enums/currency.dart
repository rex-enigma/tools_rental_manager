/// can be either: Currency.kes or Currency.usd
enum Currency {
  kes,
  usd;

  /// convert a string value to its corresponding enum constant value.
  /// the argument to be passed MUST be either: `kes` string value or `usd` string value,
  /// any other string values will cause an [Error] to be throw.
  static Currency fromString(String value) {
    switch (value) {
      case 'kes':
        return Currency.kes;
      case 'usd':
        return Currency.usd;
      default:
        throw "the string: {$value} doesn't correspond to any Currency constant value";
    }
  }
}
