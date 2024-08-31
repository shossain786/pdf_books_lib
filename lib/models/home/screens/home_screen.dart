import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pdf_books_lib/models/home/widgets/app_drawer.dart';
import 'package:pdf_books_lib/models/pdf_books/screens/display_books.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedLanguage = 'en';

  void changeLanguage(String languageCode) {
    setState(() {
      _selectedLanguage = languageCode;
      context.setLocale(Locale(languageCode));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          DropdownButton<String>(
            value: _selectedLanguage,
            underline: Container(),
            isDense: false,
            dropdownColor: Colors.red,
            borderRadius: BorderRadius.circular(20.0),
            items: const [
              DropdownMenuItem(
                value: 'en',
                child: Text(
                  'English',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  ),
                ),
              ),
              DropdownMenuItem(
                value: 'hi',
                child: Text(
                  'Hindi',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  ),
                ),
              ),
              DropdownMenuItem(
                value: 'bn',
                child: Text(
                  'Bengali',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
            onChanged: (String? newValue) {
              if (newValue != null) {
                changeLanguage(newValue);
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'title',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.purple,
                ),
              ).tr(),
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/pic1.png',
                width: MediaQuery.sizeOf(context).width,
                height: 500,
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  debugPrint('Button pressed............................');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DisplayBooksScreen(),
                      ));
                },
                label: const Text('library').tr(),
                icon: const Icon(
                  Icons.menu_book_outlined,
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: const MyDarwerScreen(),
    );
  }
}
