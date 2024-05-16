import 'package:all_in_one_flutter/core/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:pagination_flutter/pagination.dart';

class BasicPaginationScreen extends StatefulWidget {
  const BasicPaginationScreen({super.key});

  @override
  State<BasicPaginationScreen> createState() => _BasicPaginationScreenState();
}

class _BasicPaginationScreenState extends State<BasicPaginationScreen> {
  int selectedPage = 1;

  @override
  Widget build(BuildContext context) {
    return Parents(
      title: 'Basic Pagination',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Pagination(
            numOfPages: 10,
            selectedPage: selectedPage,
            pagesVisible: 3,
            onPageChanged: (page) {
              setState(() {
                selectedPage = page;
              });
            },
            nextIcon: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.blue,
              size: 14,
            ),
            previousIcon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.blue,
              size: 14,
            ),
            activeTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
            activeBtnStyle: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(38),
                ),
              ),
            ),
            inactiveBtnStyle: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(38),
              )),
            ),
            inactiveTextStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
