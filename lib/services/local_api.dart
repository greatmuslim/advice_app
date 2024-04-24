import 'dart:async';

class LocalApi {
  // Simulated database to store user data
  static Map<String, dynamic> _database = {};

  // Method to register a new user
  static Future<void> signUp(Map<String, dynamic> userData) async {
    final String userId = userData['id'];
    if (_database.containsKey(userId)) {
      throw Exception('User with id $userId already exists');
    } else {
      _database[userId] = userData;
    }
  }

  // Method to verify login credentials
  static Future<bool> login(String email, String password) async {
    // Search for user with provided email
    final user = _database.values.firstWhere(
      (userData) => userData['email'] == email,
      orElse: () => null,
    );

    if (user != null && user['password'] == password) {
      // User found and password matches
      return true;
    } else {
      // Either user not found or password does not match
      return false;
    }
  }
}
