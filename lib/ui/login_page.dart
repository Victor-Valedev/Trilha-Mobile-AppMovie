import 'package:flutter/material.dart';
import 'package:moviesapp/utils/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailUser = TextEditingController();
  TextEditingController passwordUser = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Movie Review',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/imageCapa.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 60,
            left: 90,
            right: 80,
            child: Text(
              'Veja detalhes dos filmes em lançamento, e muito mais!',
              style: Theme.of(context).textTheme.titleMedium,
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
                          'Seja bem-vindo(a) ao seu app de filmes favorito!',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Faça login para continuar.',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: TextFormField(
                          cursorColor: Colors.black,
                          controller: emailUser,
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
                          controller: passwordUser,
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
                      SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {}
                          },
                          style: Theme.of(context).elevatedButtonTheme.style,
                          child: Text('Login'),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.REGISTER_PAGE);
                        },
                        style: TextButton.styleFrom(
                          textStyle: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        child: Text.rich(
                          TextSpan(
                            text: 'Não tem uma conta?',
                            style: TextStyle(color: Colors.white70),
                            children: [
                              TextSpan(
                                text: ' Cadastre-se',
                                style: TextStyle(color: Colors.white),
                              ),
                              TextSpan(
                                text: '.',
                                style: TextStyle(color: Colors.white70),
                              ),
                            ],
                          ),
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
