import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  var _isLogin = true;

  Future<void> _submitAuthForm() async {
    try {
      if (_isLogin) {
        await Provider.of<AuthProvider>(context, listen: false)
            .logIn(_emailController.text, _passwordController.text);
      } else {
        await Provider.of<AuthProvider>(context, listen: false)
            .signUp(_emailController.text, _passwordController.text);
      }
    } catch (error) {
      showCupertinoDialog(
        context: context,
        builder: (ctx) => CupertinoAlertDialog(
          title: Text(_isLogin ? 'Login Failed' : 'Signup Failed'),
          content: Text(error.toString()),
          actions: [
            CupertinoDialogAction(
              child: const Text('OK'),
              onPressed: () => Navigator.of(ctx).pop(),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(_isLogin ? 'Login' : 'Sign Up'),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CupertinoTextField(
              controller: _emailController,
              placeholder: 'Email',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 8),
            CupertinoTextField(
              controller: _passwordController,
              placeholder: 'Password',
              obscureText: true,
            ),
            const SizedBox(height: 16),
            CupertinoButton.filled(
              onPressed: _submitAuthForm,
              child: Text(_isLogin ? 'Login' : 'Sign Up'),
            ),
            CupertinoButton(
              onPressed: () {
                setState(() {
                  _isLogin = !_isLogin;
                });
              },
              child: Text(_isLogin ? 'Create an account' : 'I have an account'),
            ),
          ],
        ),
      ),
    );
  }
}