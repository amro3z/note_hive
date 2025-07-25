import 'package:hive/hive.dart';

part 'note_model.g.dart';
//flutter packages pub run build_runner build
@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
   String title;
  @HiveField(1)
   String description;
  @HiveField(2)
  final DateTime createdTime;
  @HiveField(3)
   int color;

  NoteModel({
    required this.title,
    required this.description,
    required this.createdTime,
    required this.color,
  });
}
