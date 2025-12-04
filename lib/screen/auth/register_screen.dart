import 'package:backend_rpl/cubit/create_users/create_user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});



  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _registerUser({
    required String nama,
    required String username,
    required String password,
  }) async {
    if(_namaController.text.isEmpty ||
       _usernameController.text.isEmpty ||
       _passwordController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Field Wajib di isi"))
        );
        return;
       }

       context.read<CreateUserCubit>().createUser(
        nama: nama,
        username: username,
        password: password,
       );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<CreateUserCubit, CreateUserCubitState>(
        listener:(context, state) {
          state.maybeWhen(
            failure: (errorMessage){
              return showBottomSheet(
                context: context, 
                builder: (context) {
                  return SizedBox(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(errorMessage),
                      ],
                    ),
                  );
                }
              );
            },
            success: (dataUser) {
              return showBottomSheet(
                enableDrag: true,
                showDragHandle: true,
                context: context, 
                builder: (context)  {
                  return Column(
                    children: [
                      Text("Register berhasil"),
                    ],
                    );
                }
                );
            },
            orElse: () {}
          );
        },
        child: Stack(
          children: [
            SvgPicture.asset(
              'assets/images/dakota.svg',
              fit: BoxFit.cover,
            ),
        
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 400,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 32),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  
                  children: [
                    Text(
                      "Register", 
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
        
                    SizedBox(height: 24),
        
        
                    
                    Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Nama",
                          style: TextStyle(fontWeight: FontWeight.w600),
                            ),
        
                          SizedBox(height: 4,),
                          TextField(
                            controller: _namaController,
                          ),
                        ],
                      ),
                    ),
        
                    SizedBox(height: 16,),
        
                    Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Username",
                          style: TextStyle(fontWeight: FontWeight.w600),
                            ),
        
                          SizedBox(height: 4,),
                          TextField(
                            controller: _usernameController,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16,),
        
                    Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Passsword",
                          style: TextStyle(fontWeight: FontWeight.w600),
                            ),
        
                          SizedBox(height: 4,),
                          TextField(
                            controller: _passwordController,
                            obscureText: true,),
                        ],
                      ),
                    ),
        
                    SizedBox(height: 16,),
        
                    BlocBuilder<CreateUserCubit, CreateUserCubitState>(
                      builder: (context, state) {
                         final isLoading = state.maybeWhen(
        
                          loading: () => true,
                          orElse: () => false,
                        );
        
                        return FilledButton(onPressed: () => _registerUser(
                        nama: _namaController.text,
                        username: _usernameController.text,
                        password: _passwordController.text,
                      ), child: isLoading 
                        ? CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ) 
                        : Text("Register"),
                      );
                      },
                       
                    )
        
                  ],
                ),
              ),
        
              
            )
          ],
        ),
      ),
    );
  }
}