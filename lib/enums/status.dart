/// can be either one of: `Status.idle`, `Status.beingUsed`, `Status.underMaintenance` or `Status.retired`
enum Status {
  idle,
  beingUsed,
  underMaintenance,
  retired;

  /// convert a string value to its corresponding enum constant value.
  /// the argument passed MUST be either: `idle` string value, `beingUsed` string value,
  /// `underMaintenance` string value or `retired` string value, any other string values
  ///  will cause an [Exception] to be throw.
  static Status fromString(String value) {
    switch (value) {
      case 'idle':
        return Status.idle;
      case 'beingUsed':
        return Status.beingUsed;
      case 'underMaintenance':
        return Status.underMaintenance;
      case 'retired':
        return Status.retired;
      default:
        throw Exception("the string: {$value} doesn't correspond to any Status constant value");
    }
  }
}
