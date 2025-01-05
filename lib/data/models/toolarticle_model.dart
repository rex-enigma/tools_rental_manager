// this data class / data model will hold information about a tool gotten from a remote source.

import 'dart:convert';

class ToolArticle {
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

  ToolArticle({
    required this.title,
    required this.source,
    required this.description,
    required this.excerpt,
    required this.urlImagePath,
    required this.fetchedAt,
  });

  factory ToolArticle.fromJson({required String jsonString}) {
    Map<String, dynamic> toolInfoMap = json.decode(jsonString);
    return ToolArticle.fromMap(toolInfoMap: toolInfoMap);
  }

  factory ToolArticle.fromMap({required Map<String, dynamic> toolInfoMap}) {
    return ToolArticle(
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
    return (other is ToolArticle &&
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

  @override
  String toString() {
    return """ ToolInfo: {
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
