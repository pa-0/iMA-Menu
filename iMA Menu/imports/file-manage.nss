﻿menu(where=sel.count>0 type='file|dir|drive|namespace|back' mode="multiple" title='Manage' image=\uE253)
{

	item(mode="single" type="file" title="Extension" pos="4" vis=key.shift() image=\uE0B5 cmd=if(input("Change extension", "To"), 
		io.rename(sel.path, path.join(sel.dir, sel.file.title + "." + input.result))))
	

	item(type='file|dir|back.dir|drive' vis=key.shift() title='Take Ownership' image=[\uE194,#f00] admin
		cmd args='/K takeown /f "@sel.path" @if(sel.type==1,null,"/r /d y") && icacls "@sel.path" /grant *S-1-5-32-544:F @if(sel.type==1,"/c /l","/t /c /l /q")')
	


item(title='Search' cmd='@app.dir\script\search.bat' image=\uE186)
item(title='Draw' cmd='@app.dir\script\draw.pyw' image=\uE116)


	menu(mode="single" type='file' find='.dll|.ocx' separator="before" title='Register Server' image=\uea86)
	{
		item(title='Register' admin cmd='regsvr32.exe' args='@sel.path.quote' invoke="multiple")
		item(title='Unregister' admin cmd='regsvr32.exe' args='/u @sel.path.quote' invoke="multiple")
	}

	menu(mode="single" type='back' expanded=true)
	{	

	}
	
item(title='Clean' cmd='@app.dir\script\cleantemp.bat' image=\uE0CE)
item(title='Color' cmd='@app.dir\script\hex.py' image=\uE0BF)

        
}