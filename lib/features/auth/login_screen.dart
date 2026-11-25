import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import 'signup_screen.dart';
import '../passenger/passenger_shell.dart';
import '../driver/driver_shell.dart';
import '../operator_web/operator_portal_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _identifierController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isStaffMode = false; // Toggles between Passenger and Driver/Operator Login
  String _staffRole = 'driver'; // 'driver' or 'operator'

  @override
  void dispose() {
    _identifierController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleSignIn() {
    Widget destination;
    if (!_isStaffMode) {
      destination = const PassengerShell();
    } else if (_staffRole == 'driver') {
      destination = const DriverShell();
    } else {
      destination = const OperatorPortalScreen();
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => destination),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 12),
                  // Rounded Teal Bus Badge (Matches Figma Top Logo)
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: AppTheme.primaryTeal,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Icon(
                      Icons.directions_bus_rounded,
                      color: AppTheme.background,
                      size: 34,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Two-tone "RaastaLink" Brand Title
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.5,
                      ),
                      children: [
                        TextSpan(
                          text: 'Raasta',
                          style: TextStyle(color: AppTheme.textPrimary),
                        ),
                        TextSpan(
                          text: 'Link',
                          style: TextStyle(color: AppTheme.primaryTeal),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Smart Transit for a Connected City',
                    style: TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 13.5,
                    ),
                  ),
                  const SizedBox(height: 44),

                  // Left-aligned Welcome Header
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _isStaffMode
                              ? 'Driver & Operator Portal'
                              : 'Welcome Back',
                          style: const TextStyle(
                            color: AppTheme.textPrimary,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _isStaffMode
                              ? 'Sign in with your assigned fleet or operator ID'
                              : 'Sign in to track routes, fares & live buses',
                          style: const TextStyle(
                            color: AppTheme.textSecondary,
                            fontSize: 13.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),

                  // Optional Role Pill when Staff Portal Login is active
                  if (_isStaffMode) ...[
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppTheme.surface,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppTheme.surfaceBorder),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: _RoleTab(
                              label: 'Driver App',
                              selected: _staffRole == 'driver',
                              onTap: () => setState(() => _staffRole = 'driver'),
                            ),
                          ),
                          Expanded(
                            child: _RoleTab(
                              label: 'Operator Web',
                              selected: _staffRole == 'operator',
                              onTap: () =>
                                  setState(() => _staffRole = 'operator'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                  ],

                  // Email or Mobile Number Input
                  TextField(
                    controller: _identifierController,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: AppTheme.textPrimary),
                    decoration: InputDecoration(
                      hintText: _isStaffMode
                          ? 'Operator / Driver Email or ID'
                          : 'Email or Mobile Number',
                      prefixIcon: const Icon(
                        Icons.mail_outline_rounded,
                        color: AppTheme.primaryTeal,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Password Input with Visibility Toggle
                  TextField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    style: const TextStyle(color: AppTheme.textPrimary),
                    decoration: InputDecoration(
                      hintText: 'Password',
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
                  const SizedBox(height: 10),

                  // Forgot Password Link
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Password reset OTP will connect to /api/auth/forgot-password',
                            ),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(0, 32),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: AppTheme.primaryTeal,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),

                  // Primary Teal Sign In Button
                  ElevatedButton(
                    onPressed: _handleSignIn,
                    child: Text(
                      _isStaffMode
                          ? (_staffRole == 'driver'
                          ? 'Sign In as Driver'
                          : 'Open Operator Portal')
                          : 'Sign In',
                    ),
                  ),
                  const SizedBox(height: 22),

                  // Divider: "or continue as"
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(color: AppTheme.surfaceBorder, thickness: 1),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          'or continue as',
                          style: TextStyle(
                            color: AppTheme.textSecondary.withOpacity(0.85),
                            fontSize: 12.5,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Divider(color: AppTheme.surfaceBorder, thickness: 1),
                      ),
                    ],
                  ),
                  const SizedBox(height: 22),

                  // Secondary Dark Button: "Driver / Operator Portal Login"
                  OutlinedButton.icon(
                    onPressed: () {
                      setState(() => _isStaffMode = !_isStaffMode);
                    },
                    icon: Icon(
                      _isStaffMode
                          ? Icons.directions_walk_rounded
                          : Icons.person_outline_rounded,
                      color: AppTheme.primaryTeal,
                      size: 20,
                    ),
                    label: Text(
                      _isStaffMode
                          ? 'Back to Passenger Login'
                          : 'Driver / Operator Portal Login',
                      style: const TextStyle(
                        color: AppTheme.textPrimary,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: AppTheme.surface,
                      minimumSize: const Size(double.infinity, 52),
                      side: const BorderSide(color: AppTheme.surfaceBorder),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 36),

                  // Bottom Sign Up Prompt
                  if (!_isStaffMode)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have a passenger account? ",
                          style: TextStyle(
                            color: AppTheme.textSecondary,
                            fontSize: 13,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const SignUpScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: AppTheme.primaryTeal,
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
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

class _RoleTab extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _RoleTab({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: selected ? AppTheme.primaryTeal : Colors.transparent,
          borderRadius: BorderRadius.circular(9),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            color: selected ? AppTheme.background : AppTheme.textSecondary,
            fontWeight: FontWeight.w700,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}