-- =============================
-- 界面布局 - ui/ui_layout.ms
-- =============================
--初始化--------------------------------------------------------------------------------------------------------------
global CheckToolRollout
try( destroyDialog CheckToolRollout ) catch() -- 尝试关闭旧对话框避免冲突
-- GUI----------------------------------------------------------------------------------------------------------------- 
-- 主对话框定义，对话框尺寸
rollout CheckToolRollout CONFIG.appName width: CONFIG.windowWidth height: CONFIG.windowHeight

(	
	-- 标签页选择器:2个标签水平排列                                                                                                                                                                                                                                                 
	radiobuttons rbTabs labels: #( "规范检查工具", "其它常用工具" ) columns: 2 align: #center
	-- 子面板容器:区域尺寸，位置,凹陷边框样式                                                                                                                                                                                                                                                 
	subRollout mainSubRollout height: 500 width: 520 pos:[15, 30] style_sunkenedge: true
	button btnBasicCheck "一键检查" width: 130 height: 30 offset:[0, 15] across: 4
	button btnBasicFix "一键设置" width: 130 height: 30 offset:[0, 15]
	button CheckForUpdates "检查更新" width: 130 height: 30 offset:[0, 15]
	button btnGetResult "读取结果" width: 130 height: 30 offset:[0, 15]
	-- 结果列表: 显示10行，宽度，位置                                                                                                                                                                                                                                                 
	listbox lbResults "可按F11打开Listener查看详细" height: 9 width: 520 pos:[15, 590]
	-- 子面板管理(内部变量)                                                                                                                                                                                       
	local allSubRollouts = #()
	local currentRollout = undefined
	-- ===== 1. 基本设置检查项目子面板 =====                                                                                                                                                                                                                                                  
	rollout basicSettingsRollout "规范检查工具"
	
	(		
		hyperLink myLink "3d角色建模规范文档" width: 150 address: "https://huanle.feishu.cn/docx/NIIcdy7VsoCzypx8u9UcAkCJnRc" color:( color 0 0 255 ) hoverColor:( color 255 0 0 ) visitedColor:( color 128 0 128 ) across: 2
		button txtBtn "关于" width: 40 height: 20 bgcolor:( color 255 255 255 ) offset:[70, 0]
		group "Max版本检查"
		
		(			
			----版本检测
			colorPicker pic_GetMaxVersion "" width: 20 height: 16 enabled: false color: CONFIG.ColorGray across: 2 offset:[0, 0]
			label lbl_GetMaxVersion "MAX版本检查：" width: 100 offset:[-285, 0]
			edittext edt_GetMaxVersion "" width: 180 readOnly: true offset:[0, 0]
		)
		group "单位设置检查"
		
		(			
			------显示单位检测	
			colorPicker pic_DisplayUnit "" width: 20 height: 16 enabled: false color: CONFIG.ColorGray across: 2 offset:[0, 0]
			label lbl_DisplayUnit "显示单位检查：" width: 100 offset:[-285, 0]
			dropdownlist ddl_DisplayUnit items: #( "未检测", "Millimeters", "Centimeters", "Meters", "Kilometers", "非公制单位", "检查失败" ) selection: 1 width: 180 height: 21 offset:[0, 0]
			-----系统单位检测
			colorPicker pic_SystemUnit "" width: 20 height: 16 enabled: false color: CONFIG.ColorGray across: 2 offset:[0, 0]
			label lbl_SystemUnit "系统单位检查：" width: 100 offset:[-285, 0]
			dropdownlist ddl_SystemUnit items: #( "未检测", "Inches", "Feet", "Miles", "Millimeters", "Centimeters", "Meters", "Kilometers", "检查失败" ) selection: 1 width: 180 height: 21 offset:[0, 0]
		)
		group "场景设置检查"
		
		(			
			----伽马矫正检测
			colorPicker pic_GetGamma "" width: 20 height: 16 enabled: false color: CONFIG.ColorGray across: 2 offset:[0, 0]
			label lbl_GetGamma "伽马矫正：" width: 100 offset:[-285, 0]
			dropdownlist ddl_GetGamma items: #( "未检测", "伽马矫正已启用", "伽马矫正已关闭" ) selection: 1 width: 180 height: 21 offset:[0, 0]
			----孤立模式检测
			colorPicker pic_IsolatedObjects "" width: 20 height: 16 enabled: false color: CONFIG.ColorGray across: 2 offset:[0, 0]
			label lbl_IsolatedObjects "孤立模式检查:" width: 100 offset:[-285, 0]
			dropdownlist ddl_IsolatedObjects items: #( "未检测", "孤立模式关闭", "允许孤立模式" ) selection: 1 width: 180 height: 21 offset:[0, 0]
			-----图层检测
			colorPicker pic_ExtraLayers "" width: 20 height: 16 enabled: false color: CONFIG.ColorGray across: 2 offset:[0, 0]
			label lbl_ExtraLayers "多余图层检查:" width: 100 offset:[-285, 0]
			dropdownlist ddl_ExtraLayers items: #( "未检测", "只有一个默认图层", "有多余空图层" ) selection: 1 width: 180 height: 21 offset:[0, 0]
			-----贴图引用检测
			colorPicker pic_FindUnusedTextures "" width: 20 height: 16 enabled: false color: CONFIG.ColorGray across: 2 offset:[0, 0]
			label lbl_FindUnusedTextures "未使用贴图引用检查:" width: 100 offset:[-285, 0]
			dropdownlist ddl_FindUnusedTextures items: #( "未检测", "不存在多余贴图引用", "有多余贴图引用" ) selection: 1 width: 180 height: 21 offset:[0, 0]
			----冻结模型检测
			colorPicker pic_FrozenObjects "" width: 20 height: 16 enabled: false color: CONFIG.ColorGray across: 2 offset:[0, 0]
			label lbl_FrozenObjects "冻结模型检查:" width: 100 offset:[-285, 0]
			dropdownlist ddl_FrozenObjects items: #( "未检测", "没有被冻结模型", "存在被冻结模型" ) selection: 1 width: 180 height: 21 offset:[0, 0]
			----隐藏模型检测
			colorPicker pic_HiddenObjects "" width: 20 height: 16 enabled: false color: CONFIG.ColorGray across: 2 offset:[0, 0]
			label lbl_HiddenObjects "隐藏模型检查:" width: 100 offset:[-285, 0]
			dropdownlist ddl_HiddenObjects items: #( "未检测", "没有被隐藏模型", "存在被隐藏模型" ) selection: 1 width: 180 height: 21 offset:[0, 0]
		)
		group "模型检查"
		
		(			
			----所选模型检测	
			colorPicker pic_SelectedObject "" width: 20 height: 16 enabled: false color: CONFIG.ColorGray across: 2 offset:[0, 0]
			label lbl_SelectedObject "所选模型:" width: 100 offset:[-285, 0]
			edittext edt_SelectedObject "" width: 180 readOnly: true offset:[0, 0]
			----坐标轴位置
			colorPicker pic_AxisPos "" width: 20 height: 16 enabled: false color: CONFIG.ColorGray across: 2 offset:[0, 0]
			label lbl_AxisPos "坐标轴位置检查:" width: 100 offset:[-285, 0]
			dropdownlist ddl_AxisPos items: #( "未检测", "在世界原点", "坐标轴偏移" ) selection: 1 width: 180 height: 21 offset:[0, 0]
			----坐标轴朝向检查
			colorPicker pic_AxisDir "" width: 20 height: 16 enabled: false color: CONFIG.ColorGray across: 2 offset:[0, 0]
			label lbl_AxisDir "坐标轴朝向检查:" width: 100 offset:[-285, 0]
			dropdownlist ddl_AxisDir items: #( "未检测", "Y轴朝上", "z轴朝上", "存在不规范旋转" ) selection: 1 width: 180 height: 21 offset:[0, 0]
			----模型缩放检查
			colorPicker pic_AxisScale "" width: 20 height: 16 enabled: false color: CONFIG.ColorGray across: 2 offset:[0, 0]
			label lbl_AxisScale "模型缩放检查:" width: 100 offset:[-285, 0]
			dropdownlist ddl_AxisScale items: #( "未检测", "缩放值都为100%", "有缩放未重置" ) selection: 1 width: 180 height: 21 offset:[0, 0]
			----背面裁剪检查
			colorPicker pic_BackfaceCull "" width: 20 height: 16 enabled: false color: CONFIG.ColorGray across: 2 offset:[0, 0]
			label lbl_BackfaceCull "背面裁剪检查:" width: 100 offset:[-285, 0]
			dropdownlist ddl_BackfaceCull items: #( "未检测", "背面裁剪关闭", "背面裁剪开启" ) selection: 1 width: 180 height: 21 offset:[0, 0]
			-----模型线框颜色检查
			colorPicker pic_WireColor "" width: 20 height: 16 enabled: false color: CONFIG.ColorGray across: 2 offset:[0, 0]
			label lbl_WireColor "模型线框颜色检查:" width: 100 offset:[-285, 0]
			dropdownlist ddl_WireColor items: #( "未检测", "线框颜色正常", "线框颜色不是黑色" ) selection: 1 width: 180 height: 21 offset:[0, 0]
			----模型命名检查
			colorPicker pic_ModelNamingCheck "" width: 20 height: 16 enabled: false color: CONFIG.ColorGray across: 2 offset:[0, 0]
			label lbl_ModelNamingCheck "模型命名检查：" width: 100 offset:[-285, 0]
			dropdownlist ddl_ModelNamingCheck items: #( "未检测", "命名规范", "命名不规范" ) selection: 1 width: 180 height: 21 offset:[0, 0]
			----法线检查
			colorPicker pic_NormalCheck "" width: 20 height: 16 enabled: false color: CONFIG.ColorGray across: 3 offset:[0, 0]
			label lbl_NormalCheck "法线检查:" width: 50 offset:[-188, 0]
			checkbox chk_NormalCheck checked: false offset:[-160, 0] tooltip: "勾选表示允许有法线锁定"
			dropdownlist ddl_NormalCheck items: #( "未检测", "法线正常", "存在法线锁定" ) selection: 1 width: 180 height: 21 offset:[0, 0]
			----模型废点检查
			colorPicker pic_CorrectTopoCheck "" width: 20 height: 16 enabled: false color: CONFIG.ColorGray across: 2 offset:[0, 0]
			label lbl_CorrectTopoCheck "模型废点检查：" width: 100 offset:[-285, 0]
			edittext edt_CorrectTopoCheck "" width: 180 readOnly: true offset:[0, 0]
			----顶点色检查
			colorPicker pic_VertexColor "" width: 20 height: 16 enabled: false color: CONFIG.ColorGray across: 3 offset:[0, 0]
			label lbl_VertexColor "顶点色检查:" width: 60 offset:[-185, 0]
			checkbox chk_VertexColor checked: false offset:[-160, 0] tooltip: "勾选表示模型需要顶点色绘制信息，跳过检查"
			dropdownlist ddl_VertexColor items: #( "未检测", "顶点色为默认白色", "顶点色有修改" ) selection: 1 width: 180 height: 21 offset:[0, 0]
			----顶点Alpha检查
			colorPicker pic_VertexAlpha "" width: 20 height: 16 enabled: false color: CONFIG.ColorGray across: 3 offset:[0, 0]
			label lbl_VertexAlpha "顶点Alpha检查:" width: 80 offset:[-175, 0]
			checkbox chk_VertexAlpha checked: false offset:[-160, 0] tooltip: "勾选表示模型需要顶点alpha绘制信息，跳过检查"
			dropdownlist ddl_VertexAlpha items: #( "未检测", "顶点Alpha为默认100白色", "顶点Alpha为50灰色", "顶点Alpha有修改" ) selection: 1 width: 180 height: 21 offset:[0, 0]
			----模型面数检查
			colorPicker pic_ModelSurfaceNumber "" width: 20 height: 16 enabled: false color: CONFIG.ColorGray across: 2 offset:[0, 0]
			label lbl_ModelSurfaceNumber "模型面数检查：" width: 100 offset:[-285, 0]
			edittext edt_ModelSurfaceNumber "" width: 180 readOnly: true offset:[0, 0]
			----模型多边面检查
			colorPicker pic_PolyCheck "" width: 20 height: 16 enabled: false color: CONFIG.ColorGray across: 2 offset:[0, 0]
			label lbl_PolyCheck "模型多边面检查:" width: 100 offset:[-285, 0]
			edittext edt_PolyCheck "" width: 180 readOnly: true offset:[0, 0]
			----模型光滑组检查
			colorPicker pic_SmoothingGroups "" width: 20 height: 16 enabled: false color: CONFIG.ColorGray across: 3 offset:[0, 0]
			label lbl_SmoothingGroups "模型光滑组检查：" width: 100 offset:[-165, 0]
			checkbox chk_SmoothingGroups checked: false offset:[-160, 0] tooltip: "勾选表示已经手动完成光滑组检查或允许模型有特殊光滑组设置"
			edittext edt_SmoothingGroups "" width: 180 readOnly: true offset:[0, 0]
			----模型开放边检查
			colorPicker pic_BorderCheck "" width: 20 height: 16 enabled: false color: CONFIG.ColorGray across: 3 offset:[0, 0]
			label lbl_BorderCheck "模型开放边检查：" width: 100 offset:[-165, 0]
			checkbox chk_BorderCheck checked: false offset:[-160, 0] tooltip: "勾选表示已经完成手动检查开放边"
			edittext edt_BorderCheck "" width: 180 readOnly: true offset:[0, 0]
			-----模型大小比例检查
			colorPicker pic_ModelSize "" width: 20 height: 16 enabled: false color: CONFIG.ColorGray across: 3 offset:[0, 0]
			label lbl_ModelSize "模型大小比例检查：" width: 100 offset:[-165, 0]
			checkbox chk_ModelSize checked: false offset:[-160, 0] tooltip: "勾选表示已经确认模型大小比例符合要求"
			edittext edt_ModelSize "" width: 180 readOnly: true offset:[0, 0]
			----对角线(turn)检查
			colorPicker pic_ModelTurnCheck "" width: 20 height: 16 enabled: false color: CONFIG.ColorGray across: 3 offset:[0, 0]
			label lbl_ModelTurnCheck "对角线(turn)检查：" width: 100 offset:[-165, 0]
			checkbox chk_ModelTurnCheck checked: false offset:[-160, 0] tooltip: "勾选表示已经完成手动检查模型对角线"
			edittext edt_ModelTurnCheck "" width: 180 readOnly: true offset:[0, 0]
			----模型质量造型检查
			colorPicker pic_DesignQuality "" width: 20 height: 16 enabled: false color: CONFIG.ColorGray across: 3 offset:[0, 0]
			label lbl_DesignQuality "模型质量造型检查：" width: 100 offset:[-165, 0]
			checkbox chk_DesignQuality checked: false offset:[-160, 0] tooltip: "勾选表示已经各个角度观察确认模型造型符合美术需求"
			edittext edt_DesignQuality "" width: 180 readOnly: true offset:[0, 0]
		)
		group "UV检查"
		
		(			
			----UV通道检查
			colorPicker pic_UVChannel "" width: 20 height: 16 enabled: false color: CONFIG.ColorGray across: 3 offset:[0, 0]
			label lbl_UVChannel "UV通道检查：" width: 100 offset:[-165, 0]
			checkbox chk_UVChannel checked: false offset:[-160, 0] tooltip: "勾选表示允许模型存在多个UV通道"
			dropdownlist ddl_UVChannel items: #( "未检测", "没有多个UV集", "有多个UV集" ) selection: 1 width: 180 height: 21 offset:[0, 0]
			----UV溢出检查
			colorPicker pic_UVOverflow "" width: 20 height: 16 enabled: false color: CONFIG.ColorGray across: 3 offset:[0, 0]
			label lbl_UVOverflow "UV溢出检查：" width: 100 offset:[-165, 0]
			checkbox chk_UVOverflow checked: false offset:[-160, 0] tooltip: "勾选表示允许UV存在溢出(0-1空间外)"
			edittext edt_UVOverflow "" width: 180 readOnly: true offset:[0, 0]
			----UV填充率检查
			colorPicker pic_UVFillRate "" width: 20 height: 16 enabled: false color: CONFIG.ColorGray across: 3 offset:[0, 0]
			label lbl_UVFillRate "UV填充率检查：" width: 100 offset:[-165, 0]
			checkbox chk_UVFillRate checked: false offset:[-160, 0] tooltip: "勾选表示已经确认UV空间利用率合理"
			edittext edt_UVFillRate "" width: 180 readOnly: true offset:[0, 0]
			----UV拉伸排布检查
			colorPicker pic_UVPeelLayout "" width: 20 height: 16 enabled: false color: CONFIG.ColorGray across: 3 offset:[0, 0]
			label lbl_UVPeelLayout "UV拉伸排布检查：" width: 100 offset:[-165, 0]
			checkbox chk_UVPeelLayout checked: false offset:[-160, 0] tooltip: "勾选表示已经确认检查UV展开排布不存在浪费与不合理"
			edittext edt_UVPeelLayout "" width: 180 readOnly: true offset:[0, 0]
		)
		group "材质贴图检查"
		
		(			
			----材质命名检查
			colorPicker pic_MaterialNaming "" width: 20 height: 16 enabled: false color: CONFIG.ColorGray across: 2 offset:[0, 0]
			label lbl_MaterialNaming "材质命名检查：" width: 100 offset:[-285, 0]
			dropdownlist ddl_MaterialNaming items: #( "未检测", "命名规范", "命名不规范" ) selection: 1 width: 180 height: 21 offset:[0, 0]
			----贴图命名检查
			colorPicker pic_TextureNaming "" width: 20 height: 16 enabled: false color: CONFIG.ColorGray across: 2 offset:[0, 0]
			label lbl_TextureNaming "贴图命名检查：" width: 100 offset:[-285, 0]
			dropdownlist ddl_TextureNaming items: #( "未检测", "命名规范", "命名不规范" ) selection: 1 width: 180 height: 21 offset:[0, 0]
			----贴图路径检查
			colorPicker pic_MapPath "" width: 20 height: 16 enabled: false color: CONFIG.ColorGray across: 2 offset:[0, 0]
			label lbl_MapPath "贴图路径检查：" width: 100 offset:[-285, 0]
			dropdownlist ddl_MapPath items: #( "未检测", "路径已断开", "路径未打断" ) selection: 1 width: 180 height: 21 offset:[0, 0]
			----贴图格式检查
			colorPicker pic_TextureFormat "" width: 20 height: 16 enabled: false color: CONFIG.ColorGray across: 2 offset:[0, 0]
			label lbl_TextureFormat "贴图格式检查：" width: 100 offset:[-285, 0]
			edittext edt_TextureFormat "" width: 180 readOnly: true offset:[0, 0]
			----贴图尺寸检查
			colorPicker pic_MapSize "" width: 20 height: 16 enabled: false color: CONFIG.ColorGray across: 2 offset:[0, 0]
			label lbl_MapSize "贴图尺寸检查：" width: 100 offset:[-285, 0]
			edittext edt_MapSize "" width: 180 readOnly: true offset:[0, 0]
			----多维子材质检查
			colorPicker pic_MultiSubMaterial "" width: 20 height: 16 enabled: false color: CONFIG.ColorGray across: 3 offset:[0, 0]
			label lbl_MultiSubMaterial "多维子材质检查：" width: 100 offset:[-165, 0]
			checkbox chk_MultiSubMaterial checked: false offset:[-160, 0] tooltip: "勾选表示已经确认多维子材质设置合理"
			edittext edt_MultiSubMaterial "" width: 180 readOnly: true offset:[0, 0]
			----贴图质量规范检查
			colorPicker pic_TextureQuality "" width: 20 height: 16 enabled: false color: CONFIG.ColorGray across: 3 offset:[0, 0]
			label lbl_TextureQuality "贴图质量规范检查：" width: 100 offset:[-165, 0]
			checkbox chk_TextureQuality checked: false offset:[-160, 0] tooltip: "勾选表示已经确认贴图质量符合美术需求"
			edittext edt_TextureQuality "" width: 180 readOnly: true offset:[0, 0]
		)
		-- 所有按钮事件都转发给处理器
		fn fn_btnBasicCheck = 
		(			
			-- 清空消息框 
			UI_HANDLERS.fn_ClearResults CheckToolRollout
			-- Max版本检查 
			UI_HANDLERS.fn_GetMaxVersion pic01: pic_GetMaxVersion edt01: edt_GetMaxVersion
			-- 显示单位检查 
			UI_HANDLERS.fn_DisplayUnit pic01: pic_DisplayUnit ddl01: ddl_DisplayUnit
			-- 系统单位检查
			UI_HANDLERS.fn_SystemUnit pic01: pic_SystemUnit ddl01: ddl_SystemUnit
			-- 伽马矫正
			UI_HANDLERS.fn_GetGamma pic01: pic_GetGamma ddl01: ddl_GetGamma
			-- 孤立对象检查 
			UI_HANDLERS.fn_IsolatedObjects pic01: pic_IsolatedObjects ddl01: ddl_IsolatedObjects
			-- 多余图层检查 
			UI_HANDLERS.fn_ExtraLayers pic01: pic_ExtraLayers ddl01: ddl_ExtraLayers
			-- 多余贴图引用检查 
			UI_HANDLERS.fn_FindUnusedTextures pic01: pic_FindUnusedTextures ddl01: ddl_FindUnusedTextures
			-- 冻结模型检查
			UI_HANDLERS.fn_FrozenObjects pic01: pic_FrozenObjects ddl01: ddl_FrozenObjects
			-- 隐藏模型检查  
			UI_HANDLERS.fn_HiddenObjects pic01: pic_HiddenObjects ddl01: ddl_HiddenObjects
			-- 所选模型 
			UI_HANDLERS.fn_SelectedObject pic01: pic_SelectedObject edt01: edt_SelectedObject
			if( pic_SelectedObject.color == CONFIG.ColorGreen ) then
			(				
				-- 如果没有选中模型，则不执行后续检查
				-- 坐标轴位置检查 
				UI_HANDLERS.fn_AxisPos pic01: pic_AxisPos ddl01: ddl_AxisPos
				-- 坐标轴朝向检查
				UI_HANDLERS.fn_AxisDir pic01: pic_AxisDir ddl01: ddl_AxisDir
				-- 模型缩放检查 
				UI_HANDLERS.fn_AxisScale pic01: pic_AxisScale ddl01: ddl_AxisScale
				-- 背面裁剪检查
				UI_HANDLERS.fn_BackfaceCull pic01: pic_BackfaceCull chk01: chk_BackfaceCull ddl01: ddl_BackfaceCull edt01: edt_BackfaceCull
				-- 模型线框颜色检查 
				UI_HANDLERS.fn_WireColor pic01: pic_WireColor chk01: chk_WireColor ddl01: ddl_WireColor edt01: edt_WireColor
				-- 模型命名检查  
				UI_HANDLERS.fn_ModelNamingCheck pic01: pic_ModelNamingCheck ddl01: ddl_ModelNamingCheck
				-- 法线检查 
				UI_HANDLERS.fn_NormalCheck pic01: pic_NormalCheck chk01: chk_NormalCheck ddl01: ddl_NormalCheck
				-- 模型废点检查 
				UI_HANDLERS.fn_CorrectTopoCheck pic01: pic_CorrectTopoCheck edt01: edt_CorrectTopoCheck
				-- 顶点色检查 
				UI_HANDLERS.fn_VertexColor pic01: pic_VertexColor chk01: chk_VertexColor ddl01: ddl_VertexColor
				-- 顶点alpha检查 
				UI_HANDLERS.fn_VertexAlpha pic01: pic_VertexAlpha chk01: chk_VertexAlpha ddl01: ddl_VertexAlpha
				-- 模型多边面检查 
				UI_HANDLERS.fn_PolyCheck pic01: pic_PolyCheck chk01: chk_PolyCheck ddl01: ddl_PolyCheck edt01: edt_PolyCheck
				-- 模型光滑组检查 
				UI_HANDLERS.fn_SmoothingGroups pic01: pic_SmoothingGroups chk01: chk_SmoothingGroups ddl01: ddl_SmoothingGroups edt01: edt_SmoothingGroups
				-- 模型开放边检查   
				UI_HANDLERS.fn_BorderCheck pic01: pic_BorderCheck chk01: chk_BorderCheck ddl01: ddl_BorderCheck edt01: edt_BorderCheck
				-- 模型对角线（turn）检查  
				UI_HANDLERS.fn_ModelTurnCheck pic01: pic_ModelTurnCheck chk01: chk_ModelTurnCheck ddl01: ddl_ModelTurnCheck edt01: edt_ModelTurnCheck
				-- 模型大小比例检查  
				UI_HANDLERS.fn_ModelSize pic01: pic_ModelSize chk01: chk_ModelSize ddl01: ddl_ModelSize edt01: edt_ModelSize
				-- 模型质量造型检查 
				UI_HANDLERS.fn_DesignQuality pic01: pic_DesignQuality chk01: chk_DesignQuality ddl01: ddl_DesignQuality edt01: edt_DesignQuality
				-- UV通道检查 
				UI_HANDLERS.fn_UVChannel pic01: pic_UVChannel chk01: chk_UVChannel ddl01: ddl_UVChannel edt01: edt_UVChannel
				-- UV溢出检查  
				UI_HANDLERS.fn_UVOverflow pic01: pic_UVOverflow chk01: chk_UVOverflow ddl01: ddl_UVOverflow edt01: edt_UVOverflow
				-- UV填充率检查  
				UI_HANDLERS.fn_UVFillRate pic01: pic_UVFillRate chk01: chk_UVFillRate ddl01: ddl_UVFillRate edt01: edt_UVFillRate
				-- UV拉伸排布检查  
				UI_HANDLERS.fn_UVPeelLayout pic01: pic_UVPeelLayout chk01: chk_UVPeelLayout ddl01: ddl_UVPeelLayout edt01: edt_UVPeelLayout
				-----如果模型命名正确则继续执行后续检查
				if( pic_ModelNamingCheck.color == CONFIG.ColorGreen ) then
				(					
					-- 模型面数检查 
					UI_HANDLERS.fn_ModelSurfaceCount pic01: pic_ModelSurfaceNumber edt01: edt_ModelSurfaceNumber
					-- 材质命名检查  
					UI_HANDLERS.fn_MaterialNaming pic01: pic_MaterialNaming chk01: chk_MaterialNaming ddl01: ddl_MaterialNaming edt01: ming
					-----如果材质命名正确则继续执行后续检查
					if( pic_MaterialNaming.color == CONFIG.ColorGreen ) then
					(						
						-- 贴图命名检查 
						UI_HANDLERS.fn_TextureNaming pic01: pic_TextureNaming chk01: chk_TextureNaming ddl01: ddl_TextureNaming edt01: edt_TextureNaming
						-- 贴图路径检查  
						UI_HANDLERS.fn_MapPath pic01: pic_MapPath chk01: chk_MapPath ddl01: ddl_MapPath edt01: edt_MapPath
						-- 贴图尺寸检查  
						UI_HANDLERS.fn_MapSize pic01: pic_MapSize chk01: chk_MapSize edt01: edt_MapSize
						-- 贴图格式检查 
						UI_HANDLERS.fn_TextureFormat pic01: pic_TextureFormat chk01: chk_TextureFormat ddl01: ddl_TextureFormat edt01: edt_TextureFormat
						-- 多维子材质检查 
						UI_HANDLERS.fn_MultiSubMaterial pic01: pic_MultiSubMaterial chk01: chk_MultiSubMaterial ddl01: ddl_MultiSubMaterial edt01: edt_MultiSubMaterial
						-- 贴图质量规范检查 
						UI_HANDLERS.fn_TextureQuality pic01: pic_TextureQuality chk01: chk_TextureQuality ddl01: ddl_TextureQuality edt01: edt_TextureQuality
					)
					else
					(						
						append CONFIG.resultMessages( "只有材质球命名正确才能进行材质相关检查" )
					)
				)
				else
				(					
					append CONFIG.resultMessages( "只有文件命名正确才能进行命名相关检查" )
				)
			)
			else
			(				
				append CONFIG.resultMessages( "只有选中一个可编辑多边形才能进行细节检查" )
			)
			-- 检查完成把所有结果添加到提示框 
			UI_HANDLERS.fn_AddAllResults CheckToolRollout
			---检查完成对场景进行标记
			GEO_TOOLS.fn_ResultMarking()
		)
		fn fn_btnBasicFix = 
		(			
			CheckToolRollout.lbResults.items = #( "开发中..." )
		)
		fn fn_CheckForUpdates = 
		(			
			myContent = Updata_TOOLS.checkForUpdates CONFIG.downloadurl CONFIG.version
		)
		fn fn_btnGetResult = 
		(			
			GEO_TOOLS.fn_GetResult()
		)
		---- 添加鼠标事件
		on txtBtn pressed do
		(			
			GEO_TOOLS.showAboutDialog()
		)
		---- 鼠标悬停时改变文本颜色
		on txtBtn mouseOver do
		(			
			txtBtn.textColor = color 0 100 200
			windows.setCursor #hand
		)
		on txtBtn mouseOut do
		(			
			txtBtn.textColor = color 0 0 0
			windows.setCursor #arrow
		)
		-- 复选框状态改变处理事件-------------
		on chk_NormalCheck changed state do
		(			
			if state == true then
			(				
				local status = GEO_TOOLS.fn_GetObjectProp "Normal"
				if status then
				(					
					chk_NormalCheck.checked = true
				)
				else
				(					
					messageBox "除非确认已经使用法线传递否则需要解锁法线"
					chk_NormalCheck.checked = false
				)
			)
		)
		on chk_VertexColor changed state do
		(			
			if state == true then
			(				
				local userResponse = queryBox "请确认当前模型顶点色存在手动修改（半透明可修改）" title: "确认勾选" beep: false
				if userResponse == true then
				(					
					chk_VertexColor.checked = true
				)
				else
				(					
					chk_VertexColor.checked = false
				)
			)
		)
		on chk_VertexAlpha changed state do
		(			
			if state == true then
			(				
				local userResponse = queryBox "请确认当前模型顶点alpha存在手动修改（调整描边粗细可修改）" title: "确认勾选" beep: false
				if userResponse == true then
				(					
					chk_VertexAlpha.checked = true -- 修正：原代码使用了 VertexAlpha.checked
				)
				else
				(					
					chk_VertexAlpha.checked = false -- 修正：原代码使用了 VertexAlpha.checked
				)
			)
		)
		on chk_SmoothingGroups changed state do
		(			
			if state == true then
			(				
				local status = GEO_TOOLS.fn_GetObjectProp "smoothGroups"
				if status then
				(					
					chk_SmoothingGroups.checked = true
				)
				else
				(					
					messageBox "请使用光滑组检查工具检测光滑组否则无法勾选"
					chk_SmoothingGroups.checked = false
				)
			)
		)
		on chk_BorderCheck changed state do
		(			
			if state == true then
			(				
				local status = GEO_TOOLS.fn_GetObjectProp "OpenEdge"
				if status then
				(					
					chk_BorderCheck.checked = true
				)
				else
				(					
					messageBox "请使用开放边辅助检查工具手动检查否则无法勾选\n易错点：对称中缝"
					chk_BorderCheck.checked = false
				)
			)
		)
		on chk_ModelSize changed state do
		(			
			if state == true then
			(				
				local userResponse = queryBox "请确定已经和相关负责人（原画/策划）确认了模型大小" title: "确认勾选" beep: false
				if userResponse == true then
				(					
					chk_ModelSize.checked = true
				)
				else
				(					
					chk_ModelSize.checked = false
				)
			)
		)
		on chk_ModelTurnCheck changed state do
		(			
			if state == true then
			(				
				local status = GEO_TOOLS.fn_GetObjectProp "turn"
				if status then
				(					
					chk_ModelTurnCheck.checked = true
				)
				else
				(					
					messageBox "请使用turn线检查工具检测turn否则无法勾选\n必查点：裙摆，布料，袖口，片状物体"
					chk_ModelTurnCheck.checked = false
				)
			)
		)
		on chk_DesignQuality changed state do
		(			
			if state == true then
			(				
				local userResponse = queryBox "请确认已经完成美术标准检测" title: "确认勾选" beep: false
				if userResponse == true then
				(					
					chk_DesignQuality.checked = true
				)
				else
				(					
					chk_DesignQuality.checked = false
				)
			)
		)
		on chk_UVChannel changed state do
		(			
			if state == true then
			(				
				local userResponse = queryBox "请确认当前模型需要多套UV" title: "确认勾选" beep: false
				if userResponse == true then
				(					
					chk_UVChannel.checked = true
				)
				else
				(					
					chk_UVChannel.checked = false
				)
			)
		)
		on chk_UVOverflow changed state do
		(			
			if state == true then
			(				
				local userResponse = queryBox "请确认当前UV可以在除第一象限外的其它象限" title: "确认勾选" beep: false
				if userResponse == true then
				(					
					chk_UVOverflow.checked = true
				)
				else
				(					
					chk_UVOverflow.checked = false
				)
			)
		)
		on chk_UVFillRate changed state do
		(			
			if state == true then
			(				
				local userResponse = queryBox "请确认当前UV均匀无拉伸" title: "确认勾选" beep: false
				if userResponse == true then
				(					
					chk_UVFillRate.checked = true
				)
				else
				(					
					chk_UVFillRate.checked = false
				)
			)
		)
		on chk_UVPeelLayout changed state do
		(			
			if state == true then
			(				
				local userResponse = queryBox "请确认当前UV排布合理" title: "确认勾选" beep: false
				if userResponse == true then
				(					
					chk_UVPeelLayout.checked = true
				)
				else
				(					
					chk_UVPeelLayout.checked = false
				)
			)
		)
		on chk_MultiSubMaterial changed state do
		(			
			if state == true then
			(				
				local status = GEO_TOOLS.fn_GetObjectProp "MultiSubMat"
				if status then
				(					
					chk_MultiSubMaterial.checked = true
				)
				else
				(					
					messageBox "请确认当前模型需要多套贴图\n并使用多维子材质处理工具处理否则无法勾选"
					chk_MultiSubMaterial.checked = false
				)
			)
		)
		on chk_TextureQuality changed state do
		(			
			if state == true then
			(				
				local userResponse = queryBox "请确认当前模型已通过贴图质量检查" title: "确认勾选" beep: false
				if userResponse == true then
				(					
					chk_TextureQuality.checked = true
				)
				else
				(					
					chk_TextureQuality.checked = false
				)
			)
		)
	)
	rollout commonToolsRollout "其它常用工具"
	
	(		
		group "实用工具"
		
		(			
			-- 界面元素
			listbox scriptsList "可用脚本:" height: 15 items: #()
			button btnExecute "执行选中脚本" width: 220 align: #center
			button btnRefresh "刷新脚本列表" width: 220 align: #center
			button btnOpenFolder "打开脚本文件夹" width: 220 align: #center
		)
		/* 工具按钮事件 */
		-- 存储脚本路径
		local scriptFiles = #()
		-- 刷新脚本列表
		fn refreshScriptsList = 
		(			
			global AppOpenCheck = true
			-- 确保路径存在
			if scriptToolsPath == undefined or not doesFileExist scriptToolsPath do
			(				
				scriptToolsPath = baseScriptPath + "tools\\"
				makeDir scriptToolsPath
			)
			-- 获取所有.ms文件
			scriptFiles = #()
			local fileList = getFiles( scriptToolsPath + "*.mse" )
			local displayNames = #()
			-- 提取文件名
			for f in fileList do
			(				
				append scriptFiles f
				append displayNames( getFilenameFile f )
			)
			-- 更新列表
			scriptsList.items = displayNames
		)
		-- 执行选中脚本
		on btnExecute pressed do
		(			
			local sel = scriptsList.selection
			if sel > 0 and sel <= scriptFiles.count then
			(				
				local scriptFile = scriptFiles[sel]
				try
				(					
					fileIn scriptFile
					format "成功执行脚本: %\n" scriptFile
				)
				catch
				(					
					messageBox( "执行脚本失败:\n" + getCurrentException() )
				)
			)
			else
				messageBox "请先选择一个脚本"
		)
		-- 双击列表项执行脚本
		on scriptsList doubleClicked sel do
		(			
			if sel > 0 and sel <= scriptFiles.count then
			(				
				try
				(					
					fileIn scriptFiles[sel]
					format "成功执行脚本: %\n" scriptFiles[sel]
				)
				catch
				(					
					messageBox( "执行脚本失败:\n" + getCurrentException() )
				)
			)
		)
		-- 刷新按钮
		on btnRefresh pressed do
		(			
			refreshScriptsList()
		)
		-- 打开文件夹按钮
		on btnOpenFolder pressed do
		(			
			if scriptToolsPath != undefined and doesFileExist scriptToolsPath then
				shellLaunch "explorer.exe" scriptToolsPath
			else
				messageBox "脚本文件夹不存在"
		)
		-- 这里只保留必要的界面初始化事件
		on CheckToolRollout open do
		(			
			if UI_HANDLERS != undefined then
			(				
				refreshScriptsList()
				UI_HANDLERS.onUIOpen()
			)
		)
		on CheckToolRollout close do
		(			
			if UI_HANDLERS != undefined then
			(				
				UI_HANDLERS.onUIClose()
			)
		)
	)
	--------按钮事件------
	on btnBasicCheck pressed do
	(		
		refresh()
		clearListener()
		-- 检查当前选择的面板是否已经是basicSettingsRollout
		if currentRollout != basicSettingsRollout then
		(			
			-- 移除当前显示的子面板 
			rbTabs.state = 1
			if currentRollout != undefined do
				removeSubRollout mainSubRollout currentRollout
			-- 添加新选择的子面板                                                                                                                                                                                                                                                      
			currentRollout = basicSettingsRollout
			addSubRollout mainSubRollout currentRollout
		)
		UI_HANDLERS.fn_refreshUI()
		basicSettingsRollout.fn_btnBasicCheck()
	)
	on btnBasicFix pressed do
	(		
		basicSettingsRollout.fn_btnBasicFix()
	)
	on CheckForUpdates pressed do
	(		
		basicSettingsRollout.fn_CheckForUpdates()
		CheckToolRollout.lbResults.items = #( "检查完成" )
	)
	on btnGetResult pressed do
	(		
		basicSettingsRollout.fn_btnGetResult()
	)
	/*-------------------------------------------
		主面板事件处理
	-------------------------------------------*/
	-- 标签页切换事件                                                                                                                                                                                                                                                    
	-- state: 选择的标签索引 (1-2)                                                                                                                                                                                                                                                     
	on rbTabs changed state do
	(		
		try
		(			
			-- 移除当前显示的子面板                                                                                                                                                                                                                                                      
			if currentRollout != undefined do
				removeSubRollout mainSubRollout currentRollout
			-- 添加新选择的子面板                                                                                                                                                                                                                                                      
			if state > 0 and state <= allSubRollouts.count do
			(				
				currentRollout = allSubRollouts[state]
				addSubRollout mainSubRollout currentRollout
			)
			-- 如果切换到了commonToolsRollout，则刷新脚本列表
			if currentRollout == commonToolsRollout do
				commonToolsRollout.refreshScriptsList()
		)
		catch
		(			
			lbResults.items = #( "切换标签页时发生错误" )
		)
	)
	-- UI初始化事件，对话框打开时执行                                                                                                                                                                                                                                                     
	on CheckToolRollout open do
	(		
		try
		(			
			-- 初始化子面板数组 (只包含2个子面板)                                                                                                                                                                                                                                                      
			allSubRollouts = #(				
				basicSettingsRollout,
				commonToolsRollout
			)
			-- 默认显示第一个子面板 (基本设置检查)                                                                                                                                                                                                                                                      
			currentRollout = allSubRollouts[1]
			addSubRollout mainSubRollout currentRollout
			-- 初始化结果列表                                                                                                                                                                                                                                                      
			lbResults.items = #( "准备就绪，请选择检查项目" )
			-- 设置默认选中的标签页 (第一个)                                                                                                                                                                                                                                                      
			rbTabs.state = 1
		)
		catch
		(			
			print "初始化UI时发生错误"
		)
	)
)
-- 界面管理器（保持不变）
struct UIManager

(	
	dialog = undefined,
	fn create = 
	(		
		try( destroyDialog dialog ) catch()
		dialog = CheckToolRollout
		createDialog dialog style: #( #style_titlebar, #style_border, #style_sysmenu )
	),
	fn destroy = 
	(		
		try( destroyDialog dialog ) catch()
		dialog = undefined
	)
)
-- 创建全局界面管理器
global MyToolsUI = UIManager()
-- 打开界面
format "界面布局加载完成\n"
