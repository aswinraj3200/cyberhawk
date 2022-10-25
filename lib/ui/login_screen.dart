import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newtb1/bloc/login_bloc.dart';
import 'package:newtb1/ui/home_screen.dart';
import 'package:newtb1/ui/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var username=TextEditingController();
  var password=TextEditingController();
  @override
  Widget build(BuildContext context) {
     return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xff3A3A4D), Color(0xff13131D)]
            )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: SizedBox(
                    height: 50.0,
                    width: 400.0,
                    child: Row(
                      children: [
                        Image.asset('assets/index2.jpg'),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'CYBERHAWK',
                            style: TextStyle(
                              fontFamily: "IBMPlexSans",
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //try SIZED BOX MEDIA QUERY
                const Padding(
                  padding:  EdgeInsets.fromLTRB(10.0,100.0,0,0),
                  child:  Text(
                    'Login',
                    style: TextStyle(
                      fontFamily: "IBMPlexSans",
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
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
                          hintText: 'Name',
                          hintStyle: TextStyle(color: Colors.white)
                      ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                Padding(
                  padding:  EdgeInsets.fromLTRB(10.0,20.0,10.0,0),
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

                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(color: Colors.blueGrey,
                        fontSize: 15
                    ),
                  ),
                ),

                SizedBox(
                  height: 200.0,
                  child: Center(
                    child: SizedBox(
                      height: 50.0,
                      width: 400.0,

                      child: MaterialButton(onPressed:
                          (){


                             BlocProvider.of<LoginBloc>(context).add(VerifyPassword(
                            username: username.text,
                            password: password.text,
                          ));
                      },
                        color:Colors.yellowAccent,

                        child: BlocConsumer<LoginBloc,LoginStates>(
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


                                    const Text("Login"),


                                    Icon(Icons.arrow_forward_ios_sharp)]);
                            }
                          },
                          listener: (context,state){
                            if(state is LoginError){
                              Fluttertoast.showToast(msg: state.error.toString());

                            }
                            if(state is LoginSuccess){
                              Navigator.push(context,MaterialPageRoute(builder: ((context) => const HomeScreen())));
                            }
                          },
                      ),
                    ),

                  ),
                ),
                ),


                 Padding(
                  padding: EdgeInsets.fromLTRB(65, 0, 0, 0),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: ((context) =>  Register_Screen())));
                    },

                    child: const Text(
                      "Don't have an account? Create Account.",
                      style: TextStyle(color: Colors.blueGrey,
                          fontSize: 15
                      ),
                    ),
                  ),
                  ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
