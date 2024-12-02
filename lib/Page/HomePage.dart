import 'package:flutter/material.dart';
import '../Models/Contact.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Contact> contact = List.empty(growable: true);
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  int selectIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Todo List",
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.blue[400]),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Contact Name',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 17, horizontal: 15),
                hintStyle: TextStyle(color: Colors.black12, fontSize: 20),
                prefixIcon: Icon(Icons.account_circle),
                filled: true,
                fillColor: Color(0xFFedf0f8),
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(25),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.blue),
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              focusNode: null,
            ),
            SizedBox(height: 15),
            TextField(
              controller: numberController,
              keyboardType: TextInputType.number,
              maxLength: 10,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.numbers),
                hintText: 'Contact Number',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 17, horizontal: 15),
                hintStyle: TextStyle(color: Colors.black12, fontSize: 20),
                filled: true,
                fillColor: Color(0xFFedf0f8),
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(25),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.blue),
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              focusNode: null,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    String name = nameController.text.trim();
                    String number = numberController.text.trim();
                    if (name.isNotEmpty && number.isNotEmpty) {
                      setState(() {
                        nameController.text = '';
                        numberController.text = '';
                        contact.add(
                          Contact(name: name, number: number),
                        );
                      });
                    } else {
                      print('vui long nhap du thong tin');
                    }
                  },
                  child: const Text("Save"),
                ),
                ElevatedButton(
                  onPressed: () {
                    String name = nameController.text.trim();
                    String number = numberController.text.trim();
                    if (name.isNotEmpty && number.isNotEmpty) {
                      setState(() {
                        nameController.text = '';
                        numberController.text = '';
                        contact[selectIndex].name = name;
                        contact[selectIndex].number = number;
                        // contact.add(Contact(name: name, number: number));
                        selectIndex = -1;
                      });
                    }
                  },
                  child: const Text("Update"),
                ),
              ],
            ),
            SizedBox(height: 15),
            contact.isEmpty
                ? const Text(
                    "No Contact Yet...",
                    style: TextStyle(fontSize: 20),
                  )
                : Expanded(
                    child: ListView.builder(
                        itemCount: contact.length,
                        itemBuilder: (context, index) => getRow(index)),
                  ),
          ],
        ),
      ),
    );
  }

  Widget getRow(int index) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: index % 2 == 0 ? Colors.green : Colors.yellow,
          child: Text(contact[index].name[0]),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(contact[index].name),
            Text(contact[index].number),
          ],
        ),
        trailing: SizedBox(
          width: 70,
          child: Row(
            children: [
              InkWell(
                  onTap: () {
                    nameController.text = contact[index].name;
                    numberController.text = contact[index].number;
                    selectIndex = index;
                  },
                  child: const Icon(Icons.edit)),
              InkWell(
                onTap: (() {
                  setState(() {
                    contact.removeAt(index);
                    numberController.text = '';
                    nameController.text = '';
                  });
                }),
                child: const Icon(Icons.delete),
              )
            ],
          ),
        ),
      ),
    );
  }
}
