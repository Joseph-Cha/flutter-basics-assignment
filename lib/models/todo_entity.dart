/// Immutable data model representing a todo task
class TodoEntity {
  final String title;
  final String? description;
  final bool isFavorite;
  final bool isDone;

  const TodoEntity({
    required this.title,
    this.description,
    this.isFavorite = false,
    this.isDone = false,
  });

  /// Creates a copy of this TodoEntity with the given fields replaced with new values
  TodoEntity copyWith({
    String? title,
    String? description,
    bool? isFavorite,
    bool? isDone,
  }) {
    return TodoEntity(
      title: title ?? this.title,
      description: description ?? this.description,
      isFavorite: isFavorite ?? this.isFavorite,
      isDone: isDone ?? this.isDone,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoEntity &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          description == other.description &&
          isFavorite == other.isFavorite &&
          isDone == other.isDone;

  @override
  int get hashCode =>
      title.hashCode ^
      description.hashCode ^
      isFavorite.hashCode ^
      isDone.hashCode;
}
