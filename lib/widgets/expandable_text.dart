import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ExpandableText extends StatelessWidget {
  final String? content;
  const ExpandableText(
    this.content, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.rectangle,
              ),
            ),
            ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                    tapBodyToCollapse: true,
                    iconColor: Colors.white),
                header: const Padding(
                  padding: EdgeInsets.all(10),
                ),
                collapsed: Text(
                  content ?? "",
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                expanded: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      content ?? "",
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    )),
                builder: (_, collapsed, expanded) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: const ExpandableThemeData(crossFadePoint: 0),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
