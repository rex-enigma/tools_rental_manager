/// can be either: Category.poweredTool or Category.unpoweredTool
enum Category {
  poweredTool,
  unpoweredTool;

  /// convert a string value to its corresponding enum constant value.
  /// the argument to be passed MUST be either: `poweredTool` string value or `unpoweredTool` string value,
  /// any other string values will cause an [Error] to be throw.
  static Category fromString(String value) {
    switch (value) {
      case 'poweredTool':
        return Category.poweredTool;
      case 'unPoweredTool':
        return Category.unpoweredTool;
      default:
        throw "the string: {$value}, doesn't correspond to any Category constant value";
    }
  }
}
