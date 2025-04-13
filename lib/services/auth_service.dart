class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  String? _currentUserEmail;
  final Map<String, String> _users = {}; // email -> password

  bool get isLoggedIn => _currentUserEmail != null;
  String? get currentUserEmail => _currentUserEmail;

  bool register(String email, String password) {
    if (_users.containsKey(email)) {
      return false; // User already exists
    }
    _users[email] = password;
    return true;
  }

  bool login(String email, String password) {
    if (_users[email] == password) {
      _currentUserEmail = email;
      return true;
    }
    return false;
  }

  void logout() {
    _currentUserEmail = null;
  }
} 