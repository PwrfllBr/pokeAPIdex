import 'package:flutter/material.dart';
import 'package:pokedex_app/model/pokemon_type.dart';
import 'package:pokedex_app/presentation/widgets/pokeball_back_widget.dart';
import 'package:pokedex_app/presentation/widgets/pokemon_type_widget.dart';
import 'package:pokedex_app/providers/pokemon_detail_provider.dart';
import 'package:pokedex_app/utils/string_extension.dart';
import 'package:provider/provider.dart';

class PokemonDetailsScreen extends StatefulWidget {
  const PokemonDetailsScreen({super.key});

  @override
  State<PokemonDetailsScreen> createState() => _PokemonDetailsScreenState();
}

class _PokemonDetailsScreenState extends State<PokemonDetailsScreen> with TickerProviderStateMixin{
  late final TabController tabController;

  @override
  void initState(){
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose(){
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //get screen size for responsive design
    
    final pokemonDetailProvider = context.watch<PokemonDetailProvider>();
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final String pokemonFormattedId = pokemonDetailProvider.pickedPokemon!.id.toString().padLeft(3,'0');
    final PokemonType mainType = pokemonDetailProvider.pickedPokemon!.types.first;

    return Scaffold(
      backgroundColor: mainType.altColor1,
      appBar: AppBar(
        backgroundColor: mainType.altColor1,
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.favorite_outline_rounded, color: Colors.white,))
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(child: 
            CustomPaint(
              painter: PokeballBackWidget(
                color: mainType.altColor2,
                altColor: mainType.altColor1),)),
          Padding(
              padding: EdgeInsets.fromLTRB(25, 0, 25, 25),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(pokemonDetailProvider.pickedPokemon!.name.capitalize(),
                            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),),
                          SizedBox(height: 10),
                          Row(
                            children: pokemonDetailProvider.pickedPokemon!.types.map((type) => Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: PokemonTypeWidget(type: type.name, typeColor: type.color))
                            ).toList(),
                          ),
                        ],
                      ),
                      Text('#$pokemonFormattedId',style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white))
                    ],
                  ),
                ],
              ),
            ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: screenHeight * 0.55,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment:  CrossAxisAlignment.start,
                  children: [
                    TabBar(
                      controller: tabController,
                      labelPadding: EdgeInsets.symmetric(horizontal: 10),
                      tabs: [
                        Tab(text: "About"),
                        Tab(text: "Base Stats"),
                        Tab(text: "Evolution"),
                      ]
                    ),
                    SizedBox(height: 40),
                    Expanded(
                      child: TabBarView(
                        controller: tabController,
                        children: <Widget>[
                          SingleChildScrollView(
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Species', style: TextStyle(fontSize: 16, color: Colors.grey[600], fontWeight: FontWeight.w500),),
                                    SizedBox(height: 10),
                                    Text('Height', style: TextStyle(fontSize: 16, color: Colors.grey[600], fontWeight: FontWeight.w500),),
                                    SizedBox(height: 10,),
                                    Text('Weight', style: TextStyle(fontSize: 16, color: Colors.grey[600], fontWeight: FontWeight.w500),),
                                    SizedBox(height: 10,),
                                    Text('Abilities', style: TextStyle(fontSize: 16, color: Colors.grey[600], fontWeight: FontWeight.w500),),
                                    SizedBox(height: 10,),
                                    ],
                                ),
                                SizedBox(width: 50,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Seed', style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),),
                                    SizedBox(height: 10),
                                    Text("0.70 cm", style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),),
                                    SizedBox(height: 10,),
                                    Text('6.9 kg', style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),),
                                    SizedBox(height: 10,),
                                    Text('Overgrow, Chlorophyl', style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),),
                                    SizedBox(height: 10,),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('HP: 45', style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),),
                                SizedBox(height: 10),
                                Text('Attack: 49', style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),),
                                SizedBox(height: 10,),
                                Text('Defense: 49', style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),),
                                SizedBox(height: 10,),
                                Text('Special Attack: 65', style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),),
                                SizedBox(height: 10,),
                                Text('Special Defense: 65', style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),),
                                SizedBox(height: 10,),
                                Text('Speed: 45', style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),),
                              ],
                            ),
                          ),
                          SingleChildScrollView(child: Center(child: Text("Evolution data"),))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.13,
            left: screenWidth / 2 - (250/2),
            child: Image.network(
              pokemonDetailProvider.pickedPokemon!.imageUrl,
                height: 250,
                width: 250,
                
            ),
          ),
        ],
      ),
    );
  }
}