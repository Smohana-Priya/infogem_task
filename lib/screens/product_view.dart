import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  List<dynamic> data = [];
  @override
  void initState() {
    getAllProducts();
    super.initState();
  }

  getAllProducts() async {
    final dio = Dio();
    final response = await dio.get('https://api.restful-api.dev/objects');

    setState(() {
      data = response.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Name',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(data[index]['name']),
                            // const Text(
                            //   'Color',
                            //   style: TextStyle(fontWeight: FontWeight.bold),
                            // ),
                            // Text(data[index]['data'] ??
                            //     data[index]['data']['color']),
                            // const Text(
                            //   'Capacity',
                            //   style: TextStyle(fontWeight: FontWeight.bold),
                            // ),
                            // Text(data[index]['data']['capacity'] ?? ''),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              })),
    );
  }
}
