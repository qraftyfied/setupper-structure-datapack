echo "STRUCTURE DATAPACK SETUPPER by qrafty.net/discord QUICK HELP /// REFER TO https://github.com/qraftyfied?tab=repositories /// Structure name has to be the name of the previously generated nbt file. Also the nbt file has to be in the same folder a s this datpack setupper! The namespace is just important for you, if you plan to extend the datapack in future. Refer for further information on YouTube or smth like that. The name of that datapack is completly unnecessary, as it is just the name of the generated zip file. When your prompt to describe the datapack, it generates the pack description in pack.mcmeta. Now it gets important: Biome spawning defines the biome the structure will spawn in. Be sure to use the biome naming from mojang, like windswept_savanna or so. Dont write the \"minecraft:\" infront of it, it is not necessary. Spacing is self explanatory, the greater the number, the rarer is the structure. Recommendend is anything between 5 and 50. Spereation is basically in one sentence just the same, but make sure the number is littler that the spacing number!!!" > readme.txt

echo "STRUCTURE DATAPACK SETUP by qrafty (DISCORD)"
echo "IF BASIC HELP IS NEEDED, REFER TO THE GENERATED readme.txt!"

echo "INPUT STRUCTURE NAME: "
read structurename

echo "SET YOUR NAMESPACE: "
read namespace

echo "DEFINE THE NAME OF YOUR DATAPACK: "
read foldername

echo "DESCRIBE YOUR DATAPACK: "
read description

echo "BIOME SPAWNING: "
read biome

echo "SPACING: "
read spacing

echo "SEPERATION: "
read seperation

mkdir $foldername
mkdir $foldername/data
mkdir $foldername/data/minecraft
mkdir $foldername/data/$namespace
mkdir $foldername/data/$namespace/structures
mkdir $foldername/data/$namespace/tags
mkdir $foldername/data/$namespace/tags/worldgen
mkdir $foldername/data/$namespace/tags/worldgen/biome
mkdir $foldername/data/$namespace/tags/worldgen/biome/has_structure
mkdir $foldername/data/$namespace/worldgen
mkdir $foldername/data/$namespace/worldgen/structure
mkdir $foldername/data/$namespace/worldgen/structure_set
mkdir $foldername/data/$namespace/worldgen/template_pool
mkdir $foldername/data/$namespace/worldgen/processor_list

echo "CREATED FILE SYSTEM, CONTINUING WITH JSON!"


echo '{"type":"minecraft:jigsaw","biomes":"#'$namespace':has_structure/'$structurename'","step":"surface_structures","spawn_overrides":{},"terrain_adaptation":"beard_thin","start_pool":"'$namespace':'$structurename'","size":3,"start_height":{"absolute":0},"project_start_to_heightmap":"WORLD_SURFACE_WG","max_distance_from_center":100,"use_expansion_hack":false}' > $foldername/data/$namespace/worldgen/structure/$structurename.json

echo '{"pack":{"pack_format":26,"description":{"text":"'$description'","color":"aqua","hoverEvent":{"action":"show_text","value":"'$description'"}}}}' > $foldername/pack.mcmeta

echo '{"processors":[{"processor_type":"minecraft:rule","rules":[{"location_predicate":{"predicate_type":"minecraft:block_match","block":"minecraft:sand"},"input_predicate":{"predicate_type":"minecraft:block_match","block":"minecraft:grass_block"},"output_state":{"Name":"minecraft:sand"}},{"location_predicate":{"predicate_type":"minecraft:block_match","block":"minecraft:stone"},"input_predicate":{"predicate_type":"minecraft:block_match","block":"minecraft:grass_block"},"output_state":{"Name":"minecraft:stone"}},{"location_predicate":{"predicate_type":"minecraft:block_match","block":"minecraft:terracotta"},"input_predicate":{"predicate_type":"minecraft:block_match","block":"minecraft:grass_block"},"output_state":{"Name":"minecraft:terracotta"}},{"location_predicate":{"predicate_type":"minecraft:always_true"},"input_predicate":{"predicate_type":"minecraft:random_block_match","block":"minecraft:stone_bricks","probability":0.03},"output_state":{"Name":"minecraft:mossy_stone_bricks"}},{"location_predicate":{"predicate_type":"minecraft:always_true"},"input_predicate":{"predicate_type":"minecraft:random_block_match","block":"minecraft:stone_bricks","probability":0.05},"output_state":{"Name":"minecraft:cracked_stone_bricks"}}]}]}' > $foldername/data/$namespace/worldgen/processor_list/$structurename.json

echo '{"structures":[{"structure":"'$namespace':'$structurename'","weight":1}],"placement":{"type":"minecraft:random_spread","salt":641996537,"spacing":'$spacing',"separation":'$seperation'}}' > $foldername/data/$namespace/worldgen/structure_set/$structurename.json

echo '{"replace":false,"values":["minecraft:'$biome'"]}' > $foldername/data/$namespace/tags/worldgen/biome/has_structure/$structurename.json

echo '{"name":"'$namespace':fortress","fallback":"minecraft:empty","elements":[{"weight":1,"element":{"element_type":"minecraft:legacy_single_pool_element","projection":"rigid","location":"'$namespace':'$structurename'","processors":"'$namespace':'$structurename'"}},{"weight":1,"element":{"element_type":"minecraft:legacy_single_pool_element","projection":"rigid","location":"'$namespace':'$structurename'","processors":"'$namespace':'$structurename'"}}]}' > $foldername/data/$namespace/worldgen/template_pool/$structurename.json

mv $structurename.nbt $foldername/data/$namespace/structures

echo "DATAPACK SAVED TO THE MINECRAFT SAVES FOLDER! GET SUPPORT: qrafty.net/discord"
