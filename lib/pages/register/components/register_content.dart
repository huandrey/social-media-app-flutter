import 'package:flutter/material.dart';
import 'package:social_media_app/pages/auth/auth_service.dart';
import 'package:social_media_app/pages/register/register_controller.dart';
import 'package:social_media_app/shared/components/my_button.dart';
import 'package:social_media_app/shared/components/my_text_field.dart';

class RegisterContent extends StatelessWidget {
  final Function() onLogin;

  RegisterContent({
    super.key,
    required this.onLogin,
  });

  final AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    RegisterController controller = RegisterController();

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
              'Bem-vindo! Cadastre-se para continuar.',
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
              hintText: 'Username',
              controller: controller.usernameController,
              onChanged: controller.setUsername,
            ),
            const SizedBox(height: 16),
            MyTextField(
              hintText: 'Senha',
              controller: controller.passwordController,
              onChanged: controller.setPassword,
              obscureText: true,
            ),
            const SizedBox(height: 16),
            MyTextField(
              hintText: 'Confirme a senha',
              controller: controller.confirmPasswordController,
              obscureText: true,
              onChanged: controller.setConfirmPassword,
            ),
            const SizedBox(
              height: 24,
            ),
            MyButton(
              label: 'Cadastrar',
              onTap: () => _register(context, controller),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Já possui uma conta?',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  GestureDetector(
                    onTap: onLogin,
                    child: Text(
                      ' Entrar',
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

  _register(BuildContext context, RegisterController controller) {
    try {
      if (controller.validate() == true) {
        auth.signUpWithEmailAndPassword(controller.userData);
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Erro'),
              content: Text('Preencha todos os campos corretamente.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                )
              ],
            );
          },
        );
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Erro'),
            content: Text(e.toString()),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              )
            ],
          );
        },
      );
    }
  }
}
