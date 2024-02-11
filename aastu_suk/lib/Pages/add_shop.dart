import 'package:aastu_suk/features/storage_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddShop extends StatelessWidget {
  static const route = '/add_chop';

  AddShop({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController ownerController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  late String path;
  final Storage storage = Storage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Shop'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "The data you will enter here will be seen on the feed of all the users that use this app. Please make sure to enter the correct informaion.",
                  style: TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .inversePrimary
                        .withOpacity(.7),
                    fontWeight: FontWeight.w500,
                  )),
              const SizedBox(
                height: 30,
              ),
              Text("Enter the name of the business",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.w500,
                  )),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "name",
                  focusColor: Theme.of(context).colorScheme.inversePrimary,
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () => nameController.clear()),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 30,
              ),
              Text("Enter the location",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.w500,
                  )),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: locationController,
                decoration: InputDecoration(
                  hintText: "location",
                  focusColor: Theme.of(context).colorScheme.inversePrimary,
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () => locationController.clear()),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 30,
              ),
              Text("Name of the owner",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.w500,
                  )),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: ownerController,
                decoration: InputDecoration(
                  hintText: "Owner",
                  focusColor: Theme.of(context).colorScheme.inversePrimary,
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () => ownerController.clear()),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                child: const Text("Add Image of the Place"),
                color: Colors.blue.shade400,
                onPressed: () async {
                  final image = await FilePicker.platform.pickFiles(
                    allowMultiple: false,
                    type: FileType.custom,
                    allowedExtensions: ['png', 'jpg'],
                  );

                  if (image == null) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("No image has been selected")));
                  }

                  path = image!.files.single.path as String;
                  final filename = image.files.single.name;
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: MaterialButton(
          child: const Text(
            "Submit",
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.green.shade500,
          onPressed: () async {
            if (nameController.value.text == "" ||
                ownerController.value.text == "" ||
                locationController.value.text == "") {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Please fill all the text fields.")));
              return;
            } else {
              showDialog(
                  context: context,
                  builder: ((context) => const Center(
                        child: CircularProgressIndicator(),
                      )));

              try {
                String filePath = await storage.uploadImage(
                    name: nameController.value.text,
                    path: path,
                    folderName: 'shops');
                print("Image Uploaded ::::::: $filePath");

                String email =
                    FirebaseAuth.instance.currentUser!.email as String;
                await FirebaseFirestore.instance
                    .collection('Shops')
                    .doc("${nameController.value.text}id")
                    .set(
                  {
                    'Owner': ownerController.value.text,
                    'location': locationController.value.text,
                    'name': nameController.value.text,
                    'expireTime': 1,
                    'Orders': [],
                    'Products': [],
                    'image': filePath,
                    'creatorID': email,
                  },
                );
              } catch (e) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(e.toString())));
              }

              Navigator.pop(context);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("New shop created.")));
            }
          }),
    );
  }
}
