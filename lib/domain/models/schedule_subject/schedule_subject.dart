import 'package:objectbox/objectbox.dart';

@Entity()
class ScheduleSubject {
  @Id() int dbId;
  final String id;
  final String name;
  final bool isChosen;
  final String userUID;

  final bool isVPK;
  bool get isNotVPK => !isVPK;

  ScheduleSubject({
    this.dbId = 0,
    required this.id,
    required this.name,
    required this.isChosen,
    required this.userUID,
    this.isVPK = false
  });

  factory ScheduleSubject.fromJson(Map<String, dynamic> json) =>
      ScheduleSubject(
        dbId: (json['dbId'] as int?) ?? 0,
        id: json['group'] as String,
        name: json['name'] as String,
        isChosen: json['isChosen'] as bool? ?? false,
        isVPK: (json['name'] as String).contains("ВПК"),
        userUID: json['userUID'] as String? ?? ""
      );

  ScheduleSubject copyWith({
    int? dbId,
    String? id,
    String? name,
    bool? isChosen,
    bool? isVPK,
    String? userUID
  }) =>
      ScheduleSubject(
        dbId: dbId ?? this.dbId,
        id: id ?? this.id,
        name: name ?? this.name,
        isChosen: isChosen ?? this.isChosen,
        isVPK: isVPK ?? this.isVPK,
        userUID: userUID ?? this.userUID
      );
}