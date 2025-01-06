import 'package:tools_rental_management/enums/category.dart';
import 'package:tools_rental_management/enums/currency.dart';
import 'package:tools_rental_management/enums/status.dart';

class ToolEntity {
  final int? toolId;
  final String name;
  final DateTime boughtAt;
  final int purchasedPrice;
  final int rate;
  final int rentCount;
  final Currency currency;
  final Category category;
  final String toolImagePath;
  final int toolUniqueId;
  final int? toolUserId;
  final Status status;

  /// should be called when when constructing a new tool from the old one by calling [copyWith] method.
  ToolEntity({
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

  // excluded toolId because we don't what [copyWith] to accidentally be called with toolId
  // that might later conflict with another tool that might end up having the same toolId.
  ToolEntity copyWith({
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
    return ToolEntity(
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
      toolUserId: toolUserId ?? this.toolUserId,
      status: status ?? this.status,
    );
  }

  @override
  bool operator ==(Object other) {
    return (other is ToolEntity &&
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
    return """ToolEntity: {
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
