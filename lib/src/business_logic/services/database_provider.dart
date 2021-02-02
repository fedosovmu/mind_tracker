import 'dart:async';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/mood_assessment.dart';


class DatabaseProvider {
  static const _databaseName = "mind_tracker.db";
  static const _databaseVersion = 1;

  DatabaseProvider._();
  static final DatabaseProvider db = DatabaseProvider._();


  static Database _database;
  Future<Database> get database async {
    if (_database != null)
      return _database;
    _database = await initDb();
    return _database;
  }
  initDb() async {
    return await openDatabase(
      join(getDatabasesPath().toString(), _databaseName),
      onCreate: (db, version) {
        return db.execute(
            "CREATE TABLE IF NOT EXISTS mood_assessments"
                "(id INTEGER PRIMARY KEY, "
                "mood INTEGER)"
        );
      },
      version: _databaseVersion,
    );
  }

  insertMoodAssessment(MoodAssessment moodAssessment) async {
    final Database db = await database;
    await db.insert(
      'mood_assessments',
      moodAssessment.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  deleteAllMoodAssessments() async {
    final db = await database;
    db.delete('mood_assessments');
  }

  Future<List<MoodAssessment>> getMoodAssessments () async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('mood_assessments');
    print(maps); // TODO: Delete this line
    return List.generate(maps.length, (i) {
        return MoodAssessment(
          id: maps[i]['id'],
          mood: maps[i]['mood']
        );
    });
  }

}