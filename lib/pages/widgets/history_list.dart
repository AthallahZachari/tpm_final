import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget anyItem(BuildContext context, String title, String desc, int value) {
  return Container(
    width: MediaQuery.of(context).size.width * .9,
    height: 100,
    padding: EdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
      color: Colors.grey[100],
      borderRadius: BorderRadius.all(Radius.circular(10)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(.5),
          blurRadius: 7, 
          spreadRadius: 1.5,
          offset: Offset(2.0, 2.0)
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.profile_circled,
              size: 50,
            ),
            const SizedBox(width: 20),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    desc,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            Icon(
              CupertinoIcons.money_dollar,
              size: 16,
              color: Colors.black,
              weight: 200,
            ),
            Text(
              value.toString(),
              style: TextStyle(
                  color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold
                ),
            ),
          ],
        ),
        

      ],
    ),
  );
}
