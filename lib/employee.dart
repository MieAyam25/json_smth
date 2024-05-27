// employee.dart
import 'package:meta/meta.dart';

class Employee {
  final String id;
  final String name;
  final String salary;
  final String age;
  final String profileImage;

  Employee({
    required this.id,
    required this.name,
    required this.salary,
    required this.age,
    required this.profileImage,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      name: json['employee_name'],
      salary: json['employee_salary'],
      age: json['employee_age'],
      profileImage: json['profile_image'] ?? '', // Handle possible null value for profileImage
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'employee_name': name,
      'employee_salary': salary,
      'employee_age': age,
      'profile_image': profileImage,
    };
  }
}
