import 'package:flutter/cupertino.dart';

class SlideWidget extends StatefulWidget {

   final Widget child;
   final Offset begin;
    final Offset end;

  const SlideWidget({
    super.key,
    required this.child,
    required this.begin,
    required this.end,
  });

  @override
  State<SlideWidget> createState() => _SlideWidget();
}

class _SlideWidget extends State<SlideWidget>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
      duration: Duration(milliseconds: 2000)
    );
    _animation = Tween<Offset>(
      begin: widget.begin,
      end: widget.end
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut
    ));

    _controller.forward();

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return SlideTransition(
        position: _animation,
      child: widget.child,
    );
  }
}
