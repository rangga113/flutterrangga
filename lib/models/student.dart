import 'package:freezed_annotation/freezed_annotation.dart';

part 'student.freezed.dart';
part 'student.g.dart';

@freezed
abstract class Student with _$Student {
  const factory Student({
    required String id,
    required String name,
    required int username,
    required String email,
    required String profileImageUrl,
  }) = _Student;

  factory Student.fromJson(Map<String, Object?> json) =>
      _$StudentFromJson(json);
}