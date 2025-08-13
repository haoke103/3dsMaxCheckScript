-- =============================
-- 主入口文件 - main.ms 
-- =============================
-- 启动配置
struct StartupConfig

(	
	showLoadingInfo = true,
	debugMode = false,
	requiredMaxVersion = 2021
)
global STARTUP_CONFIG = StartupConfig()
---- 调试输出
fn debugLog msg = 
(	
	if STARTUP_CONFIG.debugMode then
	(		
		format "[调试] %\n" msg
	)
)
-- 获取脚本目录
global scriptDir = getFilenamePath( getThisScriptFilename() )
global scriptToolsPath = scriptDir + "tools\\"
-- 确保目录存在
-- if not doesFileExist toolsPath do
-- 	makeDir toolsPath
-- 增强的模块加载
fn loadModuleSafe filename required: true = 
(	
	local fullPath = scriptDir + filename
	local success = false
	debugLog( "尝试加载: " + filename )
	if doesFileExist fullPath then
	(		
		try
		(			
			fileIn fullPath
			success = true
			if STARTUP_CONFIG.showLoadingInfo then
			(				
				format "✓ %\n" filename
			)
		)
		catch
		(			
			local error = getCurrentException() as string
			format "✗ % - %\n" filename error
			if required then
			(				
				messageBox( "关键模块加载失败: " + filename + "\n" + error )
			)
		)
	)
	else
	(		
		format "✗ 找不到文件: %\n" filename
		if required then
		(			
			messageBox( "找不到关键文件: " + filename )
		)
	)
	debugLog( "加载结果: " +( success as string ) )
	return success
)
-- 主加载流程
fn main = 
(	
	if STARTUP_CONFIG.showLoadingInfo then
	(		
		format "=== 开始加载工具集 ===\n"
	)
	-- 按顺序加载模块
	local modules = #(		
		#( "config.mse", true ),
		#( "modules\\data.mse", true ),
		#( "modules\\geometry.mse", false ),
		#( "modules\\updata.mse", false ),
		#( "modules\\export.mse", false ),
		#( "UI\\ui_handlers.mse", true ),
		#( "UI\\ui_layout.mse", false )
	)
	local loadedCount = 0
	for moduleInfo in modules do
	(		
		local filename = moduleInfo[1]
		local required = moduleInfo[2]
		if loadModuleSafe filename required: required then
		(			
			loadedCount += 1
		)
	)
	if STARTUP_CONFIG.showLoadingInfo then
	(		
		format "=== 加载完成 (%/%) ===\n" loadedCount modules.count
	)
	-- 启动界面
	MyToolsUI.create()
	return true
)
------验证
try
(	
	max_V = GetFileVersion( getDir #maxRoot + "\\3dsmax.exe" ) -- 获取当前max版本号                                                                                                                                                                                            
	YY_v = substring max_V 1 2 -- 返回字符串中从第一个到第二个字符                                                                                                                                                                                            
	local version_num = YY_v as integer -- 将字符串转换为整数                                                                                                                                                                                
	if( version_num >= 10 ) then
	(		
		maxVer = 1998 + version_num
	)
	else
	(		
		maxVer = 0
	)
	if( maxVer == STARTUP_CONFIG.requiredMaxVersion ) then
	(		
		-- 执行主程序
		main()
	)
	else
	(		
		messageBox "仅限项目所需版本3dsmax2021使用!" title: "错误"
	)
)
catch
(	
)