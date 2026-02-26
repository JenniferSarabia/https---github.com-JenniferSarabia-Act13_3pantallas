import 'package:flutter/material.dart';

class Pagina2 extends StatelessWidget {
  const Pagina2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE1E9F8),
      // --- APPBAR CLONADA DE LA HOME ---
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
                    hintText: "Buscar ofertas...",
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
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              "OFERTAS EXCLUSIVAS",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Color(0xFF002D5E)),
            ),
          ),
          OfferCard(
            title: "SUDADERAS PREMIUM",
            discount: "20% OFF",
            description: "Solo por esta semana en modelos seleccionados.",
            color: Color(0xFF005BC4),
            imageUrl: "https://images.unsplash.com/photo-1556821840-3a63f95609a7?q=80&w=800",
          ),
          SizedBox(height: 20),
          OfferCard(
            title: "CARGO PANTS",
            discount: "SALE \$1999",
            description: "Precio especial en la colección Carhartt Black.",
            color: Color(0xFF002D5E),
            imageUrl: "https://images.unsplash.com/photo-1624378439575-d8705ad7ae80?q=80&w=800",
          ),
          SizedBox(height: 20),
          OfferCard(
            title: "SNEAKERS DROP",
            discount: "3x2",
            description: "En calzado seleccionado de nueva temporada.",
            color: Colors.black87,
            imageUrl: "https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?q=80&w=800",
          ),
        ],
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

class OfferCard extends StatelessWidget {
  final String title;
  final String discount;
  final String description;
  final Color color;
  final String imageUrl;

  const OfferCard({
    super.key, 
    required this.title, 
    required this.discount, 
    required this.description,
    required this.color,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 5))],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            // Imagen de fondo con opacidad para que el texto se lea bien
            Positioned(
              right: -20,
              top: -20,
              bottom: -20,
              child: Opacity(
                opacity: 0.4,
                child: Image.network(
                  imageUrl,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Contenido de la tarjeta
            Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title, style: const TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 14)),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                        child: Text(discount, style: TextStyle(color: color, fontWeight: FontWeight.w900, fontSize: 12)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      description, 
                      style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.3),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      side: const BorderSide(color: Colors.white, width: 1.5),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text("VER OFERTA", style: TextStyle(fontWeight: FontWeight.bold)),
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