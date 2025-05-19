import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Pegar o usuário atual
  User? get currentUser {
    return _auth.currentUser;
  }

  //Registrar novo usuário com email e senha
  Future<UserCredential> register({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      //se for sucesso
      return credential;
    } on FirebaseAuthException {
      //reenvia a exceção para a tela para quem pegar ela tratar
      rethrow;
    }
  }

  //Realizar login com email e senha
  Future<UserCredential?> login({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      //se for sucesso
      return credential;
    } on FirebaseAuthException {
      //reenvia a exceção para a tela para quem pegar ela tratar
      rethrow;
    }
  }

  //Realiza logout do app
  Future<void> logout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print('Erro ao fazer logout: $e');
    }
  }
}
