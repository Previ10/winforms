// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/Infraestructure/imputs/imputs.dart';
import 'package:forms_app/presentation/blocs/register_cubit/register_cubit.dart';
import 'package:forms_app/presentation/widgets/inputs/custom_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo usuario'),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FlutterLogo(
                size: 100,
              ),
              SizedBox(
                height: 10,
              ),
              _RegisterForm(),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final passaword = registerCubit.state.passaword;
    final email = registerCubit.state.email;

    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Nombre de usuario',
            hint: 'enter username',
            onChanged: (value) {
              registerCubit.userNameChanged(value);
            },
            // errorMessage: username.errorMessage,
            errorMessage: username.errorMessage,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            label: 'Email',
            hint: 'enter your email',
            onChanged: (value) {
              registerCubit.emailChanged(value);
            },
            errorMessage: email.errorMessage,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            label: 'Passaword',
            hint: 'enter your passaword',
            obscureText: true,
            onChanged: (value) {
              registerCubit.passawordChanged(value);
            },
            errorMessage: passaword.errorMessage,
          ),
          const SizedBox(height: 30),
          FilledButton.tonalIcon(
            onPressed: () {
              registerCubit.onSubmit();
            },
            icon: const Icon(Icons.save),
            label: const Text('Crear Usuario'),
          ),
        ],
      ),
    );
  }
}
