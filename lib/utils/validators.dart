class Validators {
  static bool isValidEmail(String email) {
    final emailRegExp = RegExp(r'^[a-zA-Z0-9.-]+@[a-zA-Z0-9.]+');
    return emailRegExp.hasMatch(email);
  }

  static bool isValidPassword(String password) {
    // Minimum 8 characters, at least one uppercase, one lowercase, one number and one special character
    final passwordRegExp = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
    return passwordRegExp.hasMatch(password);
  }
}
