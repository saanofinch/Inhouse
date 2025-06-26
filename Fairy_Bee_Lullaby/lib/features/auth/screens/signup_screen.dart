import 'package:flutter/material.dart';
import '../../../data/services/auth_service.dart';
import '../../../routes/app_routes.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService authService = AuthService();
  String role = 'parent'; // Default
  String error = '';

  void signup() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    final user = await authService.signup(email, password, role);
    if (user != null) {
      if (role == 'parent') {
        Navigator.pushReplacementNamed(context, AppRoutes.parentHome);
      } else {
        Navigator.pushReplacementNamed(context, AppRoutes.childHome);
      }
    } else {
      setState(() => error = "Signup failed. Try again.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: emailController, decoration: const InputDecoration(labelText: "Email")),
            TextField(controller: passwordController, decoration: const InputDecoration(labelText: "Password"), obscureText: true),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: role,
              items: const [
                DropdownMenuItem(value: 'parent', child: Text("Parent")),
                DropdownMenuItem(value: 'child', child: Text("Child")),
              ],
              onChanged: (value) => setState(() => role = value!),
              decoration: const InputDecoration(labelText: "Mode"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: signup, child: const Text("Sign Up")),
            if (error.isNotEmpty) Text(error, style: const TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
