


class MoodAssessment {
  final int id;
  final int mood;
  DateTime dateTime;

  MoodAssessment({this.id, this.mood}) {
    dateTime = DateTime.now();
  }

  String getTimeString() {
    final hours = dateTime.hour.toString().padLeft(2, '0');
    final minutes = dateTime.minute.toString().padLeft(2, '0');
    return '$hours:$minutes';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'mood': mood,
    };
  }

  @override
  String toString() {
    return '{id: $id, mood: $mood}';
  }

}