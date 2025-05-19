import 'package:flutter/material.dart';
import 'package:moviesapp/service/auth_service.dart';
import 'package:moviesapp/ui/login_page.dart';
import 'package:moviesapp/utils/app_routes.dart';


class DrawerComponent extends StatelessWidget {
  DrawerComponent({super.key});

  final AuthService _authService = AuthService();

  void _exitApp(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (ctx) => AlertDialog(
            title: const Text(
              'Sair do App',
              style: TextStyle(color: Colors.black),
            ),
            content: const Text(
              'Tem certeza que deseja sair do aplicativo?',
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: const Text(
                  'Voltar para o app',
                  style: TextStyle(color: Colors.green),
                ),
              ),
              TextButton(
                onPressed: () {
                  _authService.logout();
                  Navigator.pushAndRemoveUntil(
                    context, 
                    MaterialPageRoute(builder: (ctx) => LoginPage()), 
                    (route) => false
                  );
                },
                child: const Text(
                  'Sair',
                  style: TextStyle(
                    color: Color(0xFFE50914)
                  ),
                ),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Color(0xFFE50914)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.live_tv_rounded, color: Colors.white, size: 40),
                const SizedBox(height: 10),
                Text(
                  'MoviesApp',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Início'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.search),
            title: const Text('Pesquisar'),
            onTap: () => Navigator.pushNamed(context, AppRoutes.SEARCH_PAGE),
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Sair'),
            onTap: () => _exitApp(context),
          ),
        ],
      ),
    );
  }
}
