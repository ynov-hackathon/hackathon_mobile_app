
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
      body: BaseView<LoginViewModel>(
        builder: (context, model, _) => SingleChildScrollView(
          padding: const EdgeInsets.only(top: Spacing.x2Large),
          child: Center(
            child: Form(
              key: model.formKey,
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.8,
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: model.emailController,
                      labelText: "Email",
                      hintText: 'ex: example@xyz.com',
                      validator: Validators.emailValidator(
                        emptyErrorMsg: "Veuillez entrer votre adresse email.",
                        invalidFormatMsg: "Adresse email invalide.",
                      ),
                    ),
                
                    const SizedBox(height: Spacing.medium),
                    CustomTextFormField(
                      controller: model.passwordController,
                      labelText: "Mot de passe",
                      validator: Validators.passwordValidator(
                        emptyErrorMsg: 'Le mot de passe ne peut être vide.',
                        invalidFormatMsg: 'Le mot de passe doit contenir au moins 08 caractères.',
                      ),
                      obscureText: !model.isPasswordVisible,
                      suffixIcon: IconButton(
                        icon: Icon(
                          model.isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        ),
                      onPressed: () {
                        setState(() {
                          model.isPasswordVisible = !model.isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: Spacing.medium),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: Spacing.medium),
                    child: Center(
                      child: CustomFilledButton(
                        width: MediaQuery.sizeOf(context).width * 0.95,
                        height: 50,
                        style: FilledButton.styleFrom(
                          backgroundColor: AppColors.primaryLite
                        ),
                        onPressed: () async {
                          if (!(model.formKey.currentState!.validate())) {
                            const SnackBar(content: Text("Veuillez remplir tous les champs"));
                            return;
                          }
                          Navigator.of(context).pushNamed(RoutePaths.home);
                        },
                        label: "CONTINUER",
                      ),
                    ),
                  ),
                  ],
                ),
              ),
            ),
          ),
        )
      ),
    );
  }
}