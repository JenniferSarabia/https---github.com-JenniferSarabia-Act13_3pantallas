import 'package:flutter/material.dart';

class Pagina1 extends StatelessWidget {
  const Pagina1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE1E9F8),
      // --- APPBAR IGUAL A LA HOME ---
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: const Color(0xFF004691),
        foregroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 30),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: const Icon(Icons.storefront, color: Color(0xFF004691), size: 20),
            ),
            const SizedBox(width: 8),
            const Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("URBA Y FLOW", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
                  Text("Estilo callejero", style: TextStyle(fontSize: 9)),
                ],
              ),
            ),
            const SizedBox(width: 10),
            // Barra de búsqueda
            Expanded(
              flex: 3,
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const TextField(
                  style: TextStyle(color: Colors.white, fontSize: 12),
                  decoration: InputDecoration(
                    hintText: "Buscar...",
                    hintStyle: TextStyle(color: Colors.white70),
                    prefixIcon: Icon(Icons.search, color: Colors.white70, size: 18),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(bottom: 12),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            const Text("Hola invitado", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.account_circle, size: 30)),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "COLECCIONES DISPONIBLES",
              style: TextStyle(
                fontSize: 22, 
                fontWeight: FontWeight.w900, 
                color: Color(0xFF002D5E),
                letterSpacing: 1.0
              ),
            ),
            const SizedBox(height: 25),
            Wrap(
              spacing: 20,
              runSpacing: 25,
              alignment: WrapAlignment.center,
              children: const [
                CollectionCard(
                  title: "URBAN ESSENTIALS", 
                  season: "Otoño-Invierno",
                  imageUrl: "https://images.unsplash.com/photo-1611591437281-460bfbe1220a?q=80&w=500",
                ),
                CollectionCard(
                  title: "TECHWEAR DROP", 
                  season: "Nueva Temporada",
                  imageUrl: "https://images.unsplash.com/photo-1594633312681-425c7b97ccd1?q=80&w=500",
                ),
                CollectionCard(
                  title: "SNEAKER HEAD", 
                  season: "Primavera-Verano",
                  imageUrl: "https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?q=80&w=500",
                ),
                CollectionCard(
                  title: "STREET OVERSIZE", 
                  season: "Invierno 2026",
                  imageUrl: "https://images.unsplash.com/photo-1620799140408-edc6dcb6d633?q=80&w=500",
                ),
                CollectionCard(
                  title: "ACCESSORIES FLOW", 
                  season: "Limitado",
                  imageUrl: "https://images.unsplash.com/photo-1588850561407-ed78c282e89b?q=80&w=500",
                ),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
       floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/');
        },
        backgroundColor: const Color(0xFF004691),
        child: const Icon(Icons.home, color: Colors.white),
        tooltip: 'Volver al inicio',
      ),
    );
  }
}

class CollectionCard extends StatelessWidget {
  final String title;
  final String season;
  final String imageUrl;

  const CollectionCard({
    super.key, 
    required this.title, 
    required this.season, 
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // Ajuste responsivo para que se vea bien en web y móvil
    double cardWidth = width > 800 ? 220 : (width / 2) - 30;

    return Container(
      width: cardWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.network(
              imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 13),
                  textAlign: TextAlign.center,
                ),
                Text(
                  season,
                  style: const TextStyle(color: Colors.blueAccent, fontSize: 10, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF004691),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 35),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text("Ver productos", style: TextStyle(fontSize: 11)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}