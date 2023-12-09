import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: DevelopersScreen(),
    );
  }
}

class DevelopersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Desarrolladores'),
        backgroundColor: Color.fromARGB(255, 47, 12, 165),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Desarrolladores',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              DeveloperCard(
                name: 'Yelsin Alberto Sánchez',
                role: 'Flutter Developer',
                photoUrl: 'assets/developers/Yelsin.jpeg',
                backgroundImageUrl:
                    'assets/bg/bg_Yelsin.jpg', // Cambia esta URL por la imagen que deseas
                socialLinks: {
                  'Github': 'https://www.linkedin.com/',
                  'Instagram': 'https://github.com/',
                },
              ),
              SizedBox(height: 16),
              DeveloperCard(
                name: 'Yency Julieth Ortega',
                role: 'UI/UX Designer',
                photoUrl: 'assets/developers/Yency.jpeg',
                backgroundImageUrl: 'assets/bg/bg_Yency.jpg',
                socialLinks: {
                  'Facebook': 'https://www.linkedin.com/',
                  'Instagram': 'https://www.behance.net/',
                },
              ),
              SizedBox(height: 16),
              DeveloperCard(
                name: 'Angie Suyapa Lemus',
                role: 'Backend Developer',
                photoUrl: 'assets/developers/Angie.jpeg',
                backgroundImageUrl: 'assets/bg/bg_Angie.jpg',
                socialLinks: {
                  'Facebook': 'https://www.linkedin.com/',
                  'Instagram': 'https://www.behance.net/',
                },
              ),
              SizedBox(height: 16),
              DeveloperCard(
                name: 'Katheryn Pamela Hernandez',
                role: 'Mobile App Developer',
                photoUrl: 'assets/developers/Pamela.jpeg',
                backgroundImageUrl: 'assets/bg/bg_Pamela.jpg',
                socialLinks: {
                  'Facebook': 'https://www.linkedin.com/',
                  'Instagram': 'https://www.behance.net/',
                },
              ),
              SizedBox(height: 16),
              DeveloperCard(
                name: 'Sussan Michell Hernandez',
                role: 'Frontend Developer',
                photoUrl: 'assets/developers/Sussan.jpeg',
                backgroundImageUrl: 'assets/bg/bg_Sussan.jpg',
                socialLinks: {
                  'Facebook': 'https://www.linkedin.com/',
                  'Instagram': 'https://www.behance.net/',
                },
              ),
              SizedBox(height: 16),
              DeveloperCard(
                name: 'Cintya Paola Herrera',
                role: 'QA Engineer',
                photoUrl: 'assets/developers/Cintya.jpeg',
                backgroundImageUrl: 'assets/bg/bg_Cintya.jpg',
                socialLinks: {
                  'Facebook': 'https://www.linkedin.com/',
                  'Instagram': 'https://www.behance.net/',
                },
              ),
              SizedBox(height: 16),
              DeveloperCard(
                name: 'Nelson Geovanny Izaguirre',
                role: 'Project Manager',
                photoUrl: 'assets/developers/Nelson.jpeg',
                backgroundImageUrl: 'assets/bg/bg_Nelson.jpg',
                socialLinks: {
                  'Facebook': 'https://www.linkedin.com/',
                  'Instagram': 'https://www.behance.net/',
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DeveloperCard extends StatelessWidget {
  final String name;
  final String role;
  final String photoUrl;
  final String backgroundImageUrl;
  final Map<String, String> socialLinks;

  DeveloperCard({
    required this.name,
    required this.role,
    required this.photoUrl,
    required this.backgroundImageUrl,
    required this.socialLinks,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Stack(
        children: [
          // Fondo de la mitad inferior con imagen
          Container(
            height: 75, // Ajusta según sea necesario
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0)),
              image: DecorationImage(
                image: AssetImage(backgroundImageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(photoUrl),
                ),
                SizedBox(height: 10),
                Text(
                  name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  role,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ...socialLinks.entries.map(
                      (entry) => ElevatedButton.icon(
                        onPressed: () {
                          // Acción al hacer clic en el botón de la red social
                          // Utiliza el paquete url_launcher para abrir enlaces
                        },
                        icon: Icon(getSocialIcon(entry.key)),
                        label: Text(entry.key),
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 47, 12, 165),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconData getSocialIcon(String socialName) {
    switch (socialName.toLowerCase()) {
      case 'facebook':
        return Icons.facebook;
      case 'github':
        return Icons.code;
      case 'instagram':
        return Icons.camera_alt_rounded;
      default:
        return Icons.link;
    }
  }
}
