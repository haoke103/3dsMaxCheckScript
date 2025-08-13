macroScript AutoMZP_Maker category: "MaxCheckScript" tooltip: "MaxCheckScript" Icon: #( "MaxCheckScript", 1 )

(	
	fileIn( ( getDir #userscripts )+ "\\MaxCheckScript\\main.mse" ) quiet: true
)
colorman.reInitIcons()
messageBox "3dmax规范检查脚本已安装，请按照教程添加图标使用。" 