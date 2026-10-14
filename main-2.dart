import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blood Requests',
      theme: ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: const Color(0xFFF8F9FC),
        fontFamily: 'Roboto',
      ),
      home: const BloodRequestsPage(),
    );
  }
}

class BloodRequestsPage extends StatelessWidget {
  const BloodRequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F9FC),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Blood Requests',
          style: TextStyle(
            color: Color(0xFF172E52),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
        children: const [
          BloodRequestCard(
            bloodGroup: 'O-',
            units: 3,
          ),
          SizedBox(height: 18),
          BloodRequestCard(
            bloodGroup: 'O+',
            units: 2,
          ),
        ],
      ),
    );
  }
}

class BloodRequestCard extends StatelessWidget {
  final String bloodGroup;
  final int units;

  const BloodRequestCard({
    super.key,
    required this.bloodGroup,
    required this.units,
  });

  @override
  Widget build(BuildContext context) {
    const navyBlue = Color(0xFF153464);
    const redColor = Color(0xFFD92338);
    const greyColor = Color(0xFF788493);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: const Color(0xFFE9EDF3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 7,
                color: redColor,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      // Urgent badge and blood units
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 11,
                              vertical: 7,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFE8EA),
                              borderRadius:
                                  BorderRadius.circular(7),
                            ),
                            child: const Text(
                              'URGENT',
                              style: TextStyle(
                                color: redColor,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.water_drop,
                                color: redColor,
                                size: 18,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                '$units Units',
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF303744),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Blood group title
                      Text(
                        '$bloodGroup Blood Needed',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: navyBlue,
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Hospital location
                      const Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: greyColor,
                            size: 20,
                          ),
                          SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              'Khulna City Medical College Hospital, '
                              'KDA Avenue...',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15,
                                color: greyColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // View details button
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: navyBlue,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'View Details',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
