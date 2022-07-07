
var keys=new Array(8,9,13,33,34,35,36,37,39,45,46,47,191);

function FormatDate()
{    
    var date_str=document.activeElement.value;
    var count=0;
    for(var i=0;i<date_str.length;i++)
    {
       if(document.activeElement.value.charAt(i)=='/')
          count++;
    }
    d = new Date();
    // not enter slash to beginning
    if(event.keyCode==47 && date_str.length==0)
    {
        event.returnValue=false;
        return;        
    } 
    // if slash after slash, not enter
    if(event.keyCode==47 && document.activeElement.value.charAt(date_str.length-1)=='/')
    {
        event.returnValue=false;
        return;        
    }   
    // if already two slashes, enter data as is
    if(count==2)
    {
        //event.returnValue=false;
        return;        
    }    
    
    // check month
    if(date_str.length==0 && event.keyCode!=48 && event.keyCode!=49
     && event.keyCode!=96 && event.keyCode!=97 && event.keyCode!=47)
    {
        document.activeElement.value+=String.fromCharCode(event.keyCode);
        document.activeElement.value+="/";    
        event.returnValue=false;
        return;
    }
    else if(date_str.length==1 && document.activeElement.value.charAt(0)=='1'
     && event.keyCode!=47 && event.keyCode!=48 && event.keyCode!=49 && event.keyCode!=50
    && event.keyCode!=96 && event.keyCode!=97 && event.keyCode!=98)
    {
        // check second month digit - if not valid, add slash first
        // if > 2 then complete the date
        if(event.keyCode!=51 && event.keyCode!=99)
        {
        	document.activeElement.value+="/";
			document.activeElement.value+=String.fromCharCode(event.keyCode);
			document.activeElement.value+="/"; 
			document.activeElement.value+=d.getFullYear();   
			event.returnValue=false;
        }
        else
        {
			document.activeElement.value+="/";
        } 
        return;       
    }
       
    
    if(count==1 && document.activeElement.value.charAt(date_str.length-1)=='3' &&
     (document.activeElement.value.charAt(0)=='4' ||
      document.activeElement.value.charAt(0)=='6' ||
      document.activeElement.value.charAt(0)=='9' ||
     (document.activeElement.value.charAt(0)=='1' &&
      document.activeElement.value.charAt(1)=='1')) &&
     event.keyCode!=48 && event.keyCode!=96 && event.keyCode!=47)
    {
        // check second day digit (30 days)  
        event.returnValue=false;
        return;
    }
    else if(count==1 && document.activeElement.value.charAt(date_str.length-1)=='3' &&
     ((document.activeElement.value.charAt(0)=='1' && 
       document.activeElement.value.charAt(1)=='/') ||
       document.activeElement.value.charAt(0)=='3' ||
       document.activeElement.value.charAt(0)=='5' ||
       document.activeElement.value.charAt(0)=='7' ||
       document.activeElement.value.charAt(0)=='8' ||     
      (document.activeElement.value.charAt(0)=='1' &&
       document.activeElement.value.charAt(1)=='0')  ||
      (document.activeElement.value.charAt(0)=='1' &&
       document.activeElement.value.charAt(1)=='2')) &&
      event.keyCode!=48 && event.keyCode!=96 && event.keyCode!=49 && event.keyCode!=97
       && event.keyCode!=47)
    {
        // check second day digit (31 days)  
        event.returnValue=false;
        return;
    }
    
        // 2/3/2003
    if(count==1 && document.activeElement.value.charAt(0)=='2' &&
       (event.keyCode==51 || event.keyCode==99) )
    {
        document.activeElement.value+=String.fromCharCode(event.keyCode);
        document.activeElement.value+="/"; 
        document.activeElement.value+=d.getFullYear();   
        event.returnValue=false;
        return;
    }    
    
        // check day (the first digit)
    if(count==1 && document.activeElement.value.charAt(date_str.length-1)=='/'
    && event.keyCode!=48 && event.keyCode!=49 && event.keyCode!=50 &&
    event.keyCode!=51 && event.keyCode!=96 && event.keyCode!=97 &&
    event.keyCode!=98 && event.keyCode!=99)
    {
        document.activeElement.value+=String.fromCharCode(event.keyCode);
        document.activeElement.value+="/"; 
        document.activeElement.value+=d.getFullYear();   
        event.returnValue=false;
        return;
    }
    else if(count==1 && document.activeElement.value.charAt(date_str.length-1)!='/' &&
        event.keyCode!=47)
    {
        document.activeElement.value+=String.fromCharCode(event.keyCode);
        document.activeElement.value+="/"; 
        document.activeElement.value+=d.getFullYear();   
        event.returnValue=false;
        return;
    }

    if(count==1 && event.keyCode==47)
    {
        document.activeElement.value+="/";    
        document.activeElement.value+=d.getFullYear();
        event.returnValue=false;
        return;
    }
    if(date_str.length==2 && count==0 && event.keyCode!=47)
        document.activeElement.value+="/";
    else if(date_str.length==4 /*&& document.activeElement.value.charAt(1)=='/' &&
    document.activeElement.value.charAt(3)!='/'*/ && event.keyCode!=47)
     {
        document.activeElement.value+=String.fromCharCode(event.keyCode);
        document.activeElement.value+="/";
        document.activeElement.value+=d.getFullYear();
        event.returnValue=false;
     }       
    else if(date_str.length==5 && document.activeElement.value.charAt(4)!='/'
    && event.keyCode!=47)
     {
        document.activeElement.value+="/";
        document.activeElement.value+=d.getFullYear();
        event.returnValue=false;
     }
    
    // if two digit for month, add slash 
    if(date_str.length==1 && count==0 && event.keyCode!=47)
    {
        document.activeElement.value+=String.fromCharCode(event.keyCode);
        document.activeElement.value+="/";    
        event.returnValue=false;
        return;
    }     
}

function FormatPhoneNo()
{
    if(event.keyCode==9)
    {
        if(document.activeElement.value[0]!='(')
        {
            document.activeElement.value="(";
        }
    }    
          
    var home_phone=document.activeElement.value;
    if(home_phone.length==0 || home_phone.length==1)
		{	
		    if(document.activeElement.value.charAt(0)!='(')
		    {
		        document.activeElement.value="("+document.activeElement.value;
		    }    
		}
    else if(home_phone.length==4)
        document.activeElement.value+=") ";
    else if(home_phone.length==9)
        document.activeElement.value+="-";      
}
function SetIndexOrValidate(keyCode, nextcontrol)
{
    if(event.keyCode==9)
    {
		if(document.getElementById("HRTabStrip").selectedIndex<4)
		{
			document.getElementById("HRTabStrip").selectedIndex++;
			document.getElementById(nextcontrol).focus();
			
		}
	}
	else
	{
        event.returnValue = ((keyCode>=48 && keyCode<=57) || (keyCode>=96 && keyCode<=105) || isAuxKey(keyCode));
    }
}

function SetIndex(keyCode, nextcontrol)
{
    if(event.keyCode==9)
    {
		if(document.getElementById("HRTabStrip").selectedIndex<4)
		{
			document.getElementById("HRTabStrip").selectedIndex++;
			document.getElementById(nextcontrol).focus();
		}
	}
}

function isKeyValid(keyCode)
{
    event.returnValue = ((keyCode>=48 && keyCode<=57) || (keyCode>=96 && keyCode<=105) || isAuxKey(keyCode));
}
function isAuxKey(keyCode)
{
    for(i=0; i<keys.length; i++)
    {
        if(keyCode==keys[i])
        {
            return true;
        }
    }
    return false;        
}