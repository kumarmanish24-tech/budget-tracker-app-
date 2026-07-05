import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ex27/AddExpense_provider.dart';
import 'package:intl/intl.dart';
import 'Dbhelper.dart';
import 'Dbhelper2.dart';
import 'dataprovider.dart';
import 'dataprovider.dart';
import 'dataproviderforallExpence.dart';

class Addpage extends StatefulWidget {
  const Addpage({Key? key}) : super(key: key);

  @override
  State<Addpage> createState() => _AddpageState();
}

class _AddpageState extends State<Addpage> {
  Map<String, String>? _selectedFruit;
  final _myNote = TextEditingController();
  final _amount = TextEditingController();

  @override
  void dispose() {
    _myNote.dispose();
    _amount.dispose();
    super.dispose();
  }

  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Addexdata = context.watch<Category>();


    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: const Text(
          'Add Expense',
          style: TextStyle(color: Colors.black54),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Container(
                height: 390,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(color: Colors.black12, width: 1.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 15),
                        Text(
                          "Category",
                          style: TextStyle(fontSize: 18, color: Colors.black54),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    DropdownMenu<Map<String, String>>(
                      width: 320,
                      hintText: 'Select Category',
                      requestFocusOnTap: true,
                      enableSearch: true,
                      initialSelection: _selectedFruit,
                      leadingIcon: _selectedFruit != null
                          ? Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SizedBox(
                          child: Image.asset(
                            _selectedFruit!['img']!,
                            width: 15,
                            height: 15,
                          ),
                        ),
                      )
                          : null,
                      dropdownMenuEntries: Addexdata.fruitsWithImages.map((fruit) {
                        return DropdownMenuEntry<Map<String, String>>(
                          value: fruit,
                          label: fruit['name']!,
                          leadingIcon: Image.asset(
                            fruit['img']!,
                            width: 20,
                            height: 20,
                          ),
                        );
                      }).toList(),
                      onSelected: (Map<String, String>? newValue) {
                        setState(() {
                          _selectedFruit = newValue;
                        });
                      },
                    ),
                    const Divider(indent: 5, endIndent: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Date",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            OutlinedButton.icon(
                              onPressed: () => _selectDate(context),
                              icon: const Icon(Icons.calendar_month),
                              label: Text(
                                DateFormat('dd MMM yyyy').format(_selectedDate),
                              ),
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                  color: Colors.black54,
                                  width: 1.0,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Time",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            OutlinedButton.icon(
                              onPressed: () => _selectTime(context),
                              icon: const Icon(Icons.access_time),
                              label: Text(_selectedTime.format(context)),
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                  color: Colors.black54,
                                  width: 1.0,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(indent: 5, endIndent: 5),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 15),
                        Text(
                          "Note(Optional)",
                          style: TextStyle(fontSize: 18, color: Colors.black54),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: SizedBox(
                        height: 100,
                        width: 350,
                        child: TextField(
                          controller: _myNote,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: ' Ex lunch with friends',
                            hintStyle: TextStyle(color: Colors.black38),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 80,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(color: Colors.black12, width: 1.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 5),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 15),
                        Text(
                          "Amount",
                          style: TextStyle(fontSize: 18, color: Colors.black54),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 5),
                      child: SizedBox(
                        height: 40,
                        width: 350,
                        child: TextField(
                          controller: _amount,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Rs. 250',
                            hintStyle: TextStyle(
                              fontSize: 25.0,
                              color: Colors.black38,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 155),
              SizedBox(
                height: 50,
                width: 330,
                child: OutlinedButton(
                  onPressed: () async {
                    // 1. Check if Category is selected
                    if (_selectedFruit == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please select a category')),
                      );
                      return;
                    }

                    // 2. Check if Amount is entered
                    if (_amount.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please Enter an amount')),
                      );
                      return;
                    }

                    final AMT = double.tryParse(_amount.text) ?? 0.0;
                    final date = _selectedDate.toIso8601String().split('T')[0];
                    final categ = _selectedFruit!['name']!;


                    final insertdata = Provider.of<incomedata>(context,listen: false);

                    await insertdata.addIncomeAndRefresh(AMT, date, categ, _myNote.text);


                    // final insertalldata = Provider.of<Alldata>(context, listen:  false);
                    // await insertalldata.addIncomeAndRefresh(AMT, date, _myNote.text, categ)





                    if (mounted) {

                      Navigator.pop(context, true);
                    }
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.white, width: 1.0),
                    backgroundColor: const Color.fromRGBO(113, 82, 251, 1),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Save Expense',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

void textcolor(dynamic bg) {
  bg = const Color.fromRGBO(43, 48, 59, 0.5);
}