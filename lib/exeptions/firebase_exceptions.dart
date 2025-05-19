import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseExceptions {
  static void firebaseAuthErros(BuildContext context, FirebaseAuthException e) {
    String erroMessage;

    switch (e.code) {
      case 'invalid-email':
        erroMessage = 'O e-mail fornecido não é válido.';
        break;
      case 'user-disabled':
        erroMessage = 'Este usuário está desativado.';
        break;
      case 'user-not-found':
        erroMessage = 'Usuário não encontrado.';
        break;
      case 'wrong-password':
        erroMessage = 'Senha incorreta.';
        break;
      case 'email-already-in-use':
        erroMessage = 'Este e-mail já está em uso.';
        break;
      case 'weak-password':
        erroMessage = 'A senha é muito fraca.';
        break;
      case 'operation-not-allowed':
        erroMessage = 'Essa operação não está habilitada.';
        break;
      default:
        erroMessage = 'Erro: ${'Verifique novamente suas credenciais, ou conexão com a internet.'}';
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(erroMessage)));
  }
}
