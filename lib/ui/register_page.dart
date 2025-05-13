import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/exeptions/firebase_exceptions.dart';
import 'package:moviesapp/service/auth_service.dart';
import 'package:moviesapp/ui/login_page.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailRegister = TextEditingController();
  TextEditingController passwordRegister = TextEditingController();
  TextEditingController confirmpasswordRegister = TextEditingController();
  bool _isLoading = false;
  final AuthService _auth = AuthService();

  Future<void> register() async {
    setState(() {
      _isLoading = true;
    });

    if (!_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = false;
      });
      return;
    }

    try {
      //Sucesso ao fazer registrar usuário
      await _auth.register(
        email: emailRegister.text,
        password: passwordRegister.text,
      );

      setState(() {
        _isLoading = false;
      });

      if (!mounted) {
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Text(
                'Registro feito com sucesso!',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(width: 8),
              Icon(Icons.check, color: Colors.green),
            ],
          ),
        ),
      );
      Navigator.pushAndRemoveUntil(
        context, 
        MaterialPageRoute(builder: (ctx) => LoginPage()), 
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      if (!mounted) {
        return;
      }
      setState(() {
        _isLoading = false;
      });
      FirebaseExceptions.firebaseAuthErros(context, e);
    }
  }

  @override
  void dispose() {
    emailRegister.dispose();
    passwordRegister.dispose();
    confirmpasswordRegister.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Registre-se',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/imageRegister.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 200),
              padding: EdgeInsets.all(10),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Color(0xFFE50914).withValues(alpha: 0.7),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Registre-se para fazer login em nossa plataforma!',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Veja detalhes de filmes em lançamento',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: TextFormField(
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            labelText: 'E-mail:',
                            labelStyle: TextStyle(color: Colors.black),
                            prefixIcon: Icon(Icons.email, color: Colors.black),
                            focusedBorder:
                                Theme.of(
                                  context,
                                ).inputDecorationTheme.focusedBorder,
                            enabledBorder:
                                Theme.of(
                                  context,
                                ).inputDecorationTheme.enabledBorder,
                            filled:
                                Theme.of(context).inputDecorationTheme.filled,
                            fillColor:
                                Theme.of(
                                  context,
                                ).inputDecorationTheme.fillColor,
                          ),
                          controller: emailRegister,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Preencha o campo com um email.';
                            }
                            if (!value.contains('@')) {
                              return 'Digite um email válido.';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: TextFormField(
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            labelText: 'Senha:',
                            labelStyle: TextStyle(color: Colors.black),
                            prefixIcon: Icon(
                              Icons.password,
                              color: Colors.black,
                            ),
                            focusedBorder:
                                Theme.of(
                                  context,
                                ).inputDecorationTheme.focusedBorder,
                            enabledBorder:
                                Theme.of(
                                  context,
                                ).inputDecorationTheme.enabledBorder,
                            filled:
                                Theme.of(context).inputDecorationTheme.filled,
                            fillColor:
                                Theme.of(
                                  context,
                                ).inputDecorationTheme.fillColor,
                          ),
                          controller: passwordRegister,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'O campo senha não pode estar vazio.';
                            }
                            if (value.trim().length < 6) {
                              return 'A senha deve ter pelo menos 6 caracteres.';
                            }
                            return null;
                          },
                          obscureText: true,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: TextFormField(
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            labelText: 'Confirmar senha:',
                            labelStyle: TextStyle(color: Colors.black),
                            prefixIcon: Icon(
                              Icons.password,
                              color: Colors.black,
                            ),
                            focusedBorder:
                                Theme.of(
                                  context,
                                ).inputDecorationTheme.focusedBorder,
                            enabledBorder:
                                Theme.of(
                                  context,
                                ).inputDecorationTheme.enabledBorder,
                            filled:
                                Theme.of(context).inputDecorationTheme.filled,
                            fillColor:
                                Theme.of(
                                  context,
                                ).inputDecorationTheme.fillColor,
                          ),
                          controller: confirmpasswordRegister,
                          validator: (value) {
                            if (value != passwordRegister.text) {
                              return 'As senhas não conferem';
                            }
                            return null;
                          },
                          obscureText: true,
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            register();
                          },
                          style: Theme.of(context).elevatedButtonTheme.style,
                          child:
                              _isLoading
                                  ? CircularProgressIndicator(
                                    color: Colors.white54,
                                  )
                                  : Text('Registrar'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
