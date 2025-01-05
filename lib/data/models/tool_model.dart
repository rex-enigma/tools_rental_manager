import 'package:tools_rental_management/enums/category.dart';
import 'package:tools_rental_management/enums/currency.dart';
import 'package:tools_rental_management/enums/status.dart';

class ToolModel {
  /// its only null when creating a new tool that need to be inserted to the database.
  /// But when constructing this tool from a database record, [toolId] should have a non-null value
  /// uniquely identifies a tool in the database (primary key)
  final int? toolId;
  final String name;

  /// the date this tool was bought.
  /// since sqlite does't support [DateTime] data type, when inserted to the database, we shall convert
  /// it into milliseconds which will be of type integer which sqlite support.
  final DateTime boughtAt;

  /// how much this tool was purchased for.
  final int purchasedPrice;

  /// how much this tool will cost to rent out per hour.
  final int rate;

  /// how many times this tool has been rented.
  final int rentCount;
  final Currency currency;
  final Category category;

  /// path to where the tool image is stored.
  final String toolImagePath;

  /// id that uniquely identifies this tool in the warehouse store.
  final int toolUniqueId;

  /// a foreign key that reference a tool user currently using this tool.
  final int? toolUserId;
  final Status status;

  /// should be called when when constructing a new tool from the old one by calling [copyWith] method.
  ToolModel({
    required this.toolId,
    required this.name,
    required this.boughtAt,
    required this.purchasedPrice,
    required this.rate,
    required this.rentCount,
    required this.currency,
    required this.category,
    required this.toolImagePath,
    required this.toolUniqueId,
    required this.toolUserId,
    required this.status,
  });

  /// should be called when this tool wants to be inserted to the database.
  ToolModel.insert({
    this.toolId,
    required this.name,
    required this.boughtAt,
    required this.purchasedPrice,
    required this.rate,
    this.rentCount = 0,
    required this.currency,
    required this.category,
    required this.toolImagePath,
    required this.toolUniqueId,
    this.toolUserId,
    this.status = Status.idle,
  });

  /// should be called when this tool is constructed from a database record.
  ToolModel.fromMap({required Map<String, dynamic> toolMap})
      : toolId = toolMap['tool_id'],
        name = toolMap['name'],
        boughtAt = DateTime.fromMillisecondsSinceEpoch(toolMap['bought_at']),
        purchasedPrice = toolMap['purchased_price'],
        rate = toolMap['rate'],
        rentCount = toolMap['rent_count'],
        currency = Currency.fromString(toolMap['currency']),
        category = Category.fromString(toolMap['category']),
        toolImagePath = toolMap['tool_image_path'],
        toolUniqueId = toolMap['tool_unique_id'],
        toolUserId = toolMap['tool_user_id'],
        status = Status.fromString(toolMap['status']);

  // excluded toolId because we don't what [copyWith] to accidentally be called with toolId
  // that might later conflict with another tool that might end up having the same toolId.
  ToolModel copyWith({
    String? name,
    DateTime? boughtAt,
    int? purchasedPrice,
    int? rate,
    int? rentCount,
    Currency? currency,
    Category? category,
    String? toolImagePath,
    int? toolUniqueId,
    int? toolUserId,
    Status? status,
  }) {
    return ToolModel(
      toolId: toolId,
      name: name ?? this.name,
      boughtAt: boughtAt ?? this.boughtAt,
      purchasedPrice: purchasedPrice ?? this.purchasedPrice,
      rate: rate ?? this.rate,
      rentCount: rentCount ?? this.rentCount,
      currency: currency ?? this.currency,
      category: category ?? this.category,
      toolImagePath: toolImagePath ?? this.toolImagePath,
      toolUniqueId: toolUniqueId ?? this.toolUniqueId,
      toolUserId: toolUserId,
      status: status ?? this.status,
    );
  }

  @override
  bool operator ==(Object other) {
    return (other is ToolModel &&
        toolId == other.toolId &&
        name == other.name &&
        boughtAt == other.boughtAt &&
        purchasedPrice == other.purchasedPrice &&
        rate == other.rate &&
        rentCount == other.rentCount &&
        currency == other.currency &&
        category == other.category &&
        toolImagePath == other.toolImagePath &&
        toolUniqueId == other.toolUniqueId &&
        toolUserId == other.toolUserId &&
        status == other.status);
  }

  @override
  int get hashCode => (toolId.hashCode ^
      name.hashCode ^
      boughtAt.hashCode ^
      purchasedPrice.hashCode ^
      rate.hashCode ^
      rentCount.hashCode ^
      currency.hashCode ^
      category.hashCode ^
      toolImagePath.hashCode ^
      toolUniqueId.hashCode ^
      toolUserId.hashCode ^
      status.hashCode);

  @override
  String toString() {
    return """Tool: {
      toolId: $toolId 
      name: $name 
      boughtAt: $boughtAt 
      purchasedPrice: $purchasedPrice 
      rate: $rate 
      rentCount: $rentCount 
      currency : ${currency.name} 
      category: ${category.name} 
      imagePath: $toolImagePath 
      toolUniqueId: $toolUniqueId 
      toolUserId: $toolUserId 
      status: ${status.name}
    }""";
  }
}
