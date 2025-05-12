import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                            focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
                            enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
                            filled: Theme.of(context).inputDecorationTheme.filled,
                            fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                          ),
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
                            focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
                            enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
                            filled: Theme.of(context).inputDecorationTheme.filled,
                            fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                          ),
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
                            focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
                            enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
                            filled: Theme.of(context).inputDecorationTheme.filled,
                            fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
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