// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'
    as obx_int; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart' as obx;
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'data/models/couple_db.dart';
import 'data/models/day_schedule_db.dart';
import 'data/models/event_db.dart';
import 'data/models/week_schedule_db.dart';
import 'domain/models/schedule_subject/schedule_subject.dart';
import 'domain/models/week_number.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <obx_int.ModelEntity>[
  obx_int.ModelEntity(
      id: const obx_int.IdUid(6, 5480714166435319607),
      name: 'CoupleDB',
      lastPropertyId: const obx_int.IdUid(7, 3785246543164776287),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 6784161525306467972),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 4275684804891642941),
            name: 'audiences',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 4940579546972549732),
            name: 'discipline',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 7949174116230514789),
            name: 'lecturers',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 7804159640948060540),
            name: 'dayScheduleId',
            type: 11,
            flags: 520,
            indexId: const obx_int.IdUid(5, 7434552496165741410),
            relationTarget: 'DayScheduleDB'),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(6, 8995788885646466761),
            name: 'dbType',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(7, 3785246543164776287),
            name: 'coupleNum',
            type: 6,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(9, 8637567801753414186),
      name: 'DayScheduleDB',
      lastPropertyId: const obx_int.IdUid(2, 965904485105953696),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 6363031504345999642),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 965904485105953696),
            name: 'weekScheduleId',
            type: 11,
            flags: 520,
            indexId: const obx_int.IdUid(8, 4832409830394496983),
            relationTarget: 'WeekScheduleDB')
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[
        obx_int.ModelBacklink(
            name: 'couples', srcEntity: 'CoupleDB', srcField: 'daySchedule')
      ]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(11, 1447675370798152411),
      name: 'WeekScheduleDB',
      lastPropertyId: const obx_int.IdUid(7, 7137908083769626596),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 3493144564660923167),
            name: 'scheduleSubjectId',
            type: 11,
            flags: 520,
            indexId: const obx_int.IdUid(10, 8029166871133877756),
            relationTarget: 'ScheduleSubject'),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 5619886490530783704),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 2271529022776843605),
            name: 'weekNumPlusSubjectID',
            type: 9,
            flags: 34848,
            indexId: const obx_int.IdUid(11, 8451372903540954017)),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(6, 5685450538537441623),
            name: 'calendarWeekNumber',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(7, 7137908083769626596),
            name: 'studyWeekNumber',
            type: 6,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[
        obx_int.ModelBacklink(
            name: 'daySchedules',
            srcEntity: 'DayScheduleDB',
            srcField: 'weekSchedule')
      ]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(12, 2407632993041309587),
      name: 'ScheduleSubject',
      lastPropertyId: const obx_int.IdUid(5, 5340708925378251933),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 1169753542374110735),
            name: 'dbId',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 3183900514941058989),
            name: 'id',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 3536761177846029287),
            name: 'name',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 2055389319938891387),
            name: 'isChosen',
            type: 1,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 5340708925378251933),
            name: 'isVPK',
            type: 1,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[
        obx_int.ModelBacklink(
            name: 'weekSchedules',
            srcEntity: 'WeekScheduleDB',
            srcField: 'scheduleSubject')
      ]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(13, 5408297173790329811),
      name: 'EventDB',
      lastPropertyId: const obx_int.IdUid(7, 2140713880612862238),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 994092958168848233),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 1500936715972334083),
            name: 'title',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 8506989828847087467),
            name: 'description',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 328405976758079175),
            name: 'date',
            type: 10,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 1760040761526889768),
            name: 'timeStart',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(6, 4075190789421474376),
            name: 'timeEnd',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(7, 2140713880612862238),
            name: 'weekNum',
            type: 6,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(15, 3529840884396796264),
      name: 'WeekNumber',
      lastPropertyId: const obx_int.IdUid(2, 5169322805903344335),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 8606615907388497622),
            name: 'studyWeekNumber',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 5169322805903344335),
            name: 'calendarWeekNumber',
            type: 6,
            flags: 129)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[])
];

/// Shortcut for [Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [Store.new] for an explanation of all parameters.
///
/// For Flutter apps, also calls `loadObjectBoxLibraryAndroidCompat()` from
/// the ObjectBox Flutter library to fix loading the native ObjectBox library
/// on Android 6 and older.
Future<obx.Store> openStore(
    {String? directory,
    int? maxDBSizeInKB,
    int? maxDataSizeInKB,
    int? fileMode,
    int? maxReaders,
    bool queriesCaseSensitiveDefault = true,
    String? macosApplicationGroup}) async {
  await loadObjectBoxLibraryAndroidCompat();
  return obx.Store(getObjectBoxModel(),
      directory: directory ?? (await defaultStoreDirectory()).path,
      maxDBSizeInKB: maxDBSizeInKB,
      maxDataSizeInKB: maxDataSizeInKB,
      fileMode: fileMode,
      maxReaders: maxReaders,
      queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
      macosApplicationGroup: macosApplicationGroup);
}

/// Returns the ObjectBox model definition for this project for use with
/// [Store.new].
obx_int.ModelDefinition getObjectBoxModel() {
  final model = obx_int.ModelInfo(
      entities: _entities,
      lastEntityId: const obx_int.IdUid(15, 3529840884396796264),
      lastIndexId: const obx_int.IdUid(12, 1606607200252430453),
      lastRelationId: const obx_int.IdUid(0, 0),
      lastSequenceId: const obx_int.IdUid(0, 0),
      retiredEntityUids: const [
        1910578607431801677,
        6564081225644799157,
        701607334596766764,
        3955847375317494942,
        6365253965074262032,
        2803109517062443162,
        2107067233892169345,
        914042337563340598,
        2460264848318751972
      ],
      retiredIndexUids: const [1606607200252430453],
      retiredPropertyUids: const [
        8531280715951716256,
        5343336231592800032,
        4041494958170106113,
        8705310470934911829,
        6357635646213294641,
        493050093322022615,
        5795760961840172971,
        1168014137087986006,
        5856057666645421310,
        16813341898936457,
        6836084117422674255,
        5499231742823135521,
        5206147708866401738,
        5792695101486551096,
        962648145084222784,
        3458241965252757428,
        960069697671965780,
        2016668046429502095,
        1724291030451517162,
        8958418185775935014,
        2648183407103052794,
        8448514585900121930,
        4342852172978207443,
        2495668294353778742,
        4364730252489929958,
        526765531046512864,
        3198016435380073846,
        2687273874596452908,
        1002905684170273399,
        4946166731877366772,
        665913462344297158,
        6983693999060459476,
        8905720686228930495,
        1757377980583035597,
        2414596226964128475
      ],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, obx_int.EntityDefinition>{
    CoupleDB: obx_int.EntityDefinition<CoupleDB>(
        model: _entities[0],
        toOneRelations: (CoupleDB object) => [object.daySchedule],
        toManyRelations: (CoupleDB object) => {},
        getId: (CoupleDB object) => object.id,
        setId: (CoupleDB object, int id) {
          object.id = id;
        },
        objectToFB: (CoupleDB object, fb.Builder fbb) {
          final audiencesOffset = fbb.writeString(object.audiences);
          final disciplineOffset = fbb.writeString(object.discipline);
          final lecturersOffset = fbb.writeString(object.lecturers);
          final dbTypeOffset =
              object.dbType == null ? null : fbb.writeString(object.dbType!);
          fbb.startTable(8);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, audiencesOffset);
          fbb.addOffset(2, disciplineOffset);
          fbb.addOffset(3, lecturersOffset);
          fbb.addInt64(4, object.daySchedule.targetId);
          fbb.addOffset(5, dbTypeOffset);
          fbb.addInt64(6, object.coupleNum);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final audiencesParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final disciplineParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 8, '');
          final lecturersParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 10, '');
          final coupleNumParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 16, 0);
          final object = CoupleDB(
              audiences: audiencesParam,
              discipline: disciplineParam,
              lecturers: lecturersParam,
              coupleNum: coupleNumParam)
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0)
            ..dbType = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 14);
          object.daySchedule.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0);
          object.daySchedule.attach(store);
          return object;
        }),
    DayScheduleDB: obx_int.EntityDefinition<DayScheduleDB>(
        model: _entities[1],
        toOneRelations: (DayScheduleDB object) => [object.weekSchedule],
        toManyRelations: (DayScheduleDB object) => {
              obx_int.RelInfo<CoupleDB>.toOneBacklink(5, object.id,
                  (CoupleDB srcObject) => srcObject.daySchedule): object.couples
            },
        getId: (DayScheduleDB object) => object.id,
        setId: (DayScheduleDB object, int id) {
          object.id = id;
        },
        objectToFB: (DayScheduleDB object, fb.Builder fbb) {
          fbb.startTable(3);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.weekSchedule.targetId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = DayScheduleDB()
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          object.weekSchedule.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0);
          object.weekSchedule.attach(store);
          obx_int.InternalToManyAccess.setRelInfo<DayScheduleDB>(
              object.couples,
              store,
              obx_int.RelInfo<CoupleDB>.toOneBacklink(
                  5, object.id, (CoupleDB srcObject) => srcObject.daySchedule));
          return object;
        }),
    WeekScheduleDB: obx_int.EntityDefinition<WeekScheduleDB>(
        model: _entities[2],
        toOneRelations: (WeekScheduleDB object) => [object.scheduleSubject],
        toManyRelations: (WeekScheduleDB object) => {
              obx_int.RelInfo<DayScheduleDB>.toOneBacklink(2, object.id,
                      (DayScheduleDB srcObject) => srcObject.weekSchedule):
                  object.daySchedules
            },
        getId: (WeekScheduleDB object) => object.id,
        setId: (WeekScheduleDB object, int id) {
          object.id = id;
        },
        objectToFB: (WeekScheduleDB object, fb.Builder fbb) {
          final weekNumPlusSubjectIDOffset =
              fbb.writeString(object.weekNumPlusSubjectID);
          fbb.startTable(8);
          fbb.addInt64(1, object.scheduleSubject.targetId);
          fbb.addInt64(2, object.id);
          fbb.addOffset(3, weekNumPlusSubjectIDOffset);
          fbb.addInt64(5, object.calendarWeekNumber);
          fbb.addInt64(6, object.studyWeekNumber);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final weekNumPlusSubjectIDParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 10, '');
          final calendarWeekNumberParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 14, 0);
          final studyWeekNumberParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 16, 0);
          final object = WeekScheduleDB(
              weekNumPlusSubjectID: weekNumPlusSubjectIDParam,
              calendarWeekNumber: calendarWeekNumberParam,
              studyWeekNumber: studyWeekNumberParam)
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0);
          object.scheduleSubject.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0);
          object.scheduleSubject.attach(store);
          obx_int.InternalToManyAccess.setRelInfo<WeekScheduleDB>(
              object.daySchedules,
              store,
              obx_int.RelInfo<DayScheduleDB>.toOneBacklink(2, object.id,
                  (DayScheduleDB srcObject) => srcObject.weekSchedule));
          return object;
        }),
    ScheduleSubject: obx_int.EntityDefinition<ScheduleSubject>(
        model: _entities[3],
        toOneRelations: (ScheduleSubject object) => [],
        toManyRelations: (ScheduleSubject object) => {
              obx_int.RelInfo<WeekScheduleDB>.toOneBacklink(2, object.dbId!,
                      (WeekScheduleDB srcObject) => srcObject.scheduleSubject):
                  object.weekSchedules
            },
        getId: (ScheduleSubject object) => object.dbId,
        setId: (ScheduleSubject object, int id) {
          object.dbId = id;
        },
        objectToFB: (ScheduleSubject object, fb.Builder fbb) {
          final idOffset = fbb.writeString(object.id);
          final nameOffset = fbb.writeString(object.name);
          fbb.startTable(6);
          fbb.addInt64(0, object.dbId ?? 0);
          fbb.addOffset(1, idOffset);
          fbb.addOffset(2, nameOffset);
          fbb.addBool(3, object.isChosen);
          fbb.addBool(4, object.isVPK);
          fbb.finish(fbb.endTable());
          return object.dbId ?? 0;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final dbIdParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 4);
          final idParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final nameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 8, '');
          final isChosenParam =
              const fb.BoolReader().vTableGet(buffer, rootOffset, 10, false);
          final isVPKParam =
              const fb.BoolReader().vTableGet(buffer, rootOffset, 12, false);
          final object = ScheduleSubject(
              dbId: dbIdParam,
              id: idParam,
              name: nameParam,
              isChosen: isChosenParam,
              isVPK: isVPKParam);
          obx_int.InternalToManyAccess.setRelInfo<ScheduleSubject>(
              object.weekSchedules,
              store,
              obx_int.RelInfo<WeekScheduleDB>.toOneBacklink(2, object.dbId!,
                  (WeekScheduleDB srcObject) => srcObject.scheduleSubject));
          return object;
        }),
    EventDB: obx_int.EntityDefinition<EventDB>(
        model: _entities[4],
        toOneRelations: (EventDB object) => [],
        toManyRelations: (EventDB object) => {},
        getId: (EventDB object) => object.id,
        setId: (EventDB object, int id) {
          object.id = id;
        },
        objectToFB: (EventDB object, fb.Builder fbb) {
          final titleOffset = fbb.writeString(object.title);
          final descriptionOffset = fbb.writeString(object.description);
          final timeStartOffset = fbb.writeString(object.timeStart);
          final timeEndOffset = fbb.writeString(object.timeEnd);
          fbb.startTable(8);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, titleOffset);
          fbb.addOffset(2, descriptionOffset);
          fbb.addInt64(3, object.date.millisecondsSinceEpoch);
          fbb.addOffset(4, timeStartOffset);
          fbb.addOffset(5, timeEndOffset);
          fbb.addInt64(6, object.weekNum);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final timeStartParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 12, '');
          final timeEndParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 14, '');
          final titleParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final descriptionParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, '');
          final dateParam = DateTime.fromMillisecondsSinceEpoch(
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0));
          final weekNumParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 16, 0);
          final object = EventDB(
              timeStart: timeStartParam,
              timeEnd: timeEndParam,
              title: titleParam,
              description: descriptionParam,
              date: dateParam,
              weekNum: weekNumParam)
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        }),
    WeekNumber: obx_int.EntityDefinition<WeekNumber>(
        model: _entities[5],
        toOneRelations: (WeekNumber object) => [],
        toManyRelations: (WeekNumber object) => {},
        getId: (WeekNumber object) => object.calendarWeekNumber,
        setId: (WeekNumber object, int id) {
          if (object.calendarWeekNumber != id) {
            throw ArgumentError(
                'Field WeekNumber.calendarWeekNumber is read-only '
                '(final or getter-only) and it was declared to be self-assigned. '
                'However, the currently inserted object (.calendarWeekNumber=${object.calendarWeekNumber}) '
                "doesn't match the inserted ID (ID $id). "
                'You must assign an ID before calling [box.put()].');
          }
        },
        objectToFB: (WeekNumber object, fb.Builder fbb) {
          fbb.startTable(3);
          fbb.addInt64(0, object.studyWeekNumber);
          fbb.addInt64(1, object.calendarWeekNumber);
          fbb.finish(fbb.endTable());
          return object.calendarWeekNumber;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final studyWeekNumberParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 4);
          final calendarWeekNumberParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0);
          final object = WeekNumber(
              studyWeekNumber: studyWeekNumberParam,
              calendarWeekNumber: calendarWeekNumberParam);

          return object;
        })
  };

  return obx_int.ModelDefinition(model, bindings);
}

/// [CoupleDB] entity fields to define ObjectBox queries.
class CoupleDB_ {
  /// see [CoupleDB.id]
  static final id =
      obx.QueryIntegerProperty<CoupleDB>(_entities[0].properties[0]);

  /// see [CoupleDB.audiences]
  static final audiences =
      obx.QueryStringProperty<CoupleDB>(_entities[0].properties[1]);

  /// see [CoupleDB.discipline]
  static final discipline =
      obx.QueryStringProperty<CoupleDB>(_entities[0].properties[2]);

  /// see [CoupleDB.lecturers]
  static final lecturers =
      obx.QueryStringProperty<CoupleDB>(_entities[0].properties[3]);

  /// see [CoupleDB.daySchedule]
  static final daySchedule = obx.QueryRelationToOne<CoupleDB, DayScheduleDB>(
      _entities[0].properties[4]);

  /// see [CoupleDB.dbType]
  static final dbType =
      obx.QueryStringProperty<CoupleDB>(_entities[0].properties[5]);

  /// see [CoupleDB.coupleNum]
  static final coupleNum =
      obx.QueryIntegerProperty<CoupleDB>(_entities[0].properties[6]);
}

/// [DayScheduleDB] entity fields to define ObjectBox queries.
class DayScheduleDB_ {
  /// see [DayScheduleDB.id]
  static final id =
      obx.QueryIntegerProperty<DayScheduleDB>(_entities[1].properties[0]);

  /// see [DayScheduleDB.weekSchedule]
  static final weekSchedule =
      obx.QueryRelationToOne<DayScheduleDB, WeekScheduleDB>(
          _entities[1].properties[1]);

  /// see [DayScheduleDB.couples]
  static final couples =
      obx.QueryBacklinkToMany<CoupleDB, DayScheduleDB>(CoupleDB_.daySchedule);
}

/// [WeekScheduleDB] entity fields to define ObjectBox queries.
class WeekScheduleDB_ {
  /// see [WeekScheduleDB.scheduleSubject]
  static final scheduleSubject =
      obx.QueryRelationToOne<WeekScheduleDB, ScheduleSubject>(
          _entities[2].properties[0]);

  /// see [WeekScheduleDB.id]
  static final id =
      obx.QueryIntegerProperty<WeekScheduleDB>(_entities[2].properties[1]);

  /// see [WeekScheduleDB.weekNumPlusSubjectID]
  static final weekNumPlusSubjectID =
      obx.QueryStringProperty<WeekScheduleDB>(_entities[2].properties[2]);

  /// see [WeekScheduleDB.calendarWeekNumber]
  static final calendarWeekNumber =
      obx.QueryIntegerProperty<WeekScheduleDB>(_entities[2].properties[3]);

  /// see [WeekScheduleDB.studyWeekNumber]
  static final studyWeekNumber =
      obx.QueryIntegerProperty<WeekScheduleDB>(_entities[2].properties[4]);

  /// see [WeekScheduleDB.daySchedules]
  static final daySchedules =
      obx.QueryBacklinkToMany<DayScheduleDB, WeekScheduleDB>(
          DayScheduleDB_.weekSchedule);
}

/// [ScheduleSubject] entity fields to define ObjectBox queries.
class ScheduleSubject_ {
  /// see [ScheduleSubject.dbId]
  static final dbId =
      obx.QueryIntegerProperty<ScheduleSubject>(_entities[3].properties[0]);

  /// see [ScheduleSubject.id]
  static final id =
      obx.QueryStringProperty<ScheduleSubject>(_entities[3].properties[1]);

  /// see [ScheduleSubject.name]
  static final name =
      obx.QueryStringProperty<ScheduleSubject>(_entities[3].properties[2]);

  /// see [ScheduleSubject.isChosen]
  static final isChosen =
      obx.QueryBooleanProperty<ScheduleSubject>(_entities[3].properties[3]);

  /// see [ScheduleSubject.isVPK]
  static final isVPK =
      obx.QueryBooleanProperty<ScheduleSubject>(_entities[3].properties[4]);

  /// see [ScheduleSubject.weekSchedules]
  static final weekSchedules =
      obx.QueryBacklinkToMany<WeekScheduleDB, ScheduleSubject>(
          WeekScheduleDB_.scheduleSubject);
}

/// [EventDB] entity fields to define ObjectBox queries.
class EventDB_ {
  /// see [EventDB.id]
  static final id =
      obx.QueryIntegerProperty<EventDB>(_entities[4].properties[0]);

  /// see [EventDB.title]
  static final title =
      obx.QueryStringProperty<EventDB>(_entities[4].properties[1]);

  /// see [EventDB.description]
  static final description =
      obx.QueryStringProperty<EventDB>(_entities[4].properties[2]);

  /// see [EventDB.date]
  static final date =
      obx.QueryDateProperty<EventDB>(_entities[4].properties[3]);

  /// see [EventDB.timeStart]
  static final timeStart =
      obx.QueryStringProperty<EventDB>(_entities[4].properties[4]);

  /// see [EventDB.timeEnd]
  static final timeEnd =
      obx.QueryStringProperty<EventDB>(_entities[4].properties[5]);

  /// see [EventDB.weekNum]
  static final weekNum =
      obx.QueryIntegerProperty<EventDB>(_entities[4].properties[6]);
}

/// [WeekNumber] entity fields to define ObjectBox queries.
class WeekNumber_ {
  /// see [WeekNumber.studyWeekNumber]
  static final studyWeekNumber =
      obx.QueryIntegerProperty<WeekNumber>(_entities[5].properties[0]);

  /// see [WeekNumber.calendarWeekNumber]
  static final calendarWeekNumber =
      obx.QueryIntegerProperty<WeekNumber>(_entities[5].properties[1]);
}
