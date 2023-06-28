import 'package:flutter/material.dart';
import 'package:flutter_project_10/src/const/colors/colors.dart';
import 'package:flutter_project_10/src/common/custom_button.dart';




const String profileImg =
    'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: AppColor.kPrimary,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
                  color: AppColor.kPrimary,
                  height: 100,
                ),
                Positioned(
                  top: 50,
                  child: ClipOval(
                    child: Image.network(
                      profileImg,
                      height: 100,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 80),
            const Text('username'),
            const Text('Email'),
            const Text('Phone Number'),
            const SizedBox(
              height: 40,
            ),
            CustomButton(
              onPress: () {},
              text: 'Logout',
              width: 200,
            )
          ],
        ),
      ),
    );
  }
}
