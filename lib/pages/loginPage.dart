import 'package:flutter/material.dart';
import 'package:foodfast/data/Theme/AppColors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body:
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("MindWell",style: TextStyle(fontFamily: "VintageKing", fontSize: 80.0, color: AppColors.quaternaryColor),),
                    ],
                  )),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                        child: FilledButton(onPressed: (){
                          Navigator.of(context).pushNamed("/home");
                        }, style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white), elevation: MaterialStatePropertyAll(8.0)), child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 20.0, top: 5, bottom: 5),
                                child: Image.network("https://cdn-icons-png.flaticon.com/512/2991/2991148.png", width: 35, height: 35,),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 20.0),
                                child: Text("Ingresar con Google", style: TextStyle(color: Colors.black),),
                              ),
                            ],
                          ),
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                        child: FilledButton(onPressed: (){
                          Navigator.of(context).pushNamed("/home");
                        }, style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 74, 110, 168)), elevation: MaterialStatePropertyAll(8.0)), child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 15.0),
                                child: Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/Facebook-icon-1.png/640px-Facebook-icon-1.png", width: 40.0, height: 40.0,),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: Text("Ingresar con Facebook"),
                              ),
                            ],
                          ),
                        ),),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 20.0),
                        child: Divider(thickness: 4,),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                        child: FilledButton(onPressed: (){
                          Navigator.of(context).pushNamed("/home");
                        },
                         style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(AppColors.quinaryColor), elevation: MaterialStatePropertyAll(3)),
                         child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(left: 2,right: 13.0, top: 5, bottom: 5),
                              child: Icon(Icons.phone, size: 35, color: AppColors.primaryColor,),
                            ),
                            Text("Ingresar con mi número", style: TextStyle(color: AppColors.primaryColor)),
                          ],
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                        child: TextButton(onPressed: (){
                          Navigator.of(context).pushNamed("/home");
                        }, child: const Text("No tienes cuenta? Registrate", style: TextStyle(color: AppColors.quinaryColor))),
                      ),
                    ],),
                  )
                ],
              ),
            ),
          ],
        )
    );
  }
}
