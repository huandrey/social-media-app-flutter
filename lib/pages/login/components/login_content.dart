import 'package:flutter/material.dart';
import 'package:social_media_app/pages/auth/auth_service.dart';
import 'package:social_media_app/pages/login/login_controller.dart';
import 'package:social_media_app/shared/components/my_button.dart';
import 'package:social_media_app/shared/components/my_text_field.dart';

class LoginContent extends StatelessWidget {
  final Function() onRegister;

  LoginContent({
    super.key,
    required this.onRegister,
  });

  final AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    LoginController controller = LoginController();

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              size: 100,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 32),
            Text(
              'Bem-vindo! Faça login para continuar.',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 32),
            MyTextField(
              hintText: 'E-mail',
              controller: controller.emailController,
              onChanged: controller.setEmail,
            ),
            const SizedBox(height: 16),
            MyTextField(
              hintText: 'Digite sua senha',
              controller: controller.passwordController,
              onChanged: controller.setPassword,
              obscureText: true,
            ),
            const SizedBox(
              height: 24,
            ),
            MyButton(
              label: 'Acessar',
              onTap: () => _signIn(context, controller),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Não possui uma conta?',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: onRegister,
                    child: Text(
                      ' Cadastre-se aqui',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _signIn(BuildContext context, LoginController controller) async {
    try {
      await auth.signIn(controller.userData);
    } catch (e) {
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Erro'),
              content: Text(e.toString()),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                )
              ],
            );
          },
        );
      }
    }
  }
}
