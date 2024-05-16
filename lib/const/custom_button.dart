import 'package:flutter/material.dart';
import 'package:treasure_book/const/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final double borderRadius;
  final double padding;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = const Color.fromRGBO(238, 159, 33, 1),
    this.textColor = Colors.white,
    this.borderRadius = 8.0,
    this.padding = 16.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: color,
          onPrimary: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: EdgeInsets.all(padding),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}




class CustomOutlinedButton extends StatelessWidget {
  final imagePath;
  final String text;
  final VoidCallback onPressed;
  final double padding;

  const CustomOutlinedButton({
    Key? key,
    required this.imagePath,
    required this.text,
    required this.onPressed,
    this.padding = 16.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        side:MaterialStateProperty.all(
        BorderSide(color: Appcolor.orange)
      ),
      ),

      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              width: 24,
              height: 24, // Optionally apply color to the image
            ),
            SizedBox(width: 20,),
            Text(
              text,
              style:
              TextStyle(color:Appcolor.lightGrey,
              fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class SignupText extends StatelessWidget {
  final VoidCallback onTap;

  const SignupText({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RichText(
        text: TextSpan(
          text: 'Don\'t have an account? ',
          style: TextStyle(
            color:Appcolor.lightGrey,
          ),
          children: <TextSpan>[
            TextSpan(
              text: 'Sign up',
              style: TextStyle(
                color:Appcolor.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class LoginText extends StatelessWidget {
  final VoidCallback onTap;

  const LoginText({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RichText(
        text: TextSpan(
          text: 'Already have an account? ',
          style: TextStyle(
            color:Appcolor.lightGrey,
          ),
          children: <TextSpan>[
            TextSpan(
              text: 'Log in',
              style: TextStyle(
                color:Appcolor.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}




