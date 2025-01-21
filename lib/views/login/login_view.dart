
import 'package:flutter/material.dart';
import 'package:hackathon_mobile_app/constants/routes.dart';
import 'package:hackathon_mobile_app/helpers/validators.dart';
import 'package:hackathon_mobile_app/theme/colors.dart';
import 'package:hackathon_mobile_app/theme/sizes.dart';
import 'package:hackathon_mobile_app/viewmodels/login_viewmodel.dart';
import 'package:hackathon_mobile_app/views/base.view.dart';
import 'package:hackathon_mobile_app/views/common/buttons.dart';
import 'package:hackathon_mobile_app/views/common/forms.dart';

class LoginView extends StatefulWidget {
  const LoginView({ super.key });

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background decorative elements
          Positioned(
            top: -MediaQuery.of(context).size.width * 0.3,
            right: -MediaQuery.of(context).size.width * 0.2,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                color: AppColors.primaryLite.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
            ),
          ),

          BaseView<LoginViewModel>(
            builder: (context, model, _) => SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: Spacing.xLarge),
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/eco_scan.png',
                          width: 300,
                          height: 200,
                        ),
                        const SizedBox(height: Spacing.small),
                        Text(
                          'Scannez vos produits pour un avenir durable.',
                          style: TextStyle(
                            fontSize: FontSizes.headlineMedium,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryDeep,
                          ),
                        ),
                        const SizedBox(height: Spacing.small),
                        const Text(
                          'Votre allié écoresponsable pour un tri efficace.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: Spacing.x2Large),
                    // Login Form
                    Form(
                      key: model.formKey,
                      child: Column(
                        children: [
                          _buildInputField(
                            controller: model.emailController,
                            label: "Email",
                            hint: 'example@xyz.com',
                            validator: Validators.emailValidator(
                              emptyErrorMsg: "Veuillez entrer votre adresse email.",
                              invalidFormatMsg: "Adresse email invalide.",
                            ),
                            prefixIcon: Icons.email_outlined,
                          ),

                          const SizedBox(height: Spacing.medium),

                          _buildInputField(
                            controller: model.passwordController,
                            label: "Mot de passe",
                            validator: Validators.passwordValidator(
                              emptyErrorMsg: 'Le mot de passe ne peut être vide.',
                              invalidFormatMsg: 'Le mot de passe doit contenir au moins 08 caractères.',
                            ),
                            obscureText: !model.isPasswordVisible,
                            prefixIcon: Icons.lock_outline,
                            suffixIcon: IconButton(
                              icon: Icon(
                                model.isPasswordVisible 
                                    ? Icons.visibility_outlined 
                                    : Icons.visibility_off_outlined,
                                color: Colors.grey,
                              ),
                              onPressed: () => setState(() {
                                model.isPasswordVisible = !model.isPasswordVisible;
                              }),
                            ),
                          ),

                          const SizedBox(height: Spacing.medium),

                          // Login Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryLite,
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () async {
                                if (!model.formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Veuillez remplir tous les champs"),
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  );
                                  return;
                                }
                                
                                // Show loading indicator
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );

                                await Future.delayed(const Duration(seconds: 1)); // Simulate login
                                Navigator.of(context).pushReplacementNamed(RoutePaths.home);
                              },
                              child: const Text(
                                "CONTINUER",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required String? Function(String?) validator,
    String? hint,
    IconData? prefixIcon,
    Widget? suffixIcon,
    bool obscureText = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: Colors.grey) : null,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primaryDeep),
        ),
      ),
      validator: validator,
    );
  }
}