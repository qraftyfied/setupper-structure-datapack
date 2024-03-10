@echo off

echo STRUCTURE DATAPACK SETUPPER by qrafty https://qrafty/discord


set /p needHelp="DO YOU WANT TO OPEN THE GITHUB WIKI BEFORE STARTING? (Y/N): "
if /i "%needHelp%"=="Y" (
    start "Open Website" https://github.com/qraftyfied/setupper-structure-datapack/wiki 
) else (
    echo CONTINUING...
)


set /p structurename="INPUT GENERATED STRUCTURE NAME: "
set /p namespace="SET YOUR NAMESPACE: "
set /p foldername="DEFINE THE NAME OF YOUR DATAPACK: "
set /p description="DESCRIBE YOUR DATAPACK: "

set /p needHelp="DO YOU NEED TO LOOK UP THE CURRENT PACK VERSION? (Y/N): "
if /i "%needHelp%"=="Y" (
    start "Open Website" https://minecraft.wiki/w/Data_pack 
) else (
    echo CONTINUING...
)

set /p packversion="SET PACKVERSION: "
set /p biome="BIOME SPAWNING: "
set /p spacing="SPACING: "
set /p seperation="SEPERATION: "

mkdir "%foldername%"
mkdir "%foldername%\data"
mkdir "%foldername%\data\minecraft"
mkdir "%foldername%\data\%namespace%"
mkdir "%foldername%\data\%namespace%\structures"
mkdir "%foldername%\data\%namespace%\tags"
mkdir "%foldername%\data\%namespace%\tags\worldgen"
mkdir "%foldername%\data\%namespace%\tags\worldgen\biome"
mkdir "%foldername%\data\%namespace%\tags\worldgen\biome\has_structure"
mkdir "%foldername%\data\%namespace%\worldgen"
mkdir "%foldername%\data\%namespace%\worldgen\structure"
mkdir "%foldername%\data\%namespace%\worldgen\structure_set"
mkdir "%foldername%\data\%namespace%\worldgen\template_pool"
mkdir "%foldername%\data\%namespace%\worldgen\processor_list"


echo {"type":"minecraft:jigsaw","biomes":"#%namespace%:has_structure/%structurename%","step":"surface_structures","spawn_overrides":{},"terrain_adaptation":"beard_thin","start_pool":"%namespace%:%structurename%","size":3,"start_height":{"absolute":0},"project_start_to_heightmap":"WORLD_SURFACE_WG","max_distance_from_center":100,"use_expansion_hack":false} > "%foldername%\data\%namespace%\worldgen\structure\%structurename%.json"

echo {"pack":{"pack_format":%packversion%,"description":{"text":"%description%","color":"aqua","hoverEvent":{"action":"show_text","value":"%description%"}}}} > "%foldername%\pack.mcmeta"

echo {"processors":[{"processor_type":"minecraft:rule","rules":[{"location_predicate":{"predicate_type":"minecraft:block_match","block":"minecraft:sand"},"input_predicate":{"predicate_type":"minecraft:block_match","block":"minecraft:grass_block"},"output_state":{"Name":"minecraft:sand"}},{"location_predicate":{"predicate_type":"minecraft:block_match","block":"minecraft:stone"},"input_predicate":{"predicate_type":"minecraft:block_match","block":"minecraft:grass_block"},"output_state":{"Name":"minecraft:stone"}},{"location_predicate":{"predicate_type":"minecraft:block_match","block":"minecraft:terracotta"},"input_predicate":{"predicate_type":"minecraft:block_match","block":"minecraft:grass_block"},"output_state":{"Name":"minecraft:terracotta"}},{"location_predicate":{"predicate_type":"minecraft:always_true"},"input_predicate":{"predicate_type":"minecraft:random_block_match","block":"minecraft:stone_bricks","probability":0.03},"output_state":{"Name":"minecraft:mossy_stone_bricks"}},{"location_predicate":{"predicate_type":"minecraft:always_true"},"input_predicate":{"predicate_type":"minecraft:random_block_match","block":"minecraft:stone_bricks","probability":0.05},"output_state":{"Name":"minecraft:cracked_stone_bricks"}}]}]} > "%foldername%\data\%namespace%\worldgen\processor_list\%structurename%.json"

echo {"structures":[{"structure":"%namespace%:%structurename%","weight":1}],"placement":{"type":"minecraft:random_spread","salt":641996537,"spacing":%spacing%,"separation":%seperation%}} > "%foldername%\data\%namespace%\worldgen\structure_set\%structurename%.json"

echo {"replace":false,"values":["minecraft:%biome%"]} > %foldername%\data\%namespace%\tags\worldgen\biome\has_structure\%structurename%.json"

echo {"name":"%namespace%:fortress","fallback":"minecraft:empty","elements":[{"weight":1,"element":{"element_type":"minecraft:legacy_single_pool_element","projection":"rigid","location":"%namespace%:%structurename%","processors":"%namespace%:%structurename%"}},{"weight":1,"element":{"element_type":"minecraft:legacy_single_pool_element","projection":"rigid","location":"%namespace%:%structurename%","processors":"%namespace%:%structurename%"}}]} > "%foldername%\data\%namespace%\worldgen\template_pool\%structurename%.json"

move "%structurename%.nbt" "%foldername%\data\%namespace%\structures"





echo FINISHED! LOOK FOR THE PACK IN THIS FOLDER. ENJOY MORE CREATIONS BY QRAFTY: https://www.qrafty.net/discord

pause
