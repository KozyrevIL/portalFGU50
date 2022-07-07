	FadeObjects = new Object();
		function Fade1(object,delta)
		{
			if (!document.all)
			return
	  		object.filters.alpha.opacity=delta;
			FadeObjects[object.sourceIndex]=object;
	   	}