// api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'employee.dart';

class ApiService {
  final String baseUrl = "http://yourapi.com"; // Replace with your API URL

  Future<List<Employee>> getEmployees() async {
    final response = await http.get(Uri.parse('$baseUrl/get_data'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse
          .map((employee) => Employee.fromJson(employee))
          .toList();
    } else {
      throw Exception('Failed to load employees');
    }
  }

  Future<Employee> addEmployee(Employee employee) async {
    final response = await http.post(
      Uri.parse('$baseUrl/add_data'),
      headers: {"Content-Type": "application/json"},
      body: json.encode(employee.toJson()),
    );
    if (response.statusCode == 200) {
      return Employee.fromJson(json.decode(response.body)['data']);
    } else {
      throw Exception('Failed to add employee');
    }
  }

  Future<Employee> updateEmployee(Employee employee) async {
    final response = await http.put(
      Uri.parse('$baseUrl/update_data/${employee.id}'),
      headers: {"Content-Type": "application/json"},
      body: json.encode(employee.toJson()),
    );
    if (response.statusCode == 200) {
      return Employee.fromJson(json.decode(response.body)['data']);
    } else {
      throw Exception('Failed to update employee');
    }
  }

  Future<void> deleteEmployee(String id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/delete_data/$id'),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to delete employee');
    }
  }
}
