import 'package:flutter/material.dart';
import 'package:fp_tpm/pages/widgets/history_list.dart';
import 'package:fp_tpm/pages/widgets/home_appbar.dart';
import 'package:fp_tpm/pages/widgets/searchbox.dart';
import 'package:fp_tpm/pages/widgets/slider.dart';
import 'package:fp_tpm/models/api_source.dart';
import 'package:fp_tpm/models/currency.dart';
import 'package:fp_tpm/data/currency.dart';
import 'package:get_storage/get_storage.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _HomePageState();
}

class _HomePageState extends State<MainHomePage> {
  late TextEditingController _currencyController;
  int currentSlide = 0;
  int currentPageIndex = 0;
  late double price;
  String currency = 'IDR';
  late Map<String, double> conversionRates;

  @override
  void initState() {
    super.initState();
    _currencyController = TextEditingController();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeAppBar(),
                SizedBox(height: 15),
                SearchField(),
                SizedBox(height: 15),
                HomeSlider(
                  onChange: (value) => {
                    setState(() {
                      currentSlide = value;
                    }),
                  },
                  currentSlide: currentSlide,
                ),
                SizedBox(height: 25),

                /* 
                Center(child: creditCard(context)),
                SizedBox(height: 25), */

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Special For You',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                _currencyDropdown(currency, _currencyController),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 15),
                      anyItem(context, 'Paypal', 'Lorem Ipsum ajahh', 12000),
                      const SizedBox(height: 15),
                      anyItem(context, 'Shopeepay', 'Lorem Ipsum ajahh', 10000),
                      const SizedBox(height: 15),
                      anyItem(context, 'Withdraw', 'Lorem Ipsum ajahh', 150000),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  DropdownMenu<String> _currencyDropdown(String selectedValue, TextEditingController controller) {
    return DropdownMenu<String>(
      controller: controller,
      initialSelection: selectedValue,
      enableSearch: false,
      enableFilter: false,
      requestFocusOnTap: false,
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: Colors.grey.shade600),
        ),
      ),
      onSelected: (String? value) {
        setState(() {
          currency = value!;
          _loadCurrency();
        });
      },
      dropdownMenuEntries: currencyCodes.map<DropdownMenuEntry<String>>(
        (String code) {
          return DropdownMenuEntry<String>(
            value: code,
            label: code,
          );
        },
      ).toList(),
    );
  }

  void _loadCurrency() {
    ApiDataSource.exchange().then((data) {
      setState(() {
        conversionRates =
            Currency.fromJson(data).conversionRates! as Map<String, double>;
      });
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $error')),
      );
    });
  }
}
