-- =============================
-- 配置文件 - config.ms
-- =============================
-- 全局配置结构
struct AppConfig

(	
	-- 基本信息
	appName = "3DsMax模型工具集1.0 by：柚肾花露水",
	version = "1.0.0",
	downloadurl = #(		
		-- GitHub Raw（原始链接，作为最后备用）
		"https://raw.githubusercontent.com/haoke103/3dsmax-check-script/main/MyMaxScript/version.json",
		-- jsDelivr CDN（推荐，国内访问稳定）
		"https://cdn.jsdelivr.net/gh/haoke103/3dsmax-check-script@main/MyMaxScript/version.json",
		-- jsDelivr 备用节点
		"https://fastly.jsdelivr.net/gh/haoke103/3dsmax-check-script@main/MyMaxScript/version.json"
	),
	-- 界面设置
	windowWidth = 550,
	windowHeight = 750,
	-- 颜色方案
	ColorRed = color 237 28 36,
	ColorGreen = color 0 166 81,
	ColorYellow = color 255 242 0,
	ColorGray = color 128 128 128,
	-- 默认设置
	defaultSegments = 16,
	backupEnabled = true,
	-- 路径设置
	exportPath = "C:\\Exports\\",
	texturePath = "C:\\Textures\\",
	-- 结果消息数组
	resultMessages = #()
)
-- 命名规范数据定义
global characterTypes = #( "Weapon", "Mount", "BattleMount", "Body", "Head", "Hair", "HeadAccs", "FaceAccs", "MouthAccs", "BackAccs", "Pendant" )
global objectTypes = #( "Pet", "NPC", "MonsterJunior", "MonsterSenior", "MonsterElite", "Boss" )
global allValidTypes = characterTypes + objectTypes
global genderTypes = #( "M", "F" )
global qualityLevels = #( "Low", "Middle", "High", "Fine" )
global lodSuffixes = #( "LOD0", "LOD1", "LOD2", "LODX" )
-- 角色动态贴图尺寸表
global texCharacterLimits = #(	
	#( "Body", 512, 512, 256, 512 ),
	#( "Head", 256, 256, 128, 512 ),
	#( "Hair", 512, 512, 256, 512 ),
	#( "HeadAccs", 512, 256, 256, 512 ),
	#( "FaceAccs", 512, 256, 256, 512 ),
	#( "MouthAccs", 512, 256, 256, 512 ),
	#( "BackAccs", 512, 256, 256, 512 ),
	#( "Weapon", 256, 256, 128, 256 ),
	#( "Mount", 512, 512, 256, 512 ),
	#( "BattleMount", 512, 512, 256, 512 ),
	#( "Pendant", 512, 256, 256, 512 )
)
-- 怪物NPC等动态贴图尺寸表
global texObjectLimits = #(	
	#( "Low", 512, 512, 256, 512 ),
	#( "Middle", 512, 512, 256, 512 ),
	#( "High", 1024, 1024, 512, 1024 ),
	#( "Fine", 1024, 1024, 512, 1024 )
)
-- 角色装备类固定面数表
global characterLimits = #(	
	#( "Body", 6000, 2200, 1050, 20000 ),
	#( "Head", 450, 150, 100, 20000 ),
	#( "Hair", 2550, 650, 350, 20000 ),
	#( "Weapon", 1500, 500, 200, 20000 ),
	#( "Mount", 13500, 4500, 1200, 20000 ),
	#( "BattleMount", 7500, 2500, 1000, 20000 ),
	#( "Pendant", 4500, 1500, 700, 20000 ),
	#( "HeadAccs", 1500, 500, 200, 20000 ),
	#( "FaceAccs", 1500, 500, 200, 20000 ),
	#( "MouthAccs", 1500, 500, 200, 20000 ),
	#( "BackAccs", 1500, 500, 200, 20000 )
)
-- 怪物NPC等动态面数表
global objectLimits = #(	
	#( "Low", 4500, 1500, 700, 20000 ),
	#( "Middle", 7500, 2500, 1200, 20000 ),
	#( "High", 15000, 5000, 2500, 20000 ),
	#( "Fine", 30000, 10000, 5000, 20000 )
)
-- LOD索引映射 
global lodLevels = #( "LOD0", "LOD1", "LOD2", "LODX" )
-- 创建全局配置
global CONFIG = AppConfig()
-- 全局状态变量
format "配置加载完成\n"
