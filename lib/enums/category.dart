/// can be either: Category.poweredTool or Category.unPoweredTool
enum Category {
  poweredTool,
  unPoweredTool;

  /// convert a string value to its corresponding enum constant value.
  /// the argument to be passed MUST be either: `poweredTool` string value or `unPoweredTool` string value,
  /// any other string values will cause an [Error] to be throw.
  static Category fromString(String value) {
    switch (value) {
      case 'poweredTool':
        return Category.poweredTool;
      case 'unPoweredTool':
        return Category.unPoweredTool;
      default:
        throw "the string: {$value} doesn't correspond to any Category constant value";
    }
  }
}
