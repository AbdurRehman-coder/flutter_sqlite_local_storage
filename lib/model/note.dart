
const String tableNotes = 'notes';

class NoteFields{

  static final List<String> values = [
    id, isImportant, title, number, description, time
  ];

  static const String id = '_id';
  static const String isImportant = 'isImportant';
  static const String title = 'title';
  static const String number = 'number';
  static const String description = 'description';
  static const String time = 'time';
}

class Note{
  final int? id;
  final bool isImportant;
  final String title;
  final int number;
  final String description;
  final DateTime createTime;

   const Note({
      this.id,
     required this.isImportant,
     required this.title,
     required this.description,
     required this.createTime,
     required this.number,
   });


   Map<String, Object?> toJson() => {
     NoteFields.id: id,
     NoteFields.title: title,
     NoteFields.description: description,
     NoteFields.number: number,
     NoteFields.isImportant: isImportant ? 1 : 0,
     NoteFields.time: createTime.toIso8601String(),
   };

   Note copy({
      int? id,
      bool? isImportant,
      String? title,
      int? number,
      String? description,
      DateTime? createTime,
}) =>  Note(
       id: id ?? this.id,
       isImportant: isImportant ?? this.isImportant,
      title: title ?? this.title,
      description: description ?? this.description,
      number: number ?? this.number,
      createTime: createTime ?? this.createTime,
     );

   static Note fromJson(Map<String, Object?> json) =>
       Note(
           id: json[NoteFields.id] as int,
           number: json[NoteFields.number] as int,
           title: json[NoteFields.title] as String,
           description: json[NoteFields.description] as String,
           createTime: DateTime.parse(json[NoteFields.time] as String),
           isImportant: json[NoteFields.isImportant] == 1,

       );

}