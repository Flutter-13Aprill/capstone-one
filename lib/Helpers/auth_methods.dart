bool isValidEmail(String email) {
  final RegExp emailRegExp = RegExp(
    r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$',
  );
  return emailRegExp.hasMatch(email);
}

bool isValidPassword(String password) {
  final RegExp passwordRegExp = RegExp(r'^(?=.*[a-z])(?=.*[A-Z]).{8,}$');
  return passwordRegExp.hasMatch(password);
}
