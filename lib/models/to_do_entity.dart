class ToDoEntity {
  final String title;
  final String? description;
  bool isFavorite;
  bool isDone;

  ToDoEntity({
    required this.title,
    this.description,
    this.isFavorite = false,
    this.isDone = false,
  });
}
