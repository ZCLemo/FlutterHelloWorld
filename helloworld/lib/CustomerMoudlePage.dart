import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class CustomerMoudlePage extends StatefulWidget{
  @override
  CustomerMoudlePageState createState() {
    return CustomerMoudlePageState();
  }

}

class CustomerMoudlePageState extends State<CustomerMoudlePage>{

  double _turns = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("自定义组件"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[

            GradientButton(
              colors: [Colors.orange,Colors.red],
              onPressed: onTap,
              child: Text("点我旋转"),
              height: 50.0,
              width: 200.0,
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
              canEnable: true,
            ),
            
            TurnBox(
              turns: _turns,
              speed: 500,
              child: Icon(Icons.refresh,size: 50),
            ),

            CustomPaint(
              size: Size(300,300),
              painter: MyPainter(),
            ),

          ],
        ),
      ),

    );
  }

  onTap() {
    print("button click");
    setState(() {
      _turns -= .5;
    });
  }

}

class GradientButton extends StatelessWidget{

  //渐变色数组
  final List<Color> colors;

  //宽高
  final double width;
  final double height;

  final Widget child;
  final BorderRadius borderRadius;

  final GestureTapCallback onPressed;

  final bool canEnable;

  GradientButton({
    this.colors,
    this.width,
    this.height,
    this.onPressed,
    this.borderRadius,
    this.canEnable,
    @required
    this.child,
  });

  @override
  Widget build(BuildContext context) {

    ThemeData theme = Theme.of(context);

    List<Color> _colors = colors ?? [theme.primaryColor,theme.primaryColorDark];

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: _colors),
        borderRadius: borderRadius,
      ),

      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashColor: _colors.last,
          highlightColor: Colors.transparent,
          borderRadius: borderRadius,
          onTap: canEnable ? onPressed : (){},
          enableFeedback: canEnable,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: height,width: width),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultTextStyle(
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),

    );
  }

}

class TurnBox extends StatefulWidget{

  final double turns;
  final int speed;
  final Widget child;

  const TurnBox({
    Key key,
    this.turns = .0,//旋转的“圈”数,一圈为360度，如0.25圈即90度
    this.speed = 200,//过渡动画执行的总时长 （毫秒）
    this.child,
  }) : super(key : key);

  @override
  TurnBoxState createState() {
    return TurnBoxState();
  }

}

class TurnBoxState extends State<TurnBox> with SingleTickerProviderStateMixin{

  AnimationController _controller;

  @override
  void initState() {

    _controller = new AnimationController(
      vsync: this,
      lowerBound: - double.infinity,
      upperBound: double.infinity,
    );
    _controller.value = widget.turns;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: widget.child,
    );
  }

  @override
  void didUpdateWidget(TurnBox oldWidget) {

    if(oldWidget.turns != widget.turns){
      _controller.animateTo(
        widget.turns,
        duration: Duration(milliseconds: widget.speed ?? 200),
        curve: Curves.easeOut,
      );
    }
    
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

}

class MyPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    double eWidth = size.width/15;
    double eHeight = size.height/15;

    //画棋盘背景
    var paint = Paint();
    paint.isAntiAlias = true;
    paint.style = PaintingStyle.fill;
    paint.color = Color(0x77cdb175);
    canvas.drawRect(Offset.zero & size, paint);

    //画棋盘网格
    paint
    ..style = PaintingStyle.stroke
    ..color = Colors.black87
    ..strokeWidth = 1.0;

    for(int i= 0;i<=15;i++){
      double dy = eHeight * i;
      canvas.drawLine(Offset(0,dy), Offset(size.width,dy), paint);

      double dx = eWidth * i;
      canvas.drawLine(Offset(dx,0), Offset(dx,size.height), paint);
    }

    //画一个黑子
    paint
      ..style = PaintingStyle.fill
      ..color = Colors.black;
    canvas.drawCircle(
      Offset(size.width / 2 - eWidth / 2, size.height / 2 - eHeight / 2),
      min(eWidth / 2, eHeight / 2) - 2,
      paint,
    );

    //画一个白子
    paint.color = Colors.white;
    canvas.drawCircle(
      Offset(size.width / 2 + eWidth / 2, size.height / 2 - eHeight / 2),
      min(eWidth / 2, eHeight / 2) - 2,
      paint,
    );

  }


  //是否需要重新绘制
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}