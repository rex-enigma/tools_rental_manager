class ToolArticleEntity {
  final String title;
  final String source;
  final String description;
  final String excerpt;
  final String? urlImagePath;
  final DateTime fetchedAt;

  ToolArticleEntity({
    required this.title,
    required this.source,
    required this.description,
    required this.excerpt,
    required this.urlImagePath,
    required this.fetchedAt,
  });

  @override
  bool operator ==(Object other) {
    return (other is ToolArticleEntity &&
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
    return """ ToolArticleEntity: {
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
