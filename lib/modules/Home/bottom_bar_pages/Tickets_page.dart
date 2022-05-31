import 'package:flutter/material.dart';

import '../../../shared/themes/app_colors.dart';
import '../../../shared/widgets/bottom_sheet/bottom_sheet.dart';
import '../../../shared/widgets/bottom_sheet/card_ticket.dart';
import '../../../shared/widgets/bottom_sheet/ticket.dart';

class TicketsPage extends StatefulWidget {
  const TicketsPage({Key? key}) : super(key: key);

  @override
  State<TicketsPage> createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:

          // ListView(
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Column(
          //         children: const [
          //           CardTicket(),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),

          SafeArea(
        child: RefreshIndicator(
          color: AppColors.accent,
          onRefresh: () async {},
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            padding: const EdgeInsets.all(8),
            itemCount: 7,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context) {
                      return Container(
                        height: MediaQuery.of(context).size.height - 200.0,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0),
                          ),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: const TicketWidget(
                            width: 350,
                            height: 400,
                            isCornerRounded: true,
                            padding: EdgeInsets.all(32),
                            child: TicketData(),
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  );
                },
                child: const CardTicket(),
              );
            },
          ),
        ),
      ),
    );
  }
}
