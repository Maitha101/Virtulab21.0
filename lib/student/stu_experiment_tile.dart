import 'package:flutter/material.dart';

class ExperimentOptionTile extends StatefulWidget {
  final String option, optionName, correctAnswer, optionSelected;
  ExperimentOptionTile({
    this.correctAnswer,
    this.option,
    this.optionName,
    this.optionSelected,
  });
  @override
  _ExperimentOptionTileState createState() => _ExperimentOptionTileState();
}

class _ExperimentOptionTileState extends State<ExperimentOptionTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: widget.optionSelected == widget.optionName
                    ? widget.optionName == widget.correctAnswer
                        ? Colors.green.withOpacity(0.7)
                        : Colors.red.withOpacity(0.7)
                    : Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: widget.optionSelected == widget.optionName
                      ? widget.optionName == widget.correctAnswer
                          ? Colors.green.withOpacity(0.7)
                          : Colors.red.withOpacity(0.7)
                      : Colors.grey,
                )),
            child: Text(
              "${widget.option}",
              style: TextStyle(
                color: widget.optionSelected == widget.optionName
                    ? Colors.white
                    : Colors.black54,
              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            widget.optionName,
            style: TextStyle(fontSize: 17, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
