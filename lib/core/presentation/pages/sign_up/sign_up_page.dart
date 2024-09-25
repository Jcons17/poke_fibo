import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/core/application/bloc/pages/sign_up_bloc/sign_up_bloc.dart';
import 'package:flutter_template/core/core.dart';
import 'package:gap/gap.dart';

@RoutePage()
class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SignUpBloc(),
        child: Builder(
          builder: (context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 32.0, bottom: 32),
                  child: Column(
                    children: [
                      Text(
                        "Signup",
                        style: context.theme.textTheme.headlineMedium,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (value) {
                          context.read<SignUpBloc>().setEmail(value);
                        },
                        decoration: InputDecoration(
                          label: Text(
                            "Email",
                          ),
                          hintText: "Put your email",
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      Gap(16),
                      TextFormField(
                        onChanged: (value) {
                          context.read<SignUpBloc>().setName(value);
                        },
                        decoration: InputDecoration(
                          label: Text(
                            "Name",
                          ),
                          hintText: "Put your full name",
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      Gap(16),
                      TextFormField(
                        onChanged: (value) {
                          context.read<SignUpBloc>().setName(value);
                        },
                        decoration: InputDecoration(
                          label: Text(
                            "Code",
                          ),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        maxLength: 6,
                        maxLines: 1,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                      ),
                      Spacer(),
                      BlocBuilder<SignUpBloc, SignUpState>(
                        builder: (context, state) {
                          return AbsorbPointer(
                            absorbing: state.user == null,
                            child: ElevatedButton(
                              onPressed: () {
                                context.read<AuthBloc>().signUp(state.user!);
                              },
                              child: Text(
                                "Sign up",
                              ),
                            ),
                          );
                        },
                      ),
                      Gap(32),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
