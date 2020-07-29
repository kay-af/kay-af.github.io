import 'package:flutter/material.dart';

enum FlipFlopStart { Flip, Flop }

class FlipFlopText extends StatelessWidget {
  final List<String> textList;
  final TextStyle flipStyle;
  final TextStyle flopStyle;
  final FlipFlopStart startWith;
  final TextAlign textAlign;
  final TextOverflow textOverflow;

  FlipFlopText(
      {@required this.textList,
      this.flipStyle,
      this.flopStyle,
      this.textAlign,
      this.textOverflow = TextOverflow.fade,
      this.startWith = FlipFlopStart.Flip,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var align = textAlign ?? TextAlign.start;
    return RichText(
        overflow: this.textOverflow,
        textAlign: align,
        text: TextSpan(
            children: List<TextSpan>.generate(this.textList.length, (i) {
          var styles = [
            Theme.of(context).textTheme.subtitle,
            Theme.of(context)
                .textTheme
                .subtitle
                .copyWith(fontWeight: FontWeight.bold)
          ];

          if (flipStyle != null) styles[0] = flipStyle;
          if (flopStyle != null) styles[1] = flopStyle;

          return TextSpan(
              text: this.textList[i],
              style: startWith == FlipFlopStart.Flip
                  ? styles[i % 2]
                  : styles[(i + 1) % 2]);
        })));
  }
}
