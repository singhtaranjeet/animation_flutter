import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{
  AnimationController _animationController;
  AnimationController _animationController2;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 50),
      vsync: this,
      lowerBound: 0,
      upperBound: 0.1,
    )..addListener((){
      setState((){});
    });;

    _animationController2 = AnimationController(
      duration: Duration(milliseconds: 50),
      vsync: this,
      lowerBound: 0,
      upperBound: 0.1,
    )..addListener((){
      setState((){});
    });

  }

  @override
  void dispose(){
    _animationController.dispose();
    _animationController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double  scale1 = 1 + _animationController.value;
    double scale2 = 1 + _animationController2.value;
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;


    return Scaffold(
      body: Container(
        height: h,
        width: w,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.orange,
                Colors.red,
              ]
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: h/4,
            ),
            Text('MyApp', style: TextStyle(
                fontSize: 32, color: Colors.white, fontFamily: 'Pacifico',
                fontWeight: FontWeight.w600
            ),),
            SizedBox(
              height: h/5,
            ),
            Text('Sign In\nvia', textAlign: TextAlign.center, style: TextStyle(
                color: Colors.white, fontFamily: 'Roboto', fontSize: 18, fontWeight: FontWeight.bold
            ),),
            SizedBox(height: h*0.05),


            GestureDetector(
              onTapUp: onTapUp,
              onTapDown: onTapDown,
              onTapCancel: onTapCancel,
              child: Transform.scale(
                scale: scale1,
                child: Container(
                  alignment: Alignment.center,
                  height: h/15,
                  width: w/2,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)
                  ),
                  child: Container(
                      alignment: Alignment.center,
                      height: h/20,
                      child: Image.asset('images/gLogo.png', fit: BoxFit.contain,)),
                ),
              ),
            ),



            SizedBox(height: h*0.03,),
            Text('or', textAlign: TextAlign.center, style: TextStyle(
                color: Colors.white, fontFamily: 'Roboto', fontSize: 18, fontWeight: FontWeight.bold
            ),),
            SizedBox(height: h*0.03,),



            GestureDetector(
              onTapUp: onTapUp2,
              onTapDown: onTapDown2,
              onTapCancel: onTapCancel2,
              child: Transform.scale(
                scale: scale2,
                child: Container(
                  alignment: Alignment.center,
                  height: h/15,
                  width: w/2,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)
                  ),
                  child: Container(
                      alignment: Alignment.center,
                      height: h/10,
                      child: Image.asset('images/fLogo.png', fit: BoxFit.contain,)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  onTapUp(TapUpDetails details){
    _animationController.reverse();
  }
  onTapDown(TapDownDetails details){
    _animationController.forward();
  }
  onTapCancel(){
    _animationController.reverse();
  }
  onTapUp2(TapUpDetails details){
    _animationController2.reverse();
  }
  onTapDown2(TapDownDetails details){
    _animationController2.forward();
  }
  onTapCancel2(){
    _animationController2.reverse();
  }

}
