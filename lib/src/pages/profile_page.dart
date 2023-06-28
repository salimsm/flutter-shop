import 'package:flutter/material.dart';
import 'package:flutter_project_10/src/const/colors/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Container(color: AppColor.kPrimary, height: 200),
              Positioned(
                top: 150,
                child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(150)),
                    child:const Center(child: Text('U',style: TextStyle(fontSize: 40),)),               
                        ),
              ),
            ],
          ),
          Container(
            margin:const EdgeInsets.only(top:60 ),
             child:const Text('abc@gmail.com')),
        ],
      ),
    );
  }
}
