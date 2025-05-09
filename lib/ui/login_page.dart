import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Movie Review develop',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        backgroundColor: Color(0xFFE50914),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'lib/assets/images/imageCapa.jpg',
              fit: BoxFit.cover,
            )
          ),
          Positioned(
            top: 60,
            left: 80,
            right: 80,
            child: Text(
              'Veja detalhes dos filmes em lançamento, e muito mais!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            )
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
                      Text(
                        'Seja bem-vindo(a) ao seu app de filmes favorito!',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        'Faça login para continuar',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'E-mail:',
                            prefixIcon: Icon(Icons.email),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Senha:',
                            prefixIcon: Icon(Icons.password),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: (){}, 
                          child: Text('Login')
                        ),
                      ),
                      TextButton(
                        onPressed: (){}, 
                        style: TextButton.styleFrom(
                          textStyle: TextStyle(decoration: TextDecoration.underline)
                        ),
                        child: Text(
                          'Não tem uma conta? Cadastre-se.',
                          style: TextStyle(
                            color: Colors.white70
                          ),
                        )
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}