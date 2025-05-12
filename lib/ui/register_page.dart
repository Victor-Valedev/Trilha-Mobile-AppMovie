import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailregister = TextEditingController();
  TextEditingController passwordregister = TextEditingController();
  TextEditingController confirmpasswordregister = TextEditingController();

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
                          controller: emailregister,
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
                          controller: passwordregister,
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
                          controller: confirmpasswordregister,
                          validator: (value) {
                            if (value != passwordregister.text) {
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
                            if(_formKey.currentState!.validate()){

                            }
                          },
                          style: Theme.of(context).elevatedButtonTheme.style,
                          child: Text('Registrar'),
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
