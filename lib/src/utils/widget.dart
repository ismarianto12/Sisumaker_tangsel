import 'package:flutter/material.dart';

class WidgetSubmitButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color buttonColor;

  const WidgetSubmitButton({
    Key key,
    this.onPressed,
    this.child,
    this.buttonColor = Colors.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      width: MediaQuery.of(context).size.width,
      height: 40.0,
      child: RaisedButton(
        padding: EdgeInsets.all(0.0),
        textColor: Colors.white,
        color: buttonColor,
        disabledColor: Colors.grey[350],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: child,
        onPressed: onPressed,
      ),
    );
  }
}

class WidgetAlertDialog extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool onWillPop;

  const WidgetAlertDialog({
    Key key,
    this.title,
    this.subtitle,
    this.onWillPop = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => onWillPop,
      child: AlertDialog(
        title: Text(title),
        content: Text(subtitle),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Kembali'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
