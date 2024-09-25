import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/core/application/bloc/pages/login_bloc/login_bloc.dart';
import 'package:flutter_template/core/core.dart';
import 'package:gap/gap.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginBloc(),
        child: Builder(
          builder: (context) {
            return SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "Welcome to PokeFibo",
                          style: context.theme.textTheme.headlineMedium,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        TextFormField(
                          onChanged: (email) {
                            context.read<LoginBloc>().setEmail(email);
                          },
                          decoration: InputDecoration(
                            label: Text(
                              "Email",
                            ),
                            hintText: "Put your email",
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        Gap(16),
                        TextFormField(
                          onChanged: (value) => context.read<LoginBloc>().setCode(value),
                          decoration: InputDecoration(
                            label: Text(
                              "Code",
                            ),
                          ),
                          maxLength: 6,
                          maxLines: 1,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                        ),
                        Gap(16),
                        BlocBuilder<LoginBloc, LoginState>(
                          builder: (context, loginState) {
                            return ElevatedButton(
                              onPressed: () {
                                context.read<AuthBloc>().login(email: loginState.email, code: loginState.code);
                              },
                              child: Text(
                                "Login",
                              ),
                            );
                          },
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Text("You don't have an account?"),
                            TextButton(
                              onPressed: () {
                                context.router.push(SignUpRoute());
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: context.theme.colorScheme.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Gap(32),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
