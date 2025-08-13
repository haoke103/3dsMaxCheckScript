-- =============================
-- 界面事件处理 - modules/ui/ui_handlers.ms
-- =============================
struct UIEventHandlers

(	
	---- 刷新ui
	fn fn_refreshUI = 
	(		
		local status = true
		obj = selection[1]
		----所选模型是否已经检查
		try( status = GEO_TOOLS.fn_GetObjectProp "Checked" ) catch()
		----没有检测就把所有复选框取消勾选
		if status != true do
		(			
			CheckToolRollout.basicSettingsRollout.chk_NormalCheck.checked = false
			CheckToolRollout.basicSettingsRollout.chk_VertexColor.checked = false
			CheckToolRollout.basicSettingsRollout.chk_VertexAlpha.checked = false
			CheckToolRollout.basicSettingsRollout.chk_SmoothingGroups.checked = false
			CheckToolRollout.basicSettingsRollout.chk_BorderCheck.checked = false
			CheckToolRollout.basicSettingsRollout.chk_ModelSize.checked = false
			CheckToolRollout.basicSettingsRollout.chk_ModelTurnCheck.checked = false
			CheckToolRollout.basicSettingsRollout.chk_DesignQuality.checked = false
			CheckToolRollout.basicSettingsRollout.chk_UVChannel.checked = false
			CheckToolRollout.basicSettingsRollout.chk_UVOverflow.checked = false
			CheckToolRollout.basicSettingsRollout.chk_UVFillRate.checked = false
			CheckToolRollout.basicSettingsRollout.chk_UVPeelLayout.checked = false
			CheckToolRollout.basicSettingsRollout.chk_MultiSubMaterial.checked = false
			CheckToolRollout.basicSettingsRollout.chk_TextureQuality.checked = false
		)
		------每次检测前把所有ui组件重置
		CheckToolRollout.basicSettingsRollout.pic_GetMaxVersion.color = CONFIG.ColorGray
		CheckToolRollout.basicSettingsRollout.edt_GetMaxVersion.text = ""
		CheckToolRollout.basicSettingsRollout.pic_DisplayUnit.color = CONFIG.ColorGray
		CheckToolRollout.basicSettingsRollout.ddl_DisplayUnit.selection = 1
		CheckToolRollout.basicSettingsRollout.pic_SystemUnit.color = CONFIG.ColorGray
		CheckToolRollout.basicSettingsRollout.ddl_SystemUnit.selection = 1
		CheckToolRollout.basicSettingsRollout.pic_GetGamma.color = CONFIG.ColorGray
		CheckToolRollout.basicSettingsRollout.pic_GetGamma.color = CONFIG.ColorGray
		CheckToolRollout.basicSettingsRollout.ddl_GetGamma.selection = 1
		CheckToolRollout.basicSettingsRollout.pic_IsolatedObjects.color = CONFIG.ColorGray
		CheckToolRollout.basicSettingsRollout.ddl_IsolatedObjects.selection = 1
		CheckToolRollout.basicSettingsRollout.pic_ExtraLayers.color = CONFIG.ColorGray
		CheckToolRollout.basicSettingsRollout.ddl_ExtraLayers.selection = 1
		CheckToolRollout.basicSettingsRollout.pic_FrozenObjects.color = CONFIG.ColorGray
		CheckToolRollout.basicSettingsRollout.ddl_FrozenObjects.selection = 1
		CheckToolRollout.basicSettingsRollout.pic_HiddenObjects.color = CONFIG.ColorGray
		CheckToolRollout.basicSettingsRollout.ddl_HiddenObjects.selection = 1
		CheckToolRollout.basicSettingsRollout.pic_SelectedObject.color = CONFIG.ColorGray
		CheckToolRollout.basicSettingsRollout.edt_SelectedObject.text = ""
		CheckToolRollout.basicSettingsRollout.pic_AxisPos.color = CONFIG.ColorGray
		CheckToolRollout.basicSettingsRollout.ddl_AxisPos.selection = 1
		CheckToolRollout.basicSettingsRollout.pic_AxisDir.color = CONFIG.ColorGray
		CheckToolRollout.basicSettingsRollout.ddl_AxisDir.selection = 1
		CheckToolRollout.basicSettingsRollout.pic_AxisScale.color = CONFIG.ColorGray
		CheckToolRollout.basicSettingsRollout.ddl_AxisScale.selection = 1
		CheckToolRollout.basicSettingsRollout.pic_BackfaceCull.color = CONFIG.ColorGray
		CheckToolRollout.basicSettingsRollout.ddl_BackfaceCull.selection = 1
		CheckToolRollout.basicSettingsRollout.pic_WireColor.color = CONFIG.ColorGray
		CheckToolRollout.basicSettingsRollout.ddl_WireColor.selection = 1
		CheckToolRollout.basicSettingsRollout.pic_ModelNamingCheck.color = CONFIG.ColorGray
		CheckToolRollout.basicSettingsRollout.ddl_ModelNamingCheck.selection = 1
		CheckToolRollout.basicSettingsRollout.pic_CorrectTopoCheck.color = CONFIG.ColorGray
		CheckToolRollout.basicSettingsRollout.edt_CorrectTopoCheck.text = ""
		CheckToolRollout.basicSettingsRollout.pic_ModelSurfaceNumber.color = CONFIG.ColorGray
		CheckToolRollout.basicSettingsRollout.edt_ModelSurfaceNumber.text = ""
		CheckToolRollout.basicSettingsRollout.pic_NormalCheck.color = CONFIG.ColorGray
		CheckToolRollout.basicSettingsRollout.ddl_NormalCheck.selection = 1
		CheckToolRollout.basicSettingsRollout.pic_VertexColor.color = CONFIG.ColorGray
		CheckToolRollout.basicSettingsRollout.ddl_VertexColor.selection = 1
		CheckToolRollout.basicSettingsRollout.pic_VertexAlpha.color = CONFIG.ColorGray
		CheckToolRollout.basicSettingsRollout.ddl_VertexAlpha.selection = 1
		CheckToolRollout.basicSettingsRollout.pic_PolyCheck.color = CONFIG.ColorGray
		CheckToolRollout.basicSettingsRollout.edt_PolyCheck.text = ""
		CheckToolRollout.basicSettingsRollout.pic_SmoothingGroups.color = CONFIG.ColorGray
		CheckToolRollout.basicSettingsRollout.edt_SmoothingGroups.text = ""
		CheckToolRollout.basicSettingsRollout.pic_BorderCheck.color = CONFIG.ColorGray
		CheckToolRollout.basicSettingsRollout.edt_BorderCheck.text = ""
		CheckToolRollout.basicSettingsRollout.pic_ModelSize.color = CONFIG.ColorGray
		CheckToolRollout.basicSettingsRollout.edt_ModelSize.text = ""
		CheckToolRollout.basicSettingsRollout.pic_ModelTurnCheck.color = CONFIG.ColorGray
		CheckToolRollout.basicSettingsRollout.edt_ModelTurnCheck.text = ""
		CheckToolRollout.basicSettingsRollout.pic_DesignQuality.color = CONFIG.ColorGray
		CheckToolRollout.basicSettingsRollout.edt_DesignQuality.text = ""
		CheckToolRollout.basicSettingsRollout.pic_UVChannel.color = CONFIG.ColorGray
		CheckToolRollout.basicSettingsRollout.ddl_UVChannel.selection = 1
		CheckToolRollout.basicSettingsRollout.pic_UVOverflow.color = CONFIG.ColorGray
		CheckToolRollout.basicSettingsRollout.edt_UVOverflow.text = ""
		CheckToolRollout.basicSettingsRollout.pic_UVFillRate.color = CONFIG.ColorGray
		CheckToolRollout.basicSettingsRollout.edt_UVFillRate.text = ""
		CheckToolRollout.basicSettingsRollout.pic_UVPeelLayout.color = CONFIG.ColorGray
		CheckToolRollout.basicSettingsRollout.edt_UVPeelLayout.text = ""
		CheckToolRollout.basicSettingsRollout.pic_TextureNaming.color = CONFIG.ColorGray
		CheckToolRollout.basicSettingsRollout.ddl_TextureNaming.selection = 1
		CheckToolRollout.basicSettingsRollout.pic_MaterialNaming.color = CONFIG.ColorGray
		CheckToolRollout.basicSettingsRollout.ddl_MaterialNaming.selection = 1
		CheckToolRollout.basicSettingsRollout.pic_MapPath.color = CONFIG.ColorGray
		CheckToolRollout.basicSettingsRollout.ddl_MapPath.selection = 1
		CheckToolRollout.basicSettingsRollout.pic_TextureFormat.color = CONFIG.ColorGray
		CheckToolRollout.basicSettingsRollout.edt_TextureFormat.text = ""
		CheckToolRollout.basicSettingsRollout.pic_MultiSubMaterial.color = CONFIG.ColorGray
		CheckToolRollout.basicSettingsRollout.edt_MultiSubMaterial.text = ""
		CheckToolRollout.basicSettingsRollout.pic_MapSize.color = CONFIG.ColorGray
		CheckToolRollout.basicSettingsRollout.edt_MapSize.text = ""
		CheckToolRollout.basicSettingsRollout.pic_TextureQuality.color = CONFIG.ColorGray
		CheckToolRollout.basicSettingsRollout.edt_TextureQuality.text = ""
	),
	---- 清空之前的结果 
	fn fn_ClearResults Rollout01 = 
	(		
		try
		(			
			CONFIG.resultMessages = #()
		)
		catch
		(			
			Rollout01.lbResults.items = #( "清空提示框时发生错误" )
		)
	),
	-- ---Max版本检查  
	fn fn_GetMaxVersion pic01: chk01: ddl01: edt01: = 
	(		
		local version = GEO_TOOLS.fn_GetMaxVersion()
		edt01.text = version
		if version != "检测失败" then
		(			
			pic01.color = CONFIG.ColorGreen
		)
		else
		(			
			pic01.color = CONFIG.ColorRed
			append CONFIG.resultMessages( "Max版本检测异常" )
		)
	),
	-- 显示单位检查   
	fn fn_DisplayUnit pic01: chk01: ddl01: edt01: = 
	(		
		-- 1. 调用函数                                                   
		local Result01 = GEO_TOOLS.fn_DisplayUnit()
		-- 显示结果           
		case Result01 of
		(			
			#Millimeters:
			
			(				
				pic01.color = CONFIG.ColorYellow
				---edt01.text = "结果1"           
				ddl01.selection = 2
				append CONFIG.resultMessages( "显示单位是" + Result01 )
			)
			#Centimeters:
			
			(				
				pic01.color = CONFIG.ColorGreen
				---edt01.text = "结果1"           
				ddl01.selection = 3
				---append CONFIG.resultMessages( "显示单位是" + Result01 )
			)
			#Meters:
			
			(				
				pic01.color = CONFIG.ColorYellow
				---edt01.text = "结果1"           
				ddl01.selection = 4
				append CONFIG.resultMessages( "显示单位是" + Result01 )
			)
			#Kilometers:
			
			(				
				pic01.color = CONFIG.ColorYellow
				---edt01.text = "结果1"           
				ddl01.selection = 5
				append CONFIG.resultMessages( "显示单位是" + Result01 )
			)
			"非公制单位":
			
			(				
				pic01.color = CONFIG.ColorRed
				---edt01.text = "结果1"           
				ddl01.selection = 6
				append CONFIG.resultMessages( "显示单位是非公制单位，请修改" )
			)
			default:
			
			(				
				pic01.color = CONFIG.ColorRed
				---edt01.text = "结果1"           
				ddl01.selection = 7
				append CONFIG.resultMessages( Result01 )
			)
		)
	),
	-- 系统单位检查     
	fn fn_SystemUnit pic01: chk01: ddl01: edt01: = 
	(		
		-- 1. 调用函数                                                   
		local Result01 = GEO_TOOLS.fn_SystemUnit()
		-- 显示结果                                                    
		case Result01 of
		(			
			#Inches:
			
			(				
				pic01.color = CONFIG.ColorYellow
				---edt01.text = "结果1"           
				ddl01.selection = 2
				append CONFIG.resultMessages( "系统单位是" + Result01 )
			)
			#Feet:
			
			(				
				pic01.color = CONFIG.ColorYellow
				---edt01.text = "结果1"           
				ddl01.selection = 3
				append CONFIG.resultMessages( "系统单位是" + Result01 )
			)
			#Miles:
			
			(				
				pic01.color = CONFIG.ColorYellow
				---edt01.text = "结果1"           
				ddl01.selection = 4
				append CONFIG.resultMessages( "系统单位是" + Result01 )
			)
			#Millimeters:
			
			(				
				pic01.color = CONFIG.ColorYellow
				---edt01.text = "结果1"           
				ddl01.selection = 5
				append CONFIG.resultMessages( "系统单位是" + Result01 )
			)
			#Centimeters:
			
			(				
				pic01.color = CONFIG.ColorGreen
				---edt01.text = "结果1"           
				ddl01.selection = 6
				---append CONFIG.resultMessages( "系统单位是" + Result01 )
			)
			#Meters:
			
			(				
				pic01.color = CONFIG.ColorYellow
				---edt01.text = "结果1"           
				ddl01.selection = 7
				append CONFIG.resultMessages( "系统单位是" + Result01 )
			)
			#Kilometers:
			
			(				
				pic01.color = CONFIG.ColorYellow
				---edt01.text = "结果1"           
				ddl01.selection = 8
				append CONFIG.resultMessages( "系统单位是" + Result01 )
			)
			default:
			
			(				
				pic01.color = CONFIG.ColorRed
				---edt01.text = "结果1"           
				ddl01.selection = 9
				append CONFIG.resultMessages( Result01 )
			)
		)
	),
	-- 伽马矫正   
	fn fn_GetGamma pic01: chk01: ddl01: edt01: = 
	(		
		local gammaResult = GEO_TOOLS.fn_GetGamma() -- 直接调用全局函数                                                                                                                                                                                       
		if gammaResult == "伽马开启" then
		(			
			-- 伽马已启用 - 显示红色(警告)                                                                                                                                                                                                                                           
			pic01.color = CONFIG.ColorRed
			ddl01.selection = 2 -- "伽马矫正已启用"                                                                                                                                                                                                                                  
			append CONFIG.resultMessages "伽马矫正: 已启用 (请关闭矫正)"
		)
		else
		(			
			-- 伽马未启用 - 显示绿色(正常)                                                                                                                                                                                                                                           
			pic01.color = CONFIG.ColorGreen
			ddl01.selection = 3 -- "伽马矫正未启用"                                                                                                                                                                                                                                  
			---append CONFIG.resultMessages "伽马矫正: 已关闭 (正常)"
		)
	),
	-- 孤立对象检查    
	fn fn_IsolatedObjects pic01: chk01: ddl01: edt01: = 
	(		
		local Result01 = GEO_TOOLS.fn_IsolatedObjects()
		-- 显示结果                                                 
		if Result01 == true then
		(			
			pic01.color = CONFIG.ColorGreen
			---edt01.text = "没有对象被隔离"       
			ddl01.selection = 2
			---append CONFIG.resultMessages( "没有对象被隔离" )
		)
		else
		(			
			pic01.color = CONFIG.ColorRed
			---edt01.text = Result01       
			ddl01.selection = 3
			append CONFIG.resultMessages( Result01 + "，请取消隔离模式" )
		)
	),
	-- 多余图层检查   
	fn fn_ExtraLayers pic01: chk01: ddl01: edt01: = 
	(		
		-- 1. 调用函数                                                   
		local Result01 = GEO_TOOLS.fn_ExtraLayers()
		-- 显示结果       
		if Result01 == true then
		(			
			-- 只有默认图层的处理     
			pic01.color = CONFIG.ColorGreen
			ddl01.selection = 2
		)
		else
		(			
			-- 有多余图层    
			pic01.color = CONFIG.ColorRed
			ddl01.selection = 3
			append CONFIG.resultMessages( "有多余图层：" + Result01 )
		)
	),
	-- 多余贴图引用检查   
	fn fn_FindUnusedTextures pic01: chk01: ddl01: edt01: = 
	(		
		-- 1. 调用函数                                                   
		local Result01 = GEO_TOOLS.FindUnusedTextures()
		-- 显示结果       
		if Result01.count == 0 then
		(			
			-- 没有多余贴图引用   
			pic01.color = CONFIG.ColorGreen
			ddl01.selection = 2
		)
		else
		(			
			-- 有多余贴图引用    
			pic01.color = CONFIG.ColorRed
			ddl01.selection = 3
			append CONFIG.resultMessages( "有" + Result01.count as string + "条多余贴图引用路径：" + Result01 as string + "保存可以刷新贴图引用" )
		)
	),
	-- 冻结模型检查
	fn fn_FrozenObjects pic01: chk01: ddl01: edt01: = 
	(		
		-- 1. 调用函数                                                   
		local Result01 = GEO_TOOLS.fn_FrozenObjects()
		-- 显示结果                                                 
		if Result01 == true then
		(			
			pic01.color = CONFIG.ColorGreen
			ddl01.selection = 2
		)
		else
		(			
			pic01.color = CONFIG.ColorRed
			ddl01.selection = 3
			append CONFIG.resultMessages( "请解冻：" + Result01 )
		)
	),
	-- 隐藏模型检查     
	fn fn_HiddenObjects pic01: chk01: ddl01: edt01: = 
	(		
		local Result01 = GEO_TOOLS.fn_HiddenObjects()
		if Result01 == true then
		(			
			pic01.color = CONFIG.ColorGreen
			ddl01.selection = 2
		)
		else
		(			
			pic01.color = CONFIG.ColorRed
			ddl01.selection = 3
			append CONFIG.resultMessages( "请显示：" + Result01 )
		)
	),
	-- 所选模型检查
	fn fn_SelectedObject pic01: edt01: = 
	(		
		local Result01 = GEO_TOOLS.fn_SelectedObject()
		local SelectedObject01 = Result01[1]
		if Result01.count > 1 then
		(			
			pic01.color = CONFIG.ColorRed
			edt01.text = "选择了" + Result01.count as string + "个对象：" + Result01 as string
		)
		else
			if SelectedObject01[1] == "" or SelectedObject01[2] != "Editable_Poly" then
		(			
			pic01.color = CONFIG.ColorRed
			edt01.text = "请选择一个可编辑多边形"
		)
		else
		(			
			pic01.color = CONFIG.ColorGreen
			edt01.text = SelectedObject01 as string
		)
	),
	-- 坐标轴位置检查   
	fn fn_AxisPos pic01: chk01: ddl01: edt01: = 
	(		
		local Result01 = GEO_TOOLS.fn_AxisPos()
		if Result01 == true then
		(			
			pic01.color = CONFIG.ColorGreen
			--edt01.text = "结果1"        
			ddl01.selection = 2
			---append CONFIG.resultMessages( "模型在世界坐标原点" )
		)
		else
		(			
			pic01.color = CONFIG.ColorRed
			---edt01.text = "结果0"        
			ddl01.selection = 3
			append CONFIG.resultMessages Result01
		)
	),
	-- 坐标轴朝向检查            
	fn fn_AxisDir pic01: chk01: ddl01: edt01: = 
	(		
		local Result01 = GEO_TOOLS.fn_AxisDir()
		if Result01 == 1 then
		(			
			pic01.color = CONFIG.ColorGreen
			---edt01.text = "结果1"   
			ddl01.selection = 2
			---append CONFIG.resultMessages( "模型Y轴朝上" )
		)
		else
			if Result01 == 0 then
		(			
			pic01.color = CONFIG.ColorYellow
			---edt01.text = "结果0"   
			ddl01.selection = 3
			append CONFIG.resultMessages( "模型Z轴朝上" )
		)
		else
		(			
			pic01.color = CONFIG.ColorRed
			---edt01.text = "结果0"   
			ddl01.selection = 4
			append CONFIG.resultMessages Result01
		)
	),
	-- 模型缩放检查      
	fn fn_AxisScale pic01: chk01: ddl01: edt01: = 
	(		
		local Result01 = GEO_TOOLS.fn_AxisScale()
		if Result01 == true then
		(			
			pic01.color = CONFIG.ColorGreen
			ddl01.selection = 2
		)
		else
		(			
			pic01.color = CONFIG.ColorRed
			ddl01.selection = 3
			append CONFIG.resultMessages Result01
		)
	),
	-- 模型多边面检查  
	fn fn_PolyCheck pic01: chk01: ddl01: edt01: = 
	(		
		local Result01 = GEO_TOOLS.fn_PolyCheck()
		if Result01 then
		(			
			pic01.color = CONFIG.ColorGreen
			edt01.text = "没有多边面"
		)
		else
		(			
			pic01.color = CONFIG.ColorRed
			edt01.text = "存在多边面"
			append CONFIG.resultMessages( "模型存在" + Result01 as string + "个边数大于四边的面" )
		)
	),
	-- 法线检查  
	fn fn_NormalCheck pic01: chk01: ddl01: edt01: = 
	(		
		-- 1. 调用函数                                                   
		local Result01 = GEO_TOOLS.fn_NormalCheck()
		-- 显示结果 
		----勾选复选框跳过检测---
		if chk01.checked == true then
		(			
			ddl01.selection = 1
			pic01.color = CONFIG.ColorGreen
			-----append CONFIG.resultMessages( "跳过法线检查" )
		)
		else
		(			
			if Result01 == true then
			(				
				pic01.color = CONFIG.ColorGreen
				-----edt01.text = "结果1"
				ddl01.selection = 2
				------append CONFIG.resultMessages( "结果1" )
			)
			else
			(				
				pic01.color = CONFIG.ColorYellow
				----edt01.text = "结果0"
				ddl01.selection = 3
				append CONFIG.resultMessages( "存在法线锁定" )
			)
		)
	),
	-- 顶点色检查  
	fn fn_VertexColor pic01: chk01: ddl01: edt01: = 
	(		
		local Result01 = GEO_TOOLS.fn_VertexColor()
		----勾选复选框跳过检测---
		if chk01.checked == true then
		(			
			ddl01.selection = 1
			pic01.color = CONFIG.ColorGreen
			------append CONFIG.resultMessages( "跳过顶点色检查" )
		)
		else
		(			
			if Result01 == "白色" then
			(				
				pic01.color = CONFIG.ColorGreen
				ddl01.selection = 2
			)
			else
			(				
				pic01.color = CONFIG.ColorRed
				ddl01.selection = 3
				append CONFIG.resultMessages( "顶点色有修改" )
			)
		)
	),
	-- 顶点alpha检查  
	fn fn_VertexAlpha pic01: chk01: ddl01: edt01: = 
	(		
		local Result01 = GEO_TOOLS.fn_VertexAlpha()
		if chk01.checked == true then
		(			
			ddl01.selection = 1
			pic01.color = CONFIG.ColorGreen
			------append CONFIG.resultMessages( "跳过顶点色检查" )
		)
		else
		(			
			case Result01 of
			(				
				"100": -- 结果为0的情况
				(					
					pic01.color = CONFIG.ColorYellow
					--edt01.text = "结果1"
					ddl01.selection = 2
					append CONFIG.resultMessages( "顶点Alpha为100" )
				)
				"50": -- 结果为1的情况
				(					
					pic01.color = CONFIG.ColorGreen
					--edt01.text = "结果0"
					ddl01.selection = 3
					--append CONFIG.resultMessages( "顶点Alpha灰色50" )
				)
				default: -- 其他所有情况
				(					
					pic01.color = CONFIG.ColorRed
					--edt01.text = "结果0"
					ddl01.selection = 4
					append CONFIG.resultMessages( "顶点Alpha有修改" )
				)
			)
		)
	),
	-- 背面裁剪检查  
	fn fn_BackfaceCull pic01: chk01: ddl01: edt01: = 
	(		
		local Result01 = GEO_TOOLS.fn_BackfaceCull()
		if Result01 == 1 then
		(			
			pic01.color = CONFIG.ColorGreen
			----edt01.text = "结果1"
			ddl01.selection = 2
			-----append CONFIG.resultMessages( "结果1" )
		)
		else
		(			
			pic01.color = CONFIG.ColorRed
			-----edt01.text = "结果0"
			ddl01.selection = 3
			append CONFIG.resultMessages( "背面裁剪开启，请关掉" )
		)
	),
	-- 模型线框颜色检查  
	fn fn_WireColor pic01: chk01: ddl01: edt01: = 
	(		
		local Result01 = GEO_TOOLS.fn_WireColor()
		if Result01 == 1 then
		(			
			pic01.color = CONFIG.ColorGreen
			------edt01.text = "结果1"
			ddl01.selection = 2
			-------append CONFIG.resultMessages( "结果1" )
		)
		else
		(			
			pic01.color = CONFIG.ColorRed
			-----edt01.text = "结果0"
			ddl01.selection = 3
			append CONFIG.resultMessages( "线框颜色不是黑色" )
		)
	),
	-- 模型光滑组检查   
	fn fn_SmoothingGroups pic01: chk01: ddl01: edt01: = 
	(		
		if chk01.checked == true then
		(			
			pic01.color = CONFIG.ColorGreen
		)
		else
		(			
			local Result01 = GEO_TOOLS.fn_SmoothingGroups()
			if Result01 == "" then
			(				
				pic01.color = CONFIG.ColorGreen
				edt01.text = "未发现明显问题"
			)
			else
			(				
				pic01.color = CONFIG.ColorYellow
				edt01.text = "发现问题请查看提示框"
				-----ddl01.selection = 3
				append CONFIG.resultMessages( Result01 )
			)
		)
	),
	--检查废点 布尔
	fn fn_CorrectTopoCheck pic01: chk01: ddl01: edt01: = 
	(		
		local Result01 = GEO_TOOLS.fn_CorrectTopoCheck()
		if Result01 == false then
		(			
			pic01.color = CONFIG.ColorGreen
			edt01.text = "未发现存在废点"
		)
		else
		(			
			pic01.color = CONFIG.ColorRed
			edt01.text = "发现存在废点"
			append CONFIG.resultMessages( "发现存在废点，请清理或obj格式重新导入" )
		)
	),
	-- 模型命名检查  
	fn fn_ModelNamingCheck pic01: chk01: ddl01: edt01: = 
	(		
		local Result01 = GEO_TOOLS.fn_ModelNamingCheck()
		if Result01 == "" then
		(			
			pic01.color = CONFIG.ColorGreen
			ddl01.selection = 2
		)
		else
		(			
			pic01.color = CONFIG.ColorRed
			ddl01.selection = 3
			append CONFIG.resultMessages( Result01 )
		)
	),
	-- 模型面数检查   
	fn fn_ModelSurfaceCount pic01: chk01: ddl01: edt01: = 
	(		
		local Result01 = GEO_TOOLS.fn_ModelSurfaceCount()
		if Result01 == true then
		(			
			pic01.color = CONFIG.ColorGreen
			edt01.text = "面试合格"
			----ddl01.selection = 2
			------append CONFIG.resultMessages( "结果1" )
		)
		else
		(			
			pic01.color = CONFIG.ColorRed
			-----edt01.text = "结果0"
			-----ddl01.selection = 3
			append CONFIG.resultMessages( Result01 )
		)
	),
	-- 模型对角线（turn）检查  
	fn fn_ModelTurnCheck pic01: chk01: ddl01: edt01: = 
	(		
		----勾选复选框跳过检测---
		if chk01.checked == true then
		(			
			pic01.color = CONFIG.ColorGreen
		)
		else
		(			
			pic01.color = CONFIG.ColorYellow
			edt01.text = "请手动检查"
			append CONFIG.resultMessages( "有布料裙摆之类的模型必须手动确认内外对角线是否一致" )
		)
	),
	-- 模型开放边检查   
	fn fn_BorderCheck pic01: chk01: ddl01: edt01: = 
	(		
		----勾选复选框跳过检测---
		if chk01.checked == true then
		(			
			pic01.color = CONFIG.ColorGreen
		)
		else
		(			
			local Result01 = GEO_TOOLS.fn_BorderCheck()
			pic01.color = CONFIG.ColorYellow
			edt01.text = "有" + Result01 + "开放边,需手动检查"
			append CONFIG.resultMessages( "有" + Result01 + "开放边,需手动检查" )
		)
	),
	-- 模型大小比例检查   
	fn fn_ModelSize pic01: chk01: ddl01: edt01: = 
	(		
		----勾选复选框跳过检测---
		if chk01.checked == true then
		(			
			pic01.color = CONFIG.ColorGreen
		)
		else
		(			
			local Result01 = GEO_TOOLS.fn_ModelSize()
			pic01.color = CONFIG.ColorYellow
			edt01.text = Result01 + "请确认模型大小"
			append CONFIG.resultMessages( "请确认模型大小比例" )
		)
	),
	-- 模型质量造型检查  
	fn fn_DesignQuality pic01: chk01: ddl01: edt01: = 
	(		
		----勾选复选框跳过检测---
		if chk01.checked == true then
		(			
			pic01.color = CONFIG.ColorGreen
		)
		else
		(			
			pic01.color = CONFIG.ColorYellow
			edt01.text = "须手动检查"
			append CONFIG.resultMessages( "请多角度确认模型布线结构合理美观" )
		)
	),
	-- UV通道检查   
	fn fn_UVChannel pic01: chk01: ddl01: edt01: = 
	(		
		local Result01 = GEO_TOOLS.fn_UVChannel()
		if Result01 == 1 then
		(			
			pic01.color = CONFIG.ColorGreen
			-----edt01.text = "结果1"
			ddl01.selection = 2
			-----append CONFIG.resultMessages( "结果1" )
		)
		else
		(			
			pic01.color = CONFIG.ColorRed
			----edt01.text = "结果0"
			ddl01.selection = 3
			append CONFIG.resultMessages( "存在" + Result01 as string + "个uv通道" )
		)
	),
	-- UV溢出检查   
	fn fn_UVOverflow pic01: chk01: ddl01: edt01: = 
	(		
		local Result01 = GEO_TOOLS.fn_UVOverflow()
		if Result01 == true then
		(			
			pic01.color = CONFIG.ColorGreen
			edt01.text = "uv没有超出第一象限"
			-----append CONFIG.resultMessages( "结果1" )
		)
		else
		(			
			pic01.color = CONFIG.ColorRed
			edt01.text = "UV溢出"
			append CONFIG.resultMessages( "UV超出第一象限" )
		)
	),
	-- UV填充率检查  
	fn fn_UVFillRate pic01: chk01: ddl01: edt01: = 
	(		
		if chk01.checked == true then
		(			
			pic01.color = CONFIG.ColorGreen
		)
		else
		(			
			local Result01 = GEO_TOOLS.fn_UVFillRate()
			edt01.text = Result01
			pic01.color = CONFIG.ColorYellow
			append CONFIG.resultMessages( "请确认没有UV空间浪费" )
		)
	),
	-- UV拉伸排布检查  
	fn fn_UVPeelLayout pic01: chk01: ddl01: edt01: = 
	(		
		----勾选复选框跳过检测---
		if chk01.checked == true then
		(			
			pic01.color = CONFIG.ColorGreen
		)
		else
		(			
			pic01.color = CONFIG.ColorYellow
			edt01.text = "需手动检查"
			append CONFIG.resultMessages( "请仔细检查UV有无不合理拉伸与排布" )
		)
	),
	-- 贴图命名检查     
	fn fn_TextureNaming pic01: chk01: ddl01: edt01: = 
	(		
		local Result01 = GEO_TOOLS.checkMaterialStandards()
		if Result01[3] == "贴图命名合规" then
		(			
			pic01.color = CONFIG.ColorGreen
			------edt01.text = Result01[3]
			ddl01.selection = 2
			-----append CONFIG.resultMessages( "结果1" )
		)
		else
		(			
			pic01.color = CONFIG.ColorRed
			-----edt01.text = Result01[3]
			ddl01.selection = 3
			append CONFIG.resultMessages( Result01[3] )
		)
	),
	-- 材质命名检查   
	fn fn_MaterialNaming pic01: chk01: ddl01: edt01: = 
	(		
		local Result01 = GEO_TOOLS.checkMaterialStandards()
		if Result01[2] == "材质命名合规" then
		(			
			pic01.color = CONFIG.ColorGreen
			------edt01.text = Result01[2]
			ddl01.selection = 2
			-----append CONFIG.resultMessages( "结果1" )
		)
		else
		(			
			pic01.color = CONFIG.ColorRed
			-----edt01.text = Result01[2]
			ddl01.selection = 3
			append CONFIG.resultMessages( Result01[2] )
		)
	),
	-- 贴图路径检查  
	fn fn_MapPath pic01: chk01: ddl01: edt01: = 
	(		
		local Result01 = GEO_TOOLS.fn_MapPath()
		if Result01 == true then
		(			
			pic01.color = CONFIG.ColorGreen
			-----edt01.text = "结果1"
			ddl01.selection = 2
			-----append CONFIG.resultMessages( "结果1" )
		)
		else
		(			
			pic01.color = CONFIG.ColorRed
			-----edt01.text = "结果0"
			ddl01.selection = 3
			append CONFIG.resultMessages( "贴图路径未打断" )
		)
	),
	-- 多维子材质检查 
	fn fn_MultiSubMaterial pic01: chk01: ddl01: edt01: = 
	(		
		local Result01 = GEO_TOOLS.checkMaterialStandards()
		if Result01[1] == "是多维子材质" then
		(			
			----勾选复选框跳过检测---
			if chk01.checked == true then
			(				
				pic01.color = CONFIG.ColorGreen
				edt01.text = Result01[1] + "已处理"
			)
			else
			(				
				pic01.color = CONFIG.ColorRed
				edt01.text = Result01[1] + "未处理"
				append CONFIG.resultMessages( Result01[1] + "请使用多维子材质处理工具处理" )
				chk01.checked = false
			)
		)
		else
		(			
			pic01.color = CONFIG.ColorGreen
			edt01.text = Result01[1]
		)
	),
	-- 贴图尺寸检查  
	fn fn_MapSize pic01: chk01: ddl01: edt01: = 
	(		
		local Result01 = GEO_TOOLS.checkMaterialStandards()
		if Result01[5] == "贴图尺寸合规" then
		(			
			pic01.color = CONFIG.ColorGreen
			edt01.text = Result01[5]
			-----ddl01.selection = 2
			-----append CONFIG.resultMessages( "结果1" )
		)
		else
		(			
			pic01.color = CONFIG.ColorRed
			edt01.text = Result01[5]
			-----ddl01.selection = 3
			append CONFIG.resultMessages( Result01[5] )
		)
	),
	-- 贴图格式检查  
	fn fn_TextureFormat pic01: chk01: ddl01: edt01: = 
	(		
		local Result01 = GEO_TOOLS.checkMaterialStandards()
		if Result01[4] == "贴图格式合规" then
		(			
			pic01.color = CONFIG.ColorGreen
			edt01.text = Result01[4]
			-----ddl01.selection = 2
			-----append CONFIG.resultMessages( "结果1" )
		)
		else
		(			
			pic01.color = CONFIG.ColorRed
			edt01.text = Result01[4]
			-----ddl01.selection = 3
			append CONFIG.resultMessages( Result01[4] )
		)
	),
	-- 贴图质量规范检查 
	fn fn_TextureQuality pic01: chk01: ddl01: edt01: = 
	(		
		----勾选复选框跳过检测---
		if chk01.checked == true then
		(			
			pic01.color = CONFIG.ColorGreen
		)
		else
		(			
			pic01.color = CONFIG.ColorYellow
			edt01.text = "请手动检查后勾选复选框跳过检查"
			append CONFIG.resultMessages( "请确认贴图美术风格和质量符合规范" )
		)
	),
	----- 检查完成把所有结果添加到提示框 
	fn fn_AddAllResults Rollout01 = 
	(		
		-- try
		-- (			
		Rollout01.lbResults.items = CONFIG.resultMessages
		GEO_TOOLS.fn_SetObjectProp "Checked"
		-- )
		-- catch
		-- (			
		-- 	Rollout01.lbResults.items = #( "所有结果添加到提示框时发生错误" )
		-- )
	)
)
-- 创建全局事件处理器
global UI_HANDLERS = UIEventHandlers() format "界面事件处理器加载完成\n"
