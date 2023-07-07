import 'package:flutter/material.dart';

class AmountCardWorker extends StatelessWidget {
  const AmountCardWorker({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.yellow,
              width: 2,
            )),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text(
                    'Current Earnings',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
                  Text(
                    'Release Date : 09 july',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            // SizedBox(
            //   height: 5,
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Weekly 03 july to 09 july',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '\$ 158',
              style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Current earnings for 2 order',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.yellow.withOpacity(.2)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Earned today',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '\$ 50',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.info,
                          color: Colors.yellow,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Complete work to earn more',
                          style: TextStyle(
                            color: Colors.yellow,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.yellow),
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                  child: Text(
                    'VIEW DAILY EARNINGS',
                    style: TextStyle(color: Colors.yellow),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
