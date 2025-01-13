import 'dart:convert';
import 'package:tools_rental_management/domain/entities/toolarticle_entity.dart';

// this data class / data model will hold information about a tool gotten from a remote source.

// Reminder:
// i should convert the ToolArticleModel field data type to there corresponding atomic data type(indivisible), which is format that can be persisted in the sqlite database.
// The converted data type should match the DBMS, in this case its sqlite.

class ToolArticleModel {
  final String title;
  // where the data is coming from about this tool.
  final String source;
  // a short description about the tool.
  final String description;
  // a slice of information about the tool.
  final String excerpt;
  // url tool image path or null if the image doesn't exist
  final String? urlImagePath;
  // time this [ToolInfo] was fetched from remote source.
  final DateTime fetchedAt;

  ToolArticleModel({
    required this.title,
    required this.source,
    required this.description,
    required this.excerpt,
    required this.urlImagePath,
    required this.fetchedAt,
  });

  factory ToolArticleModel.fromEntity(ToolArticleEntity toolArticleEntity) {
    return ToolArticleModel(
        title: toolArticleEntity.title,
        source: toolArticleEntity.source,
        description: toolArticleEntity.description,
        excerpt: toolArticleEntity.excerpt,
        urlImagePath: toolArticleEntity.urlImagePath,
        fetchedAt: toolArticleEntity.fetchedAt);
  }

  factory ToolArticleModel.fromJson({required String jsonString}) {
    Map<String, dynamic> toolInfoMap = json.decode(jsonString);
    return ToolArticleModel.fromMap(toolInfoMap: toolInfoMap);
  }

  factory ToolArticleModel.fromMap(
      {required Map<String, dynamic> toolInfoMap}) {
    return ToolArticleModel(
      title: toolInfoMap['title'],
      source: toolInfoMap['source'],
      description: toolInfoMap['description'],
      excerpt: toolInfoMap['excerpt'],
      urlImagePath: toolInfoMap['urlImagePath'],
      fetchedAt: DateTime.fromMillisecondsSinceEpoch(toolInfoMap['fetchedAt']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'source': source,
      'description': description,
      'excerpt': excerpt,
      'urlImagePath': urlImagePath,
      'fetchedAt': fetchedAt.millisecondsSinceEpoch,
    };
  }

  String toJson() {
    final String toolInfoJsonString = json.encode(toMap());
    return toolInfoJsonString;
  }

  @override
  bool operator ==(Object other) {
    return (other is ToolArticleModel &&
        title == other.title &&
        source == other.source &&
        description == other.description &&
        excerpt == other.excerpt &&
        urlImagePath == other.urlImagePath &&
        fetchedAt == other.fetchedAt);
  }

  @override
  int get hashCode => (title.hashCode ^
      source.hashCode ^
      description.hashCode ^
      excerpt.hashCode ^
      urlImagePath.hashCode ^
      fetchedAt.hashCode);

  ToolArticleEntity toEntity() {
    return ToolArticleEntity(
      title: title,
      source: source,
      description: description,
      excerpt: excerpt,
      urlImagePath: urlImagePath,
      fetchedAt: fetchedAt,
    );
  }

  @override
  String toString() {
    return """ ToolArticleModel: {
      name: $title 
      source: $source 
      description: $description 
      excerpt: $excerpt
      urlImagePath: $urlImagePath
      fetchedAt: ${fetchedAt.millisecondsSinceEpoch}
    }
    """;
  }
}
