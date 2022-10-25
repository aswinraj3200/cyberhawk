import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newtb1/bloc/sign_up.dart';

import 'package:newtb1/ui/login_screen.dart';

class Register_Screen extends StatefulWidget {
  const Register_Screen({Key? key}) : super(key: key);
  

  @override
  State<Register_Screen> createState() => _Register_ScreenState();
}

class _Register_ScreenState extends State<Register_Screen> {
   var username=TextEditingController();
  var password=TextEditingController();
  var role=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'REGISTRATION',
          style: TextStyle(color: Colors.white, fontSize: 30.0),
        ),
      ),

        body: SingleChildScrollView(

          child: Column(


            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.fromLTRB(10.0,50.0,10.0,0),
                child: TextField(
                  controller: role,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1.5, color: Colors.blueGrey),
                      ),
                      prefixIcon: Icon(Icons.person,
                        color: Colors.blueGrey,),
                      hintText: 'Role',
                      hintStyle: TextStyle(color: Colors.white)
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding:  EdgeInsets.fromLTRB(10.0,50.0,10.0,0),
                child: TextField(
                  controller: username,

                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1.5, color: Colors.blueGrey),
                      ),
                      prefixIcon: Icon(Icons.person,
                        color: Colors.blueGrey,),
                      hintText: 'Phone',
                      hintStyle: TextStyle(color: Colors.white)
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding:  EdgeInsets.fromLTRB(10.0,50.0,10.0,0),
                child: TextField(
                  controller: password,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1.5, color: Colors.blueGrey),
                      ),
                      prefixIcon: Icon(Icons.key,
                        color: Colors.blueGrey,),
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.white),
                    )
                ),
              ),
              SizedBox(
                height: 50.0,
              ),



              Center(
                child: SizedBox(
                  width: 200.0,
                  height: 50.0,
                  child: ElevatedButton(onPressed: ()
                  {
                       BlocProvider.of<SignupBloc>(context).add(GetSignupevent(
                        role: role.text,
                            username: username.text,
                            password: password.text,
                            

                          ));
                  },
                  child: BlocConsumer<SignupBloc,SignupStates>(
                          builder: (context,state) {
                            if (state is Loading) {
                              return const
                              CircularProgressIndicator();
                            } else {
                              return Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: const [
                                    Text(""),


                                    const Text("Sign up"),


                                    Icon(Icons.arrow_forward_ios_sharp)]);
                            }
                          },
                          listener: (context,state){
                            if(state is SignupError){
                              Fluttertoast.showToast(msg: state.error.toString());

                            }
                            if(state is SignupSuccess){
                              Navigator.push(context,MaterialPageRoute(builder: ((context) => const LoginScreen())));
                            }
                          },
                      ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
  }
}
