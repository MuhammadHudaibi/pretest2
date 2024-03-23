import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pretest2/app/data/home_model.dart';
import 'package:pretest2/app/modules/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User List',
          style: GoogleFonts.poppins(), // Menggunakan font Poppins
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Action untuk merefresh aplikasi
              controller.fetchHomeModel(); // Memanggil fungsi fetchHomeModel untuk merefresh
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Obx(
        () => controller.homeModel.value.results.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: controller.homeModel.value.results.length,
                itemBuilder: (context, index) {
                  return ProfileItem(user: controller.homeModel.value.results[index]);
                },
              ),
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  final Result user;

  ProfileItem({required this.user});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Action ketika item dipilih
        // Misalnya, Anda dapat menambahkan navigasi ke halaman detail profil
      },
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user.picture.large),
            ),
            SizedBox(width: 24),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${user.name.first} ${user.name.last}',
                    style: GoogleFonts.poppins( // Menggunakan font Poppins
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '${user.location.city}, ${user.location.country}',
                    style: GoogleFonts.poppins( // Menggunakan font Poppins
                      fontStyle: FontStyle.italic,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.person, color: Colors.blue, size: 24),
                      SizedBox(width: 8),
                      Text(
                        'Gender: ${user.gender}',
                        style: GoogleFonts.poppins( // Menggunakan font Poppins
                          color: Colors.blue,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
