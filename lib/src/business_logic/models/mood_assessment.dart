

class MoodAssessment {
  final int id;
  final int mood;

  MoodAssessment({this.id, this.mood});

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