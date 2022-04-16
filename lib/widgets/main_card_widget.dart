import 'package:flutter/material.dart';
import 'package:gerenciamento_loja/constants/colors.dart';

class MainCard extends StatelessWidget {
  final String title;
  final Widget body;

  const MainCard({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            color: AppColors.babyPink,
            alignment: Alignment.center,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.burgundy,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: body,
          )
        ],
      ),
    );
  }
}
