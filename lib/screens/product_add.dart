import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:infogem_task/screens/product_view.dart';

class ProductAdd extends StatefulWidget {
  const ProductAdd({super.key});

  @override
  State<ProductAdd> createState() => _ProductAddState();
}

class _ProductAddState extends State<ProductAdd> {
  final TextEditingController nameCntrl = TextEditingController();
  final TextEditingController yearCntrl = TextEditingController();
  final TextEditingController priceCntrl = TextEditingController();
  final TextEditingController cpuCntrl = TextEditingController();
  final TextEditingController hardDiskCntrl = TextEditingController();
  saveData(String name, String year, String price, String cpuModel,
      String hardDisk) async {

    final dio = Dio();
    final response =
        await dio.post('https://api.restful-api.dev/objects', data: {
      "name": name,
      "data": {
        "year": year,
        "price": price,
        "CPU model": cpuModel,
        "Hard disk size": hardDisk
      }
    });

    print(response.data);
    // ignore: use_build_context_synchronously
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const ProductView()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Name'),
              TextFormField(
                controller: nameCntrl,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text('Year'),
              TextFormField(
                controller: yearCntrl,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text('Price'),
              TextFormField(
                controller: priceCntrl,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text('CPU Model'),
              TextFormField(
                controller: cpuCntrl,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text('Hard disk sizes'),
              TextFormField(
                controller: hardDiskCntrl,
              ),
              const SizedBox(
                height: 25,
              ),
              Center(
                  child: ElevatedButton(
                      onPressed: () {
                        if (nameCntrl.text.trim().isNotEmpty &&
                            yearCntrl.text.trim().isNotEmpty &&
                            priceCntrl.text.trim().isNotEmpty &&
                            cpuCntrl.text.trim().isNotEmpty &&
                            hardDiskCntrl.text.trim().isNotEmpty) {
                          saveData(
                              nameCntrl.text,
                              yearCntrl.text,
                              priceCntrl.text,
                              cpuCntrl.text,
                              hardDiskCntrl.text);
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Save',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
