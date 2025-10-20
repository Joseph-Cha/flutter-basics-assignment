import 'package:flutter/material.dart';
import 'package:tasks/models/to_do_entity.dart';

class AddTaskBottomSheet extends StatefulWidget {
  final void Function(ToDoEntity) onAddTodo;

  const AddTaskBottomSheet({super.key, required this.onAddTodo});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _detailController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isFavorite = false;
  bool _isDetail = false;
  bool _isFilledTitle = false;

  @override
  void initState() {
    super.initState();
    // 키보드가 자동으로 나타나도록 포커스 설정
    Future.delayed(Duration(milliseconds: 100), () {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _detailController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _saveTask() {
    if (_titleController.text.trim().isNotEmpty) {
      widget.onAddTodo(
        ToDoEntity(
          title: _titleController.text.trim(),
          description: _detailController.text.trim(),
          isFavorite: _isFavorite,
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      // 키보드 높이만큼 bottom sheet를 올림
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: EdgeInsets.only(top: 12, bottom: 12, left: 20, right: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _titleController,
              focusNode: _focusNode,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '새로운 할 일을 입력하세요',
                hintStyle: TextStyle(fontSize: 16),
              ),
              onSubmitted: (_) => _saveTask(),
              onChanged: (_) {
                setState(() {
                  if (_titleController.text.isNotEmpty) {
                    _isFilledTitle = true;
                  } else {
                    _isFilledTitle = false;
                  }
                });
              },
            ),
            if (_isDetail)
              TextField(
                controller: _detailController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '세부 정보 추가',
                  hintStyle: TextStyle(fontSize: 14),
                ),
              ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isDetail = !_isDetail;
                      });
                    },
                    child: Icon(Icons.short_text_rounded),
                  ),
                  SizedBox(width: 16),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isFavorite = !_isFavorite;
                      });
                    },
                    child: Icon(
                      _isFavorite ? Icons.star : Icons.star_border,
                      color: _isFavorite ? Colors.amber : null,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: _saveTask,
                    child: Text(
                      '저장',
                      style: _isFilledTitle
                          ? TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            )
                          : TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
