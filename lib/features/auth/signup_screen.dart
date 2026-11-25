import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../passenger/passenger_shell.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emergencyPhoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _emergencyPhoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Create Account',
                    style: TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Register as a RaastaLink commuter with trusted SOS contact',
                    style: TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 13.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      hintText: 'Full Name (e.g., M. Hammad Rana)',
                      prefixIcon: Icon(
                        Icons.person_outline_rounded,
                        color: AppTheme.primaryTeal,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'Email Address',
                      prefixIcon: Icon(
                        Icons.mail_outline_rounded,
                        color: AppTheme.primaryTeal,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  TextField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      hintText: 'Mobile Number (03XX-XXXXXXX)',
                      prefixIcon: Icon(
                        Icons.phone_outlined,
                        color: AppTheme.primaryTeal,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  TextField(
                    controller: _emergencyPhoneController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      hintText: 'Trusted Emergency Contact (For 1-Tap SOS)',
                      prefixIcon: Icon(
                        Icons.shield_outlined,
                        color: AppTheme.danger,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  TextField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      hintText: 'Create Password',
                      prefixIcon: const Icon(
                        Icons.lock_outline_rounded,
                        color: AppTheme.primaryTeal,
                        size: 20,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: AppTheme.textSecondary,
                          size: 20,
                        ),
                        onPressed: () {
                          setState(() => _obscurePassword = !_obscurePassword);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const PassengerShell(),
                        ),
                            (_) => false,
                      );
                    },
                    child: const Text('Create Passenger Account'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}