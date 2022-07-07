
		//Visible or Hide Elements
			function KnowDropDownList(id_element,hideText,countHideElement,id_hide_element1,id_hide_element2)
			{
				
				var index=eval('document.all.'+id_element+'.selectedIndex');
			
					text_index=eval('document.all.'+id_element+'.options['+index+'].text');
					
				for (var i=1;i<countHideElement+1;i++)
				{	
					strElement=eval('id_hide_element'+i);
					if (text_index==hideText)
					{
						eval("document.all."+strElement+".className='ElementDel'");
					}
					else
					{
						eval("document.all."+strElement+".className='ElementAdd'");
					}
				}
			}
		//Check choose options KnowBBDropDownList
		