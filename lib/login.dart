import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animated_login_ui/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  bool isLogin = true;
  late Animation<double> containerSize;
  late AnimationController animationController;
  Duration animationDuration = Duration(milliseconds: 270);

  @override
  void initState() {
    super.initState();
    // SystemChrome.setEnabledSystemUIMode(
    //   SystemUiMode.manual,
    //   overlays: [SystemUiOverlay.top],
    // );

    animationController = AnimationController(
      vsync: this,
      duration: animationDuration,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double viewInset = MediaQuery.of(context).viewInsets.bottom;
    double defaultLoginSize = size.height - (size.height * 0.2);
    double defaultRegisterSize = size.height - (size.height * 0.1);

    containerSize = Tween<double>(
            begin: size.height * 0.1, end: defaultRegisterSize)
        .animate(
            CurvedAnimation(parent: animationController, curve: Curves.linear));

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            //Login form
            AnimatedOpacity(
              opacity: isLogin ? 1.0 : 0.0,
              duration: animationDuration * 4,
              child: Align(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Container(
                    width: size.width,
                    height: defaultLoginSize,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome Back',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(height: 30),
                        Image.asset('assets/images/login.png'),
                        SizedBox(height: 40),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding:
                              EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                          width: size.width * 0.8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: kPrimaryColor.withAlpha(50)),
                          child: TextField(
                            cursorColor: kPrimaryColor,
                            decoration: InputDecoration(
                                icon: Icon(Icons.email, color: kPrimaryColor),
                                hintText: 'Username',
                                border: InputBorder.none),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding:
                              EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                          width: size.width * 0.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: kPrimaryColor.withAlpha(50),
                          ),
                          child: TextField(
                            cursorColor: kPrimaryColor,
                            decoration: InputDecoration(
                              icon: Icon(Icons.lock, color: kPrimaryColor),
                              hintText: 'Password',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            alignment: Alignment.center,
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            width: size.width * 0.8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            AnimatedBuilder(
              animation: animationController,
              builder: (context, child) {
                return buildRegisterContainer();
              },
            ),

            AnimatedOpacity(
              opacity: isLogin ? 0.0 : 1.0,
              duration: animationDuration * 5,
              child: Visibility(
                visible: !isLogin,
                child: Align(
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    child: Container(
                      width: size.width,
                      height: size.height,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Welcome',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          SizedBox(height: 30),
                          Image.asset(
                            'assets/images/login.png',
                          ),
                          SizedBox(height: 40),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 5),
                            width: size.width * 0.8,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: kPrimaryColor.withAlpha(50)),
                            child: TextField(
                              cursorColor: kPrimaryColor,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.email, color: kPrimaryColor),
                                  hintText: 'Username',
                                  border: InputBorder.none),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 5),
                            margin: EdgeInsets.symmetric(vertical: 10),
                            width: size.width * 0.8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: kPrimaryColor.withAlpha(50),
                            ),
                            child: TextField(
                              cursorColor: kPrimaryColor,
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.face_rounded,
                                  ),
                                  hintText: 'Name',
                                  border: InputBorder.none),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 5),
                            width: size.width * 0.8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: kPrimaryColor.withAlpha(50),
                            ),
                            child: TextField(
                              cursorColor: kPrimaryColor,
                              decoration: InputDecoration(
                                icon: Icon(Icons.lock, color: kPrimaryColor),
                                hintText: 'Password',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(30),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              alignment: Alignment.center,
                              child: Text(
                                'SIGN UP',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: kPrimaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            //  Cancel Button

            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: size.width,
                height: size.height * 0.1,
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: Icon(Icons.close),
                  onTap: () {
                    //  Navigator.pop(context);
                    animationController.reverse();
                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
                  // color: kPrimaryColor,
                ),
              ),
            ),
          ],
        ));
  }

  Widget buildRegisterContainer() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: containerSize.value,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(100),
            topRight: Radius.circular(100),
          ),
          color: kBackgroundColor,
        ),
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
            setState(() {
              isLogin = !isLogin;
              animationController.forward();
            });
          },
          child: isLogin
              ? Text(
                  "Don't have an account?, Sign Up",
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 15,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
