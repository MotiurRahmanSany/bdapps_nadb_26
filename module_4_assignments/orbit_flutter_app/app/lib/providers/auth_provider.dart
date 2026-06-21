import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Holds the app's authentication state and talks to SharedPreferences
/// so the login session survives an app restart.
class AuthProvider extends ChangeNotifier {
  static const _kIsLoggedInKey = 'is_logged_in';
  static const _kUserNameKey = 'user_name';
  static const _kUserEmailKey = 'user_email';

  bool _isLoggedIn = false;
  String _userName = '';
  String _userEmail = '';
  bool _isLoading = true; // true while we read SharedPreferences on startup

  bool get isLoggedIn => _isLoggedIn;
  String get userName => _userName;
  String get userEmail => _userEmail;
  bool get isLoading => _isLoading;

  /// Call this once when the app starts, to restore any saved session.
  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    _isLoggedIn = prefs.getBool(_kIsLoggedInKey) ?? false;
    _userName = prefs.getString(_kUserNameKey) ?? '';
    _userEmail = prefs.getString(_kUserEmailKey) ?? '';
    _isLoading = false;
    notifyListeners();
  }

  /// Very simple fake login - in a real app you'd call an API here.
  /// Returns null on success, or an error message on failure.
  Future<String?> login({required String email, required String password}) async {
    if (email.trim().isEmpty || password.trim().isEmpty) {
      return 'Please enter both email and password';
    }
    if (!email.contains('@')) {
      return 'Please enter a valid email address';
    }
    if (password.length < 4) {
      return 'Password must be at least 4 characters';
    }

    // Pretend this took a network round trip.
    await Future.delayed(const Duration(milliseconds: 600));

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kIsLoggedInKey, true);
    await prefs.setString(_kUserEmailKey, email.trim());
    // Default display name derived from the email until the user edits it.
    final defaultName = email.split('@').first;
    await prefs.setString(_kUserNameKey, defaultName);

    _isLoggedIn = true;
    _userEmail = email.trim();
    _userName = defaultName;
    notifyListeners();
    return null; // null == success
  }

  /// Lets the Profile screen update the display name and persist it.
  Future<void> updateName(String newName) async {
    if (newName.trim().isEmpty) return;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kUserNameKey, newName.trim());
    _userName = newName.trim();
    notifyListeners();
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kIsLoggedInKey, false);
    _isLoggedIn = false;
    notifyListeners();
  }
}
