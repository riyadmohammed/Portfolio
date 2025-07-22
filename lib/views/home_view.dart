import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:flutter/services.dart' show rootBundle;

import 'components/top_navbar.dart';
import 'components/project_grid.dart';
import 'components/skills_section.dart';
import 'components/contact_form.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  // Download resume
  static Widget resumeDownloadButton() {
    return ElevatedButton.icon(
      icon: const Icon(Icons.download),
      label: const Text("Download Resume"),
      onPressed: () async {
        final data = await rootBundle.load('assets/resume.pdf');
        final blob = html.Blob([data.buffer.asUint8List()]);
        final url = html.Url.createObjectUrlFromBlob(blob);
        final anchor = html.AnchorElement(href: url)
          ..setAttribute("download", "Riyadh_Resume.pdf")
          ..click();
        html.Url.revokeObjectUrl(url);
      },
    );
  }

  Widget sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 32, bottom: 16),
      child: Text(
        title,
        style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🌟 Intro Animation
          Image.asset(
            'assets/intro.gif',
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 👋 Greeting
                const Text(
                  'Hi, I’m Riyadh 👋',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Flutter Developer • UI/UX Lover • Firebase Enthusiast',
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
                const SizedBox(height: 20),

                Wrap(
                  spacing: 12,
                  children: [
                    ElevatedButton.icon(
                      icon: const Icon(Icons.email),
                      label: const Text("Hire Me"),
                      onPressed: () {
                        html.window.open(
                          'mailto:your.email@example.com?subject=Job%20Opportunity',
                          '_blank',
                        );
                      },
                    ),
                    resumeDownloadButton(),
                  ],
                ),

                // 👨‍💼 About
                sectionHeader("About Me"),
                const Text(
                  "I'm a passionate Flutter developer with over 3 years of experience building apps "
                      "for startups and clients globally. I specialize in clean UI, Firebase integration, "
                      "and fast delivery. Based in Malaysia 🇲🇾.",
                  style: TextStyle(fontSize: 16),
                ),

                // 🚀 Skills
                sectionHeader("Skills"),
                const SkillsSection(),

                // 📂 Projects
                sectionHeader("Projects"),
                const ProjectGrid(),

                // ✉️ Contact
                sectionHeader("Contact Me"),
                const ContactForm(),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const TopNavBar(),
          Expanded(child: buildBody()),
        ],
      ),
    );
  }
}
