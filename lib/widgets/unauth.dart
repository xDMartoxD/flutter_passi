import 'package:flutter/material.dart';

import '../utils/flutter_utils.dart';

class UnAuth extends StatelessWidget {
  const UnAuth({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.person_outlined,
            color: Colors.grey,
            size: 120,
          ),
          SizedBox(
              width: 240,
              child: FloatingActionButton(
                  shape: const StadiumBorder(),
                  onPressed: () => bottomSheetAuthHandler(
                        context: context,
                      ),
                  child: Text(
                    "Ingresa",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ))),
        ],
      ),
    );
  }
}
