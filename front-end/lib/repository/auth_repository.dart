class AuthRepository {
  Future<bool> authenticate(String email, String password) async {
    await Future.delayed(Duration(seconds: 1)); // Simulasi API delay

    if (email == 'a' && password == 'a') {
      return true;
    }
    return false;
  }
}
