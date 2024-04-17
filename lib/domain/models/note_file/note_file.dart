import 'package:file_picker/file_picker.dart';
import 'package:objectbox/objectbox.dart';

import '../note/note.dart';

@Entity()
class NoteFile {
  @Id() int id = 0;
  final String path;
  final String identifier;
  @Transient() TypeOfFile? type;
  final String name;
  ToOne<Note> note = ToOne<Note>();
  
  NoteFile({
    required this.path,
    required this.name,
    required this.identifier
  });

  factory NoteFile.fromPlatformFile(PlatformFile file) {
    final noteFile = NoteFile(
      path: file.path ?? "",
      name: file.name,
      identifier: file.identifier ?? ""
    );

    noteFile.type = TypeOfFile.fromExtension(file.extension ?? "");

    return noteFile;
  }

  int? get dbType {
    return type?.typeInt;
  }

  set dbType(int? value) {
    if (value == null) {
      type = null;
    } else {
      for (TypeOfFile type in TypeOfFile.values) {
        if (type.typeInt == value) {
          this.type = type;
        }
      }
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is! NoteFile) return false;

    return identifier == other.identifier;
  }
}

enum TypeOfFile {
  other(0),
  doc(1),
  pdf(2),
  img(3),
  code(4);

  final int typeInt;

  const TypeOfFile(this.typeInt);

  static fromExtension(String extension) {
    return switch(extension) {
      "doc" || "docx" => TypeOfFile.doc,
      "pdf" => TypeOfFile.pdf,
      "png" || "jpg" || "jpeg" => TypeOfFile.img,
      "py" || "java" || "dart" || "c" || "cpp" => TypeOfFile.code,
      _ => TypeOfFile.other
    };
  }
}